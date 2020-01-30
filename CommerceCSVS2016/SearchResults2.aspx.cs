using ASPNET.StarterKit.Commerce.AzureFeatures;
using IBuySpyCommon.Models;
using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.DataContracts;
using Microsoft.ApplicationInsights.Extensibility;
using Microsoft.ApplicationInsights.Web;
using Microsoft.Azure.Search;
using Microsoft.Azure.Search.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNET.StarterKit.Commerce
{
    public partial class SearchResults2 : System.Web.UI.Page
    {
        //private static SearchServiceClient _searchClient;
        private static SearchIndexClient _indexClient;
        private const string ProductsIndexName = "productindex";
        //private static string CategoryIndexName = "categories";
        private static readonly TelemetryClient _appInsights = new TelemetryClient();

        public static string errorMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            string term = Request.Params[IBuySpyCommon.Strings.QueryStrings.Searchterm];
            string productSearchTerm = string.Empty;
            errorPanel.Visible = false;
            resultsPanel.Visible = false;
            EventTelemetry searchEvent = new EventTelemetry();
            // Search database using the supplied "txtSearch" parameter
            _appInsights.InstrumentationKey = TelemetryConfiguration.Active.InstrumentationKey;

            //Parse for bad input
            if (!string.IsNullOrEmpty(term))
            {
                productSearchTerm = HttpUtility.HtmlEncode(term);
            }

            searchEvent.Name = "search";
            searchEvent.Properties.Add("searchpage", "search2");
            searchEvent.Properties.Add("searchterm", productSearchTerm);
            _appInsights.TrackPageView("searchresults2");

            // Databind and display the list of favorite product items
            try
            {
                int productsFound = 0;
                if (!string.IsNullOrEmpty(productSearchTerm))
                {
                    // Send the event:
                    // Create an HTTP reference to the catalog index
                    //_searchClient = CreateSearchServiceClient();
                    _indexClient = CreateSearchIndexClient();
                    List<ProductSearchResult> products = SearchProducts(term);
                    MyList2.DataSource = products;
                    MyList2.DataBind();
                    productsFound = products.Count;
                    errorPanel.Visible = false;
                    resultsPanel.Visible = true;
                }

                if (productsFound > 0)
                {
                    //We found some results
                    searchEvent.Properties.Add("results", productsFound.ToString());
                }
                else
                {
                    //No search results found
                    searchEvent.Properties.Add("noresultsfound", productSearchTerm);
                    _appInsights.TrackEvent(searchEvent);
                    errorPanel.Visible = true;
                    resultsPanel.Visible = false;
                }
                //Send an event
                _appInsights.TrackEvent(searchEvent);
            }
            catch (Exception ex)
            {
                //TODO: If we cannot connect to the search service, fall back to regular search
                ExceptionTelemetry searchException = new ExceptionTelemetry(ex)
                {
                    Message = "Unable to execute search. Disabling Azure search"
                };
                _appInsights.TrackException(searchException);

                ConfigurationManager.AppSettings["UseAzureSearch"] = false.ToString();
                Response.Redirect($"searchresults.aspx?t={term}", true);
            }

            searchTerm.Text = term;
            // Display a message if no results are found
            if (MyList2.Items.Count == 0)
            {
                ErrorMsg2.Text = $"No items matched your query [{productSearchTerm}].";
                errorPanel.Visible = true;
                resultsPanel.Visible = false;
            }
            else
            {
                errorPanel.Visible = false;
                resultsPanel.Visible = true;
            }
        }

        //private static SearchServiceClient CreateSearchServiceClient()
        //{
        //    string searchServiceName = ConfigurationManager.AppSettings["SearchServiceName"];
        //    string adminApiKey = ConfigurationManager.AppSettings["SearchServiceAdminApiKey"];

        //    SearchServiceClient serviceClient = new SearchServiceClient(searchServiceName, new SearchCredentials(adminApiKey));
        //    return serviceClient;
        //}

        private static SearchIndexClient CreateSearchIndexClient()
        {
            string searchServiceName = ConfigurationManager.AppSettings["SearchServiceName"];
            string queryApiKey = ConfigurationManager.AppSettings["SearchServiceQueryApiKey"];

            SearchIndexClient indexClient = new SearchIndexClient(searchServiceName, ProductsIndexName, new SearchCredentials(queryApiKey));
            return indexClient;
        }

        private static List<ProductSearchResult> SearchProducts(string searchterm)
        {
            List<ProductSearchResult> results = new List<ProductSearchResult>();
            DocumentSearchResult<Document> azureSearchResults;

            try
            {
                SearchParameters sp = new SearchParameters() { SearchMode = SearchMode.All };
                azureSearchResults = _indexClient.Documents.Search(searchterm, sp);
                if (azureSearchResults.Results.Count > 0)
                {
                    foreach (var d in azureSearchResults.Results)
                    {
                        ProductSearchResult p = new ProductSearchResult()
                        {
                            ProductId = d.Document["ProductID"].ToString(),
                            Description = d.Document["Description"].ToString(),
                            ModelName = d.Document["ModelName"].ToString(),
                            ModelNumber = d.Document["ModelNumber"].ToString(),
                            ProductImage = IBuySpyFeatures.BuildProductImageUrl(d.Document["ProductImage"].ToString(), IBuySpyCommon.RuntimeConstants.ImageSize.Medium),
                            UnitCost = double.Parse(String.Format("{0:c}", d.Document["UnitCost"].ToString()))
                        };
                        results.Add(p);
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = $"Error querying index: {ex.Message.ToString()}\r\n";
                ExceptionTelemetry searchException = new ExceptionTelemetry(ex)
                {
                    Message = "An error occured acessing the search service"
                };
                _appInsights.TrackException(searchException);
            }

            return results;
        }
    }
}
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ASPNET.StarterKit.Commerce.AzureFeatures;

namespace ASPNET.StarterKit.Commerce {

    public class SearchResults : System.Web.UI.Page {

        protected System.Web.UI.WebControls.DataList MyList;
        protected System.Web.UI.WebControls.Label ErrorMsg;
        protected System.Web.UI.WebControls.Panel OriginalUi;

        protected System.Web.UI.WebControls.Panel NewUi;
        protected System.Web.UI.WebControls.DataList MyList2;
        protected System.Web.UI.WebControls.Label ErrorMsg2;
        protected System.Web.UI.WebControls.Panel errorPanel;
        protected System.Web.UI.WebControls.Panel resultsPanel;
        protected System.Web.UI.WebControls.Label searchTerm;

        public SearchResults() {
            Page.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The Page_Load event on this page is used to obtain
        // from a database a collection of all products whose
        // description or name meets a specified search criteria.
        //
        // Note that the search string to use is specified using
        // a querystring argument to the page.
        //
        //*******************************************************

        private void Page_Load(object sender, System.EventArgs e) {

            string term = Request.Params[IBuySpyCommon.Strings.QueryStrings.Searchterm];
            // Search database using the supplied "txtSearch" parameter
            ASPNET.StarterKit.Commerce.ProductsDB productCatalogue = new ASPNET.StarterKit.Commerce.ProductsDB();

            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                errorPanel.Visible = false;
                resultsPanel.Visible = false;

                NewUi.Visible = true;
                OriginalUi.Visible = false;
                // Databind and display the list of favorite product items
                MyList2.DataSource = productCatalogue.SearchProductDescriptions(term);
                MyList2.DataBind();

                searchTerm.Text = term;
                // Display a message if no results are found
                if (MyList2.Items.Count == 0)
                {
                    ErrorMsg2.Text = "No items matched your query.";
                    errorPanel.Visible = true;
                    resultsPanel.Visible = false;
                }
                else
                {
                    errorPanel.Visible = false;
                    resultsPanel.Visible = true;
                }
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
                MyList.DataSource = productCatalogue.SearchProductDescriptions(term);
                MyList.DataBind();

                // Display a message if no results are found
                if (MyList.Items.Count == 0)
                {
                    ErrorMsg.Text = "No items matched your query.";
                }

            }
        }

        private void Page_Init(object sender, EventArgs e) {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
        }

		#region Web Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {    
            this.Load += new System.EventHandler(this.Page_Load);

        }
		#endregion

    }
}

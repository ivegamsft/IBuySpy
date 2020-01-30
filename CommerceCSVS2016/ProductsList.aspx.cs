using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ASPNET.StarterKit.Commerce.AzureFeatures;

namespace ASPNET.StarterKit.Commerce {

    public class ProductsList : System.Web.UI.Page {

        protected System.Web.UI.WebControls.DataList MyList;
        protected System.Web.UI.WebControls.Panel OriginalUi;

        protected System.Web.UI.WebControls.Panel NewUi;
        protected System.Web.UI.WebControls.DataList MyList2;


        public ProductsList() {
            Page.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The Page_Load event on this page is used to obtain
        // from a database a collection of all products within a
        // specified product category.  The collection is then
        // databound to a templated asp:datalist control.
        //
        // The product category to obtain is specified using
        // a querystring argument to the page.
        //
        // Note that this page is output cached at 1 hour
        // intervals.  This eliminates the need to hit the database
        // on each request to the page.
        //
        //*******************************************************

        private void Page_Load(object sender, System.EventArgs e) {

            // Obtain categoryId from QueryString
            int categoryId = 0;
            string catId = Request.Params[IBuySpyCommon.Strings.QueryStrings.CategoryId];
            if (!string.IsNullOrEmpty(catId))
            {
                categoryId = Int32.Parse(Request.Params[IBuySpyCommon.Strings.QueryStrings.CategoryId]);
            }
            // Obtain products and databind to an asp:datalist control
            ASPNET.StarterKit.Commerce.ProductsDB productCatalogue = new ASPNET.StarterKit.Commerce.ProductsDB();

            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                NewUi.Visible = true;
                OriginalUi.Visible = false;
                // Databind and display the list of favorite product items
                MyList2.DataSource = productCatalogue.GetProducts(categoryId);
                MyList2.DataBind();
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
                // Databind and display the list of favorite product items
                MyList.DataSource = productCatalogue.GetProducts(categoryId);
                MyList.DataBind();
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

using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ASPNET.StarterKit.Commerce.AzureFeatures;

namespace ASPNET.StarterKit.Commerce {

    public abstract class C_AlsoBought : System.Web.UI.UserControl {

        protected System.Web.UI.WebControls.Repeater alsoBoughtList;
        protected System.Web.UI.WebControls.Panel OriginalUi;

        protected System.Web.UI.WebControls.Panel NewUi;
        protected System.Web.UI.WebControls.Repeater alsoBoughtList2;

        public int ProductID;

        public C_AlsoBought() {
            this.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The Page_Load event on this page is used to obtain
        // from a database a collection of other products
        // that customers who purchased a product "also bought".
        //
        //*******************************************************
        private void Page_Load(object sender, System.EventArgs e) {

            // Obtain list of products that people who "also bought" an item have purchased.  Databind to list control
            ASPNET.StarterKit.Commerce.ProductsDB productCatalogue = new ASPNET.StarterKit.Commerce.ProductsDB();
        
            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                NewUi.Visible = true;
                OriginalUi.Visible = false;
                alsoBoughtList2.DataSource = productCatalogue.GetProductsAlsoPurchased(ProductID);
                alsoBoughtList2.DataBind();

                // Hide the list if no items are in it
                if (alsoBoughtList2.Items.Count == 0)
                {
                    alsoBoughtList2.Visible = false;
                }
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
                alsoBoughtList.DataSource = productCatalogue.GetProductsAlsoPurchased(ProductID);
                alsoBoughtList.DataBind();

                // Hide the list if no items are in it
                if (alsoBoughtList.Items.Count == 0)
                {
                    alsoBoughtList.Visible = false;
                }
            }
            //#### SPECIAL FEATURE WITH FLAG - NEW UI

        }

        private void Page_Init(object sender, EventArgs e) {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
        }

		#region Web Form Designer generated code
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.Load += new System.EventHandler(this.Page_Load);

        }
		#endregion
    }
}

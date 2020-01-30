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

	public class ProductDetailsPage : System.Web.UI.Page {

		protected System.Web.UI.WebControls.Label ModelName;
		protected System.Web.UI.WebControls.Image ProductImage;
		protected System.Web.UI.WebControls.Label UnitCost;
		protected System.Web.UI.WebControls.Label ModelNumber;
		protected System.Web.UI.WebControls.HyperLink addToCart;
		protected System.Web.UI.WebControls.Label desc;
		protected System.Web.UI.WebControls.Panel OriginalUi;
		protected C_ReviewList ReviewList;
		protected C_AlsoBought AlsoBoughtList;

		protected System.Web.UI.WebControls.Panel NewUi;
		protected System.Web.UI.WebControls.Label ModelName2;
		protected System.Web.UI.WebControls.Image ProductImage2;
		protected System.Web.UI.WebControls.Label UnitCost2;
		protected System.Web.UI.WebControls.Label ModelNumber2;
		protected System.Web.UI.WebControls.HyperLink addToCart2;
		protected System.Web.UI.WebControls.Label desc2;

		protected C_ReviewList ReviewList2;
		protected C_AlsoBought AlsoBoughtList2;


		public ProductDetailsPage() {
			Page.Init += new System.EventHandler(Page_Init);
		}

		//*******************************************************
		//
		// The Page_Load event on this page is used to obtain
		// product information from a database and then update
		// UI elements with them.
		//
		// Note that this page is output cached at 1 minute
		// intervals.  This eliminates the need to hit the database
		// on each request to the page.
		//
		//*******************************************************

		private void Page_Load(object sender, System.EventArgs e) {

			// Obtain ProductID from QueryString
			int ProductID = Int32.Parse(Request.Params[IBuySpyCommon.Strings.QueryStrings.ProductId]);

			// Obtain Product Details
			ASPNET.StarterKit.Commerce.ProductsDB products = new ASPNET.StarterKit.Commerce.ProductsDB();
			ASPNET.StarterKit.Commerce.ProductDetails myProductDetails = products.GetProductDetails(ProductID);

			// Update Controls with Product Details
			//#### SPECIAL FEATURE WITH FLAG - NEW UI
			if (IBuySpyFeatures.ShowNewUI())
			{
				NewUi.Visible = true;
				OriginalUi.Visible = false;
				desc2.Text = myProductDetails.Description;
				UnitCost2.Text = String.Format("{0:c}", myProductDetails.UnitCost);
				ModelName2.Text = myProductDetails.ModelName;
				ModelNumber2.Text = myProductDetails.ModelNumber.ToString();

                //#### SPECIAL FEATURE WITH FLAG - BLOBS FOR IMAGES
                ProductImage2.ImageUrl = IBuySpyFeatures.BuildProductImageUrl(myProductDetails.ProductImage, IBuySpyCommon.RuntimeConstants.ImageSize.XLarge);
                //#### SPECIAL FEATURE WITH FLAG - BLOBS FOR IMAGES

                addToCart2.NavigateUrl = "AddToCart.aspx?ProductID=" + ProductID;
                ReviewList2.ProductID = ProductID;
                AlsoBoughtList2.ProductID = ProductID;
            }
            else
			{
				NewUi.Visible = false;
				OriginalUi.Visible = true;
				desc.Text = myProductDetails.Description;
				UnitCost.Text = String.Format("{0:c}", myProductDetails.UnitCost);
				ModelName.Text = myProductDetails.ModelName;
				ModelNumber.Text = myProductDetails.ModelNumber.ToString();
                //#### SPECIAL FEATURE WITH FLAG - BLOBS FOR IMAGES
                ProductImage.ImageUrl = IBuySpyFeatures.BuildProductImageUrl(myProductDetails.ProductImage, IBuySpyCommon.RuntimeConstants.ImageSize.XLarge);
                //#### SPECIAL FEATURE WITH FLAG - BLOBS FOR IMAGES

                addToCart.NavigateUrl = $"AddToCart.aspx?{IBuySpyCommon.Strings.QueryStrings.ProductId}={ProductID}";
                ReviewList.ProductID = ProductID;
                AlsoBoughtList.ProductID = ProductID;
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

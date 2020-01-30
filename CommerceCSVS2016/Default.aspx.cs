using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Security.Claims;
using ASPNET.StarterKit.Commerce.AzureFeatures;

namespace ASPNET.StarterKit.Commerce {

    public class CDefault : System.Web.UI.Page {

        protected System.Web.UI.WebControls.Label WelcomeMsg;
        protected System.Web.UI.WebControls.Panel OriginalUi;

        protected System.Web.UI.WebControls.Panel NewUi;
        protected System.Web.UI.WebControls.Label WelcomeMsg2;

        public CDefault() {
            Page.Init += new System.EventHandler(Page_Init);
            Page.PreInit += new System.EventHandler(Page_PreInit);
        }

        private void Page_PreInit(object sender, EventArgs e)
        {
            if (IBuySpyFeatures.ShowNewUI())
            {
                Page.MasterPageFile = "SplashLayout.master";
            }
        }


        //*******************************************************
        //
        // The Page_Load event on this page is used to personalize
        // the welcome message seen by returning Commerce Starter Kit users.
        // It does this by retrieving a client-side cookie
        // (persisted on the client in the Login.aspx and
        // register.aspx pages) and updating a label control.
        //
        //*******************************************************

        private void Page_Load(object sender, System.EventArgs e)
        {
            string userName = string.Empty;

            // Customize welcome message if personalization cookie is present
            if (Request.Cookies["ASPNETCommerce_FullName"] != null) {
                userName = "Welcome " +  ClaimsPrincipal.Current.FindFirst(ClaimsPrincipal.Current.Identities.First().NameClaimType).Value;
            }
            
            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                NewUi.Visible = true;
                OriginalUi.Visible = false;
                WelcomeMsg2.Text = userName;
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
                WelcomeMsg.Text = userName;
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

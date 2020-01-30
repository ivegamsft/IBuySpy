using ASPNET.StarterKit.Commerce.AzureFeatures;
using System;
using System.Data;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web.Security;

namespace ASPNET.StarterKit.Commerce
{

    public abstract class C_Header : System.Web.UI.UserControl
    {
        protected System.Web.UI.WebControls.TextBox email;
        protected System.Web.UI.WebControls.TextBox password;
        protected System.Web.UI.WebControls.CheckBox RememberLogin;
        protected System.Web.UI.WebControls.TextBox SearchText;

        protected System.Web.UI.WebControls.Panel OriginalUi;

        protected System.Web.UI.WebControls.Panel NewUi;
        protected System.Web.UI.WebControls.TextBox email2;
        protected System.Web.UI.WebControls.TextBox password2;
        protected System.Web.UI.WebControls.CheckBox RememberLogin2;
        protected System.Web.UI.WebControls.TextBox SearchText2;

        public C_Header()
        {
            this.Init += new System.EventHandler(Page_Init);
        }

        private void Page_Load(object sender, System.EventArgs e)
        {

            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                NewUi.Visible = true;
                OriginalUi.Visible = false;
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
            }
            //#### SPECIAL FEATURE WITH FLAG - NEW UI
        }

        private void Page_Init(object sender, EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
        }

        #region Web Form Designer generated code
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }
        #endregion

        protected void login_Click(object sender, EventArgs e)
        {
            // Save old ShoppingCartID
            ASPNET.StarterKit.Commerce.ShoppingCartDB shoppingCart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();
            String tempCartID = shoppingCart.GetShoppingCartId();

            // Attempt to Validate User Credentials using CustomersDB
            ASPNET.StarterKit.Commerce.CustomersDB accountSystem = new ASPNET.StarterKit.Commerce.CustomersDB();
            String customerIdClaim = accountSystem.Login(email.Text, ASPNET.StarterKit.Commerce.Security.Encrypt(password.Text));
            if (!Request.IsAuthenticated)
            {
                if (customerIdClaim != null)
                {

                    // Migrate any existing shopping cart items into the permanent shopping cart
                    shoppingCart.MigrateCart(tempCartID, customerIdClaim);

                    // Lookup the customer's full account details
                    ASPNET.StarterKit.Commerce.CustomerDetails customerDetails = accountSystem.GetCustomerDetails(customerIdClaim);

                    // Store the user's fullname in a cookie for personalization purposes
                    Response.Cookies["ASPNETCommerce_FullName"].Value = ClaimsPrincipal.Current.Identities.First().Claims.Where(c => c.Type == ClaimTypes.GivenName).ToString();

                    // Redirect browser back to originating page
                    FormsAuthentication.RedirectFromLoginPage(customerIdClaim, RememberLogin.Checked);
                }
                else
                {
                    //Message.Text = "Login Failed!";
                }
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            StringBuilder searchUrl = new StringBuilder();
            string searchTerm = string.Empty;

            if (IBuySpyFeatures.ShowNewUI())
            {
                searchTerm = SearchText2.Text;
            }
            else
            {
                searchTerm = SearchText.Text;
            }

            if (!string.IsNullOrEmpty(searchTerm))
            {
                //### USE FEATURE FLAG FOR Search setting. If using Azure search, redirect to the new experience
                //If we are using Azure Search, we need to redirect them to the new experience
                if (IBuySpyFeatures.UseAzureSearch())
                {
                    searchUrl.AppendFormat("searchresults2.aspx?t={0}", searchTerm);
                }
                else
                {
                    searchUrl.AppendFormat("searchresults.aspx?t={0}", searchTerm);
                }

                Page.Response.Redirect(searchUrl.ToString());
            }
        }
    }
}

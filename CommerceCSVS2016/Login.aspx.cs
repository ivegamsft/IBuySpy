using ASPNET.StarterKit.Commerce.AzureFeatures;
using System;
using System.Linq;
// The following using statements were added for this sample.
using System.Security.Claims;
using System.Web.Security;
using System.Web.UI;

namespace ASPNET.StarterKit.Commerce
{

    public class Login : System.Web.UI.Page
    {

        protected System.Web.UI.WebControls.Label Message;
        protected System.Web.UI.WebControls.TextBox email;
        protected System.Web.UI.WebControls.RequiredFieldValidator emailRequired;
        protected System.Web.UI.WebControls.RegularExpressionValidator emailValid;
        protected System.Web.UI.WebControls.TextBox password;
        protected System.Web.UI.WebControls.RequiredFieldValidator passwordRequired;
        protected System.Web.UI.WebControls.CheckBox RememberLogin;
        protected System.Web.UI.WebControls.ImageButton LoginBtn;

        protected System.Web.UI.WebControls.Panel OriginalUi;
        protected System.Web.UI.WebControls.Panel NewUi;

        protected System.Web.UI.WebControls.Label Message2;
        protected System.Web.UI.WebControls.TextBox email2;
        protected System.Web.UI.WebControls.RequiredFieldValidator emailRequired2;
        protected System.Web.UI.WebControls.RegularExpressionValidator emailValid2;
        protected System.Web.UI.WebControls.TextBox password2;
        protected System.Web.UI.WebControls.RequiredFieldValidator passwordRequired2;
        protected System.Web.UI.WebControls.CheckBox RememberLogin2;
        protected System.Web.UI.WebControls.Button LoginBtn2;

        public Login()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The LoginBtn_Click event is used on this page to
        // authenticate a customer's supplied username/password
        // credentials against a database.
        //
        // If the supplied username/password are valid, then
        // the event handler adds a cookie to the client
        // (so that we can personalize the home page's welcome
        // message), migrates any items stored in the user's
        // temporary (non-persistent) shopping cart to their
        // permanent customer account, and then redirects the browser
        // back to the originating page.
        //
        //*******************************************************

        private void LoginBtn_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            // Only attempt a login if all form fields on the page are valid
            if (Page.IsValid == true)
            {

                string customerId = LoginUser(email.Text, password.Text);
                if (!string.IsNullOrEmpty(customerId))
                {
                    // Make the cookie persistent only if the user selects "persistent" login checkbox
                    if (RememberLogin.Checked == true)
                    {
                        Response.Cookies["ASPNETCommerce_FullName"].Expires = DateTime.Now.AddMonths(1);
                    }

                    // Redirect browser back to originating page
                    FormsAuthentication.RedirectFromLoginPage(customerId, RememberLogin.Checked);
                }
                else
                {
                    Message.Text = "Login failed. Customer id not found";
                }
            }
            else
            {
                Message.Text = "Login Failed!";
            }
        }

        private void LoginBtn2_Click(object sender, EventArgs e)
        {
            // Only attempt a login if all form fields on the page are valid
            if (Page.IsValid == true)
            {

                string customerId = LoginUser(email2.Text, password2.Text);
                if (!string.IsNullOrEmpty(customerId))
                {
                    // Make the cookie persistent only if the user selects "persistent" login checkbox
                    if (RememberLogin2.Checked == true)
                    {
                        Response.Cookies["ASPNETCommerce_FullName"].Expires = DateTime.Now.AddMonths(1);
                    }

                    // Redirect browser back to originating page
                    FormsAuthentication.RedirectFromLoginPage(customerId, RememberLogin.Checked);
                }
                else
                {
                    Message2.Text = "Login failed. Customer id not found";
                }
            }
            else
            {
                Message2.Text = "Login Failed!";
            }
        }
        string LoginUser(string userId, string password)
        {
            // Save old ShoppingCartID
            ASPNET.StarterKit.Commerce.ShoppingCartDB shoppingCart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();
            String tempCartID = shoppingCart.GetShoppingCartId();

            // Attempt to Validate User Credentials using CustomersDB
            ASPNET.StarterKit.Commerce.CustomersDB accountSystem = new ASPNET.StarterKit.Commerce.CustomersDB();
            String customerId = accountSystem.Login(userId, ASPNET.StarterKit.Commerce.Security.Encrypt(password));

            if (!string.IsNullOrEmpty(customerId))
            {
                shoppingCart.MigrateCart(tempCartID, customerId);

                // Lookup the customer's full account details
                ASPNET.StarterKit.Commerce.CustomerDetails customerDetails = accountSystem.GetCustomerDetails(customerId);
                if (customerDetails != null)
                {
                    // Store the user's fullname in a cookie for personalization purposes
                    Response.Cookies["ASPNETCommerce_FullName"].Value = customerDetails.FullName;
                }
            }

            return customerId;
        }

        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here

            // Update Controls with Product Details
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
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.LoginBtn.Click += new System.Web.UI.ImageClickEventHandler(this.LoginBtn_Click);
            this.LoginBtn2.Click += new EventHandler(this.LoginBtn2_Click);

            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
    }
}

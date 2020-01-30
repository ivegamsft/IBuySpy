using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ASPNET.StarterKit.Commerce.AzureFeatures;

namespace ASPNET.StarterKit.Commerce
{

    public class CheckOut : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Message;
        protected System.Web.UI.WebControls.DataGrid MyDataGrid;
        protected System.Web.UI.WebControls.Label TotalLbl;
        protected System.Web.UI.WebControls.ImageButton SubmitBtn;

        protected System.Web.UI.WebControls.Panel OriginalUi;
        protected System.Web.UI.WebControls.Panel NewUi;

        protected System.Web.UI.WebControls.Label Header2;
        protected System.Web.UI.WebControls.Label Message2;
        protected System.Web.UI.WebControls.DataGrid MyDataGrid2;
        protected System.Web.UI.WebControls.Label TotalLbl2;
        protected System.Web.UI.WebControls.Button SubmitBtn2;

        public CheckOut()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The Page_Load event on this page is used to load the
        // ShoppingCart DataGrid *the first time* the page is
        // accessed.
        //
        // Note that subsequent postbacks to the page *do not*
        // reload the Datagrid.  Instead, we rely on the control's
        // built-in viewstate management to rebuild the control
        // on the server.
        //
        //*******************************************************

        private void Page_Load(object sender, System.EventArgs e)
        {
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

            if (Page.IsPostBack == false)
            {

                // Calculate end-user's shopping cart ID
                ASPNET.StarterKit.Commerce.ShoppingCartDB cart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();
                String cartId = cart.GetShoppingCartId();

                // Populate datagrid with shopping cart data
                MyDataGrid.DataSource = cart.GetItems(cartId);
                MyDataGrid2.DataSource = MyDataGrid.DataSource;
                MyDataGrid.DataBind();
                MyDataGrid2.DataBind();

                // Update total price label
                TotalLbl.Text = String.Format("{0:c}", cart.GetTotal(cartId));
                TotalLbl2.Text = String.Format("{0:c}", cart.GetTotal(cartId));

            }
        }

        //*******************************************************
        //
        // The SubmitBtn_Click event handle is used to order the
        // items within the current shopping cart.  It then
        // displays the orderid and order status to the screen
        // (hiding the "SubmitBtn" button to ensure that the
        // user can't click it twice).
        //
        //*******************************************************

        private void SubmitBtn2_Click(object sender, EventArgs e)
        {
            ASPNET.StarterKit.Commerce.ShoppingCartDB cart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();

            // Calculate end-user's shopping cart ID
            String cartId = cart.GetShoppingCartId();

            // Calculate end-user's customerID
            String customerId = User.Identity.Name;

            if ((cartId != null) && (customerId != null))
            {

                // Place the order
                ASPNET.StarterKit.Commerce.OrdersDB ordersDatabase = new ASPNET.StarterKit.Commerce.OrdersDB();
                int orderId = ordersDatabase.PlaceOrder(customerId, cartId);

                //Update labels to reflect the fact that the order has taken place
                Header2.Text = "Check Out Complete!";
                Message2.Text = "<b>Your Order Number Is: </b>" + orderId;
                SubmitBtn2.Visible = false;
            }
        }

        private void SubmitBtn_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {

            ASPNET.StarterKit.Commerce.ShoppingCartDB cart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();

            // Calculate end-user's shopping cart ID
            String cartId = cart.GetShoppingCartId();

            // Calculate end-user's customerID
            String customerId = User.Identity.Name;

            if ((cartId != null) && (customerId != null))
            {

                // Place the order
                ASPNET.StarterKit.Commerce.OrdersDB ordersDatabase = new ASPNET.StarterKit.Commerce.OrdersDB();
                int orderId = ordersDatabase.PlaceOrder(customerId, cartId);

                //Update labels to reflect the fact that the order has taken place
                Header.InnerText = "Check Out Complete!";
                Message.Text = "<b>Your Order Number Is: </b>" + orderId;
                SubmitBtn.Visible = false;
            }
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
            this.SubmitBtn.Click += new System.Web.UI.ImageClickEventHandler(this.SubmitBtn_Click);
            this.SubmitBtn2.Click += new EventHandler(this.SubmitBtn2_Click);

            this.Load += new System.EventHandler(this.Page_Load);

        }

        #endregion

    }
}

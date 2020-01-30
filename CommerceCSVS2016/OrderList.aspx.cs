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

    public class OrderList : System.Web.UI.Page
    {

        protected System.Web.UI.WebControls.Label MyError;
        protected System.Web.UI.WebControls.DataGrid MyList;

        protected System.Web.UI.WebControls.Panel OriginalUi;
        protected System.Web.UI.WebControls.Panel NewUi;

        protected System.Web.UI.WebControls.Label MyError2;
        protected System.Web.UI.WebControls.DataGrid MyList2;

        public OrderList()
        {
            Page.Init += new System.EventHandler(Page_Init);
        }

        //*******************************************************
        //
        // The Page_Load event on this page is used to obtain
        // from a database a collection of all orders placed
        // by the current customer.  The collection is then
        // databound to a templated asp:datalist control.
        //
        //*******************************************************

        private void Page_Load(object sender, System.EventArgs e)
        {

            String customerID = User.Identity.Name;

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

            // Obtain and bind a list of all orders ever placed by visiting customer
            ASPNET.StarterKit.Commerce.OrdersDB orderHistory = new ASPNET.StarterKit.Commerce.OrdersDB();
            DataSet orderData = orderHistory.GetCustomerOrders(customerID);
            if (!string.IsNullOrEmpty(customerID))
            {
                if (orderData != null)
                {
                    MyList.DataSource = orderData;
                    MyList2.DataSource = MyList.DataSource;
                    MyList.DataBind();
                    MyList2.DataBind();
                }
                // Hide the list and display a message if no orders have ever been made
                if (MyList.Items.Count == 0)
                {
                    MyError.Text = "You have no orders to display.";
                    MyError2.Text = MyError.Text;
                    MyList.Visible = false;
                    MyList2.Visible = false;
                }
            }
            else
            {
                MyError.Text = "You have no orders to display.";
                MyError2.Text = MyError.Text;
                MyList.Visible = false;
                MyList2.Visible = false;

            }


        }

        private void Page_Init(object sender, EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();

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

        #region Web Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

    }
}

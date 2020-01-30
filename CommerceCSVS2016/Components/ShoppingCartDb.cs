using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ASPNET.StarterKit.Commerce {

    //*******************************************************
    //
    // ShoppingCartDB Class
    //
    // Business/Data Logic Class that encapsulates all data
    // logic necessary to add/remove/update/purchase items
    // within an Commerce Starter Kit shopping cart.
    //
    //*******************************************************

    public class ShoppingCartDB {
        //*******************************************************
        //
        // ShoppingCartDB.GetItems() Method <a name="GetItems"></a>
        //
        // The GetItems method returns a struct containing
        // a forward-only, read-only DataReader.  This displays a list of all
        // items within a shopping cart. The SQLDataReaderResult struct
        // also returns the SQL connection, which must be explicitly closed
        // after the data from the DataReader is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartList.htm" style="color:green">ShoppingCartList Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetItems(string cartID)
        {
            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ShoppingCartList", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                dap.SelectCommand.Parameters.Add(parameterCartID);

                // Execute the command
                dap.Fill(result);
            }            
            
            // Return the datareader result
            return result;
        }

        //*******************************************************
        //
        // ShoppingCartDB.AddItem() Method <a name="AddItem"></a>
        //
        // The AddItem method adds an item into a shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartAddItem.htm" style="color:green">ShoppingCartAddItem Stored Procedure</a>
        //
        //*******************************************************

        public void AddItem(string cartID, int productID, int quantity) {

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ShoppingCartAddItem", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                dap.SelectCommand.Parameters.Add(parameterProductID);

                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                dap.SelectCommand.Parameters.Add(parameterCartID);

                SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
                parameterQuantity.Value = quantity;
                dap.SelectCommand.Parameters.Add(parameterQuantity);

                // Open the connection and execute the Command
                myConnection.Open();
                dap.SelectCommand.ExecuteNonQuery();
            }
        }

        //*******************************************************
        //
        // ShoppingCartDB.UpdateItem() Method <a name="UpdateItem"></a>
        //
        // The UpdateItem method updates the quantity of an item
        // in a shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartUpdate.htm" style="color:green">ShoppingCartUpdate Stored Procedure</a>
        //
        //*******************************************************

        public void UpdateItem(string cartID, int productID, int quantity) {

            // throw an exception if quantity is a negative number
            if (quantity < 0) {
                throw new Exception("Quantity cannot be a negative number");
            }

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ShoppingCartUpdate", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                dap.SelectCommand.Parameters.Add(parameterProductID);

                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                dap.SelectCommand.Parameters.Add(parameterCartID);

                SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
                parameterQuantity.Value = quantity;
                dap.SelectCommand.Parameters.Add(parameterQuantity);

                // Open the connection and execute the Command
                myConnection.Open();
                dap.SelectCommand.ExecuteNonQuery();
            }
        }

        //*******************************************************
        //
        // ShoppingCartDB.RemoveItem() Method <a name="RemoveItem"></a>
        //
        // The RemoveItem method removes an item from a
        // shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartRemoveItem.htm" style="color:green">ShoppingCartRemoveItem Stored Procedure</a>
        //
        //*******************************************************

        public void RemoveItem(string cartID, int productID) {

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartRemoveItem", myConnection);

                // Mark the Command as a SPROC
                myCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                myCommand.Parameters.Add(parameterProductID);

                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                myCommand.Parameters.Add(parameterCartID);

                // Open the connection and execute the Command
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
        }

        //*******************************************************
        //
        // ShoppingCartDB.GetItemCount() Method <a name="GetItemCount"></a>
        //
        // The GetItemCount method returns the number of items
        // within a shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartItemCount.htm" style="color:green">ShoppingCartItemCount Stored Procedure</a>
        //
        //*******************************************************

        public int GetItemCount(string cartID)
        {
            int itemCount = 0;

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartItemCount", myConnection);

                // Mark the Command as a SPROC
                myCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                myCommand.Parameters.Add(parameterCartID);

                // Add Parameters to SPROC
                SqlParameter parameterItemCount = new SqlParameter("@ItemCount", SqlDbType.Int, 4);
                parameterItemCount.Direction = ParameterDirection.Output;
                myCommand.Parameters.Add(parameterItemCount);

                // Open the connection and execute the Command
                myConnection.Open();
                myCommand.ExecuteNonQuery();
                itemCount = ((int)parameterItemCount.Value);
            }
            // Return the ItemCount (obtained as out paramter of SPROC)
            return itemCount;
        }

        //*******************************************************
        //
        // ShoppingCartDB.GetTotal() Method <a name="GetTotal"></a>
        //
        // The GetTotal method returns the total price of all
        // items within the shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartTotal.htm" style="color:green">ShoppingCartTotal Stored Procedure</a>
        //
        //*******************************************************

        public decimal GetTotal(string cartID)
        {
            decimal cartTotal = 0;
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartTotal", myConnection);

                // Mark the Command as a SPROC
                myCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                parameterCartID.Value = cartID;
                myCommand.Parameters.Add(parameterCartID);

                SqlParameter parameterTotalCost = new SqlParameter("@TotalCost", SqlDbType.Money, 8);
                parameterTotalCost.Direction = ParameterDirection.Output;
                myCommand.Parameters.Add(parameterTotalCost);

                // Open the connection and execute the Command
                myConnection.Open();
                myCommand.ExecuteNonQuery();

                // Return the Total
                if (parameterTotalCost.Value.ToString() != "")
                {
                    cartTotal = (decimal)parameterTotalCost.Value;
                }
            }
            return cartTotal;
        }

        //*******************************************************
        //
        // ShoppingCartDB.MigrateCart() Method <a name="MigrateCart"></a>
        //
        // The MigrateCart method migrates the items from one
        // cartId to another.  This is used during the login
        // and/or registration process to transfer a user's
        // temporary cart items to a permanent account.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartMigrate.htm" style="color:green">ShoppingCartMigrate Stored Procedure</a>
        //
        //*******************************************************

        public void MigrateCart(String oldCartId, String newCartId) {

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartMigrate", myConnection);

                // Mark the Command as a SPROC
                myCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter cart1 = new SqlParameter("@OriginalCartId ", SqlDbType.NVarChar, 50);
                cart1.Value = oldCartId;
                myCommand.Parameters.Add(cart1);

                SqlParameter cart2 = new SqlParameter("@NewCartId ", SqlDbType.NVarChar, 50);
                cart2.Value = newCartId;
                myCommand.Parameters.Add(cart2);

                // Open the connection and execute the Command
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
        }

        //*******************************************************
        //
        // ShoppingCartDB.EmptyCart() Method <a name="EmptyCart"></a>
        //
        // The EmptyCart method removes all current items within
        // the shopping cart.
        //
        // Other relevant sources:
        //     + <a href="ShoppingCartEmpty.htm" style="color:green">ShoppingCartEmpty Stored Procedure</a>
        //
        //*******************************************************

        public void EmptyCart(string cartID) {

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartEmpty", myConnection);

                // Mark the Command as a SPROC
                myCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter cartid = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
                cartid.Value = cartID;
                myCommand.Parameters.Add(cartid);

                // Open the connection and execute the Command
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
        }

        //*******************************************************
        //
        // ShoppingCartDB.GetShoppingCartId() Method <a name="GetShoppingCartId"></a>
        //
        // The GetShoppingCartId method is used to calculate the
        // "ShoppingCart" ID key used for a tracking a browser.
        //
        // The ShoppingCartID value is either the User's Identity
        // Name (if they are a registered and authenticated user),
        // or a random GUID calculated for guest visitors or
        // customers who have not yet logged in.
        //
        //*******************************************************

        public String GetShoppingCartId()
        {
            string cartId = string.Empty;
            // Obtain current HttpContext of ASP+ Request
            System.Web.HttpContext context = System.Web.HttpContext.Current;

            // If the user is authenticated, use their customerId as a permanent shopping cart id
            if (context.User.Identity.Name != "") {
                return context.User.Identity.Name;
            }

            // If user is not authenticated, either fetch (or issue) a new temporary cartID
            if (context.Request.Cookies["ASPNETCommerce_CartID"] != null) {
                cartId = context.Request.Cookies["ASPNETCommerce_CartID"].Value;
            }
            else {
                // Generate a new random GUID using System.Guid Class
                Guid tempCartId = Guid.NewGuid();

                // Send tempCartId back to client as a cookie
                context.Response.Cookies["ASPNETCommerce_CartID"].Value = tempCartId.ToString();

                // Return tempCartId
                cartId = tempCartId.ToString();
            }
            return cartId;
        }
    }
}
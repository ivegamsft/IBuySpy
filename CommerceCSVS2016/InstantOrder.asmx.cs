using System;
using System.Web.Services;
using ASPNET.StarterKit.Commerce;

public class InstantOrder : WebService {

    //*******************************************************
    //
    // InstantOrder.OrderItem() Method 
    //
    // The OrderItem method enables a remote client to programmatically
    // place an order using a webservice. 
    //
    //*******************************************************      

    [WebMethod(Description="The OrderItem method enables a remote client to programmatically place an order using a WebService.", EnableSession=false)]
    public OrderDetails OrderItem(string userName, string password, int productID, int quantity) {
        
        // Login client using provided username and password
        ASPNET.StarterKit.Commerce.CustomersDB accountSystem = new ASPNET.StarterKit.Commerce.CustomersDB();
        String customerId = accountSystem.Login(userName, ASPNET.StarterKit.Commerce.Security.Encrypt(password));
        
        if (customerId == null) {
            throw new Exception("Error: Invalid Login!");
        }

        // Wrap in try/catch block to catch errors in the event that someone types in
        // an invalid value for quantity
        int qty = System.Math.Abs(quantity);
        if (qty == quantity && qty < 1000) {
        
            // Add Item to Shopping Cart
            ASPNET.StarterKit.Commerce.ShoppingCartDB myShoppingCart = new ASPNET.StarterKit.Commerce.ShoppingCartDB();
            myShoppingCart.AddItem(customerId, productID, qty);

            // Place Order
            ASPNET.StarterKit.Commerce.OrdersDB orderSystem = new ASPNET.StarterKit.Commerce.OrdersDB();
            int orderID = orderSystem.PlaceOrder(customerId, customerId);
            
            // Return OrderDetails
            return orderSystem.GetOrderDetails(orderID, customerId);
        }
        else {
            // invalid input 
            return null;
        }
    }
     
    //*******************************************************
    //
    // InstantOrder.CheckStatus() Method 
    //
    // The CheckStatus method enables a remote client to programmatically
    // query the current status of an order in the Commerce Starter Kit System. 
    //
    //*******************************************************  
     
    [WebMethod(Description="The CheckStatus method enables a remote client to programmatically query the current status of an order in the Commerce Starter Kit System.", EnableSession=false)]
    public OrderDetails CheckStatus(string userName, string password, int orderID) {
     
        // Login client using provided username and password
        ASPNET.StarterKit.Commerce.CustomersDB accountSystem = new ASPNET.StarterKit.Commerce.CustomersDB();
        String customerId = accountSystem.Login(userName,ASPNET.StarterKit.Commerce.Security.Encrypt(password));
        
        if (customerId == null) {
            throw new Exception("Error: Invalid Login!");
        }
        
        // Return OrderDetails Status for Specified Order
        ASPNET.StarterKit.Commerce.OrdersDB orderSystem = new ASPNET.StarterKit.Commerce.OrdersDB();
        return orderSystem.GetOrderDetails(orderID, customerId);
    }
}
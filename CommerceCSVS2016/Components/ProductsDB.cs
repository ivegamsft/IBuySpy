using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ASPNET.StarterKit.Commerce {

    //*******************************************************
    //
    // ProductDetails Class
    //
    // A simple data class that encapsulates details about
    // a particular product inside the Commerce Starter Kit Product
    // database.
    //
    //*******************************************************

    public class ProductDetails {

        public String  ModelNumber;
        public String  ModelName;
        public String  ProductImage;
        public decimal UnitCost;
        public String  Description;
    }

    //*******************************************************
    //
    // ProductsDB Class
    //
    // Business/Data Logic Class that encapsulates all data
    // logic necessary to query products within
    // the Commerce Starter Kit Products database.
    //
    //*******************************************************

    public class ProductsDB {
        //*******************************************************
        //
        // ProductsDB.GetProductCategories() Method <a name="GetProductCategories"></a>
        //
        // The GetProductCategories method returns a DataReader that exposes all 
        // product categories (and their CategoryIDs) within the Commerce Starter Kit Products   
        // database.  The SQLDataReaderResult struct also returns the
        // SQL connection, which must be explicitly closed after the
        // data from the DataReader is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ProductCategoryList.htm" style="color:green">ProductCategoryList Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetProductCategories() 
        {
            DataSet dst = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {
                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ProductCategoryList", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Execute the command
                dap.Fill(dst);
            }
            // Return the datareader result
            return dst;
        }

        //*******************************************************
        //
        // ProductsDB.GetProducts() Method <a name="GetProducts"></a>
        //
        // The GetProducts method returns a struct containing a forward-only,
        // read-only DataReader. This displays all products within a specified
        // product category.  The SQLDataReaderResult struct also returns the
        // SQL connection, which must be explicitly closed after the
        // data from the DataReader is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ProductsByCategory.htm" style="color:green">ProductsByCategory Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetProducts(int categoryID)
        {
            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ProductsByCategory", myConnection);
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;
                // Add Parameters to SPROC
                SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
                parameterCategoryID.Value = categoryID;
                dap.SelectCommand.Parameters.Add(parameterCategoryID);

                dap.Fill(result);
            }
            // Return the datareader result
            return result;
        }


        //*******************************************************
        //
        // ProductsDB.GetProductDetails() Method <a name="GetProductDetails"></a>
        //
        // The GetProductDetails method returns a ProductDetails
        // struct containing specific details about a specified
        // product within the Commerce Starter Kit Products Database.
        //
        // Other relevant sources:
        //     + <a href="ProductDetail.htm" style="color:green">ProductDetail Stored Procedure</a>
        //
        //*******************************************************

        public ProductDetails GetProductDetails(int productID) {
            ProductDetails myProductDetails = null;
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {
                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ProductDetail", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                dap.SelectCommand.Parameters.Add(parameterProductID);

                SqlParameter parameterUnitCost = new SqlParameter("@UnitCost", SqlDbType.Money, 8);
                parameterUnitCost.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterUnitCost);

                SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
                parameterModelNumber.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterModelNumber);

                SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
                parameterModelName.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterModelName);

                SqlParameter parameterProductImage = new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
                parameterProductImage.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterProductImage);

                SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
                parameterDescription.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterDescription);

                // Open the connection and execute the Command
                myConnection.Open();
                dap.SelectCommand.ExecuteNonQuery();

                // Create and Populate ProductDetails Struct using
                // Output Params from the SPROC
                myProductDetails = new ProductDetails();
                myProductDetails.ModelNumber = (string)parameterModelNumber.Value;
                myProductDetails.ModelName = (string)parameterModelName.Value;
                myProductDetails.ProductImage = ((string)parameterProductImage.Value).Trim();
                myProductDetails.UnitCost = (decimal)parameterUnitCost.Value;
                myProductDetails.Description = ((string)parameterDescription.Value).Trim();
            }
            return myProductDetails;
        }

        //*******************************************************
        //
        // ProductsDB.GetProductsAlsoPurchased() Method <a name="GetProductsAlsoPurchased"></a>
        //
        // The GetPGetProductsAlsoPurchasedroducts method returns a struct containing
        // a forward-only, read-only DataReader.  This displays a list of other products
        // also purchased with a specified product  The SQLDataReaderResult struct also
        // returns the SQL connection, which must be explicitly closed after the
        // data from the DataReader is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="CustomerAlsoBought.htm" style="color:green">CustomerAlsoBought Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetProductsAlsoPurchased(int productID)
        {
            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {
                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_CustomerAlsoBought", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                dap.SelectCommand.Parameters.Add(parameterProductID);

                // Execute the command
                dap.Fill(result);
            }
            // Return the datareader result
            return result;
        }

        //*******************************************************
        //
        // ProductsDB.GetMostPopularProductsOfWeek() Method <a name="GetMostPopularProductsOfWeek"></a>
        //
        // The GetMostPopularProductsOfWeek method returns a struct containing a 
        // forward-only, read-only DataReader containing the most popular products 
        // of the week within the Commerce Starter Kit Products database.  
        // The SQLDataReaderResult struct also returns the
        // SQL connection, which must be explicitly closed after the
        // data from the DataReader is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ProductsMostPopular.htm" style="color:green">ProductsMostPopular Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetMostPopularProductsOfWeek() {

            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {
                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ProductsMostPopular", myConnection);
                // Add Parameters to SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;
                
                // Execute the command
                dap.Fill(result);
            }
            // Return the datareader result
            return result;
       }

        //*******************************************************
        //
        // ProductsDB.SearchProductDescriptions() Method <a name="SearchProductDescriptions"></a>
        //
        // The SearchProductDescriptions method returns a struct containing
        // a forward-only, read-only DataReader.  This displays a list of all
        // products whose name and/or description contains the specified search
        // string. The SQLDataReaderResult struct also returns the SQL connection,
        // which must be explicitly closed after the data from the DataReader
        // is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ProductSearch.htm" style="color:green">ProductSearch Stored Procedure</a>
        //
        //*******************************************************

        public DataSet SearchProductDescriptions(string searchString)
        {

            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ProductSearch", myConnection);
                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterSearch = new SqlParameter("@Search", SqlDbType.NVarChar, 255);
                parameterSearch.Value = searchString;
                dap.SelectCommand.Parameters.Add(parameterSearch);

                // Execute the command
                dap.Fill(result);
            }
            // Return the datareader result
            return result;
        }
    }
}
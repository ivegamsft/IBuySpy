using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ASPNET.StarterKit.Commerce {

    //*******************************************************
    //
    // ReviewsDB Class
    //
    // Business/Data Logic Class that encapsulates all data
    // logic necessary to list/access/add reviews from
    // the Commerce Starter Kit Reviews database.
    //
    //*******************************************************

    public class ReviewsDB {
         //*******************************************************
        //
        // ReviewsDB.GetReviews() Method <a name="GetReviews"></a>
        //
        // The GetReviews method returns a struct containing
        // a forward-only, read-only DataReader.  This displays a list of all
        // user-submitted reviews for a specified product.
        // The SQLDataReaderResult struct also returns the SQL connection,
        // which must be explicitly closed after the data from the DataReader
        // is bound into the controls.
        //
        // Other relevant sources:
        //     + <a href="ReviewsList.htm" style="color:green">ReviewsList Stored Procedure</a>
        //
        //*******************************************************

        public DataSet GetReviews(int productID)
        {
            DataSet result = new DataSet();
            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {
                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ReviewsList", myConnection);

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
        // ReviewsDB.AddReview() Method <a name="AddReview"></a>
        //
        // The AddReview method adds a new review into the
        // Commerce Starter Kit Reviews database.
        //
        // Other relevant sources:
        //     + <a href="ReviewsAdd.htm" style="color:green">ReviewsAdd Stored Procedure</a>
        //
        //*******************************************************

        public void AddReview(int productID, string customerName, string customerEmail, int rating, string comments) {

            // Create Instance of Connection and Command Object
            using (SqlConnection myConnection = new SqlConnection(DataConnection.GetConnString()))
            {

                SqlDataAdapter dap = new SqlDataAdapter();
                dap.SelectCommand = new SqlCommand("CMRC_ReviewsAdd", myConnection);

                // Mark the Command as a SPROC
                dap.SelectCommand.CommandType = CommandType.StoredProcedure;

                // Add Parameters to SPROC
                SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                parameterProductID.Value = productID;
                dap.SelectCommand.Parameters.Add(parameterProductID);

                SqlParameter parameterCustomerName = new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
                parameterCustomerName.Value = customerName;
                dap.SelectCommand.Parameters.Add(parameterCustomerName);

                SqlParameter parameterEmail = new SqlParameter("@CustomerEmail", SqlDbType.NVarChar, 50);
                parameterEmail.Value = customerEmail;
                dap.SelectCommand.Parameters.Add(parameterEmail);

                SqlParameter parameterRating = new SqlParameter("@Rating", SqlDbType.Int, 4);
                parameterRating.Value = rating;
                dap.SelectCommand.Parameters.Add(parameterRating);

                SqlParameter parameterComments = new SqlParameter("@Comments", SqlDbType.NVarChar, 3850);
                parameterComments.Value = comments;
                dap.SelectCommand.Parameters.Add(parameterComments);

                SqlParameter parameterReviewID = new SqlParameter("@ReviewID", SqlDbType.Int, 4);
                parameterReviewID.Direction = ParameterDirection.Output;
                dap.SelectCommand.Parameters.Add(parameterReviewID);

                // Open the connection and execute the Command
                myConnection.Open();
                dap.SelectCommand.ExecuteNonQuery();
            }
        }
    }
}


using IBuySpyCommon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBuySpyHealth.ContextProviders
{
    public class ProductContext
    {
        private static Guid HEALTHCHECKID = Guid.Parse("{29BA8EFE-D067-4637-A075-AEAC18EBC69F}");
        private const string HEALTHCHECKNAME = "ProductContext";

        public static HealthCheckItem GetHealth()
        {

            HealthCheckItem curHealth = new HealthCheckItem(HEALTHCHECKID);
            curHealth.Name = HEALTHCHECKNAME;
            curHealth.Ok = false;
            try
            {
                //Check the DB connection string health
                HealthCheckItem tosDbHealth = SqlDbContext.GetHealth();

                if (tosDbHealth.Ok)
                {
                    //Check the connection to the DB to see if we have access
                    using (var conn = new SqlConnection(SqlDbContext.ConnectionString()))
                    {
                        conn.Open();
                        if (conn.State == ConnectionState.Open)
                        {
                            //Connection is open, try to run a query
                            curHealth.StatusMessage = "Connection to database ok";
                            curHealth.Ok = true;
                        }
                    }
                    if (curHealth.Ok)
                    {
                        //Check the categories
                        int categoryCount = GetProductCategories();
                        int productCount = GetProducts();
                        curHealth.Ok = categoryCount > 0;
                        curHealth.StatusMessage += $"\n Category count is {categoryCount}";
                        if (curHealth.Ok)
                        {
                            //Check the products
                            curHealth.StatusMessage += $"\n Product count is {productCount}";
                            curHealth.Ok = productCount > 0;
                        }
                    }
                }
                else
                {
                    curHealth.StatusMessage = "An error occured in " + HEALTHCHECKNAME;
                }
            }
            catch (Exception ex)
            {
                curHealth.StatusMessage = "An error occured in " + HEALTHCHECKNAME + " " + ex.ToString();
                curHealth.Ok = false;
                curHealth.Exceptions.Add(ex);
            }

            return curHealth;
        }

        public static int GetProducts()
        {
            int productCount = 0;
            using (var conn = new SqlConnection(SqlDbContext.ConnectionString()))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM [dbo].[CMRC_Products]";
                cmd.CommandType = CommandType.Text;
                conn.Open();

                var data = cmd.ExecuteScalar();
                productCount = (int)(data);
        }
            return productCount;
        }

        public static int GetProductCategories()
        {
            int categoryCount = 0;
            using (var conn = new SqlConnection(SqlDbContext.ConnectionString()))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM [dbo].[CMRC_Categories]";
                cmd.CommandType = CommandType.Text;
                conn.Open();

                var data = cmd.ExecuteScalar();
                categoryCount = (int)(data);
            }
            return categoryCount;
        }
    }
}

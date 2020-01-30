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
    public class UserContext
    {
        private static Guid HEALTHCHECKID = Guid.Parse("{ACA79353-895F-47D3-8EB6-4CA71FFF3849}");
        private const string HEALTHCHECKNAME = "UserContext";

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
                        //Now probe to see if we have data
                        int userCount = GetUsers();
                        curHealth.StatusMessage += $"\n User count is {userCount}";
                        if (userCount > 0)
                        {
                            curHealth.Ok = true;
                        }
                        else
                        {
                            curHealth.Ok = false;

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

        public static int GetUsers()
        {
            int userCount = 0;
            using (var conn = new SqlConnection(SqlDbContext.ConnectionString()))
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT COUNT(*) FROM [dbo].[CMRC_Customers]";
                cmd.CommandType = CommandType.Text;
                conn.Open();

                var data = cmd.ExecuteScalar();
                userCount= (int)(data);
            }
            return userCount;
        }
    }
}

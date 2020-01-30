using IBuySpyCommon;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBuySpyHealth.ContextProviders
{
    public class SqlDbContext
    {
        private static Guid HEALTHCHECKID = Guid.Parse("{9400C3B8-CF63-4865-91B9-B92E2014EE87}");
        private const string HEALTHCHECKNAME = "SqlDbContext";
        private const string CONN_STRING_NAME = "ConnectionString";

        public static HealthCheckItem GetHealth()
        {
            HealthCheckItem curHealth = new HealthCheckItem(HEALTHCHECKID);
            curHealth.Name = HEALTHCHECKNAME;
            curHealth.Ok = false;
            try
            {
                //Check the connection string in the web.config
                string conString = ConnectionString();
                DbConnectionStringBuilder builder = new DbConnectionStringBuilder();
                builder.ConnectionString = conString;
                StringBuilder statusMsg = new StringBuilder();
                statusMsg.Append("Connection string information::");
                //"Server=tcp:ibuyspy-d.database.windows.net,1433;
                //Database =ibuyspy-d;
                //User ID=ivadmin@ibuyspy-d
                statusMsg.AppendFormat("Web Config Key={0};", CONN_STRING_NAME);
                statusMsg.AppendFormat("Server ={0};", builder["Server"]);
                statusMsg.AppendFormat("Database={0};", builder["Database"]);
                statusMsg.AppendFormat("Connecting as={0};", builder["User ID"]);
                curHealth.StatusMessage = statusMsg.ToString();
                curHealth.Ok = true;
            }
            catch (Exception ex)
            {
                curHealth.StatusMessage = "An error occured in " + HEALTHCHECKNAME + " " + ex.ToString();
                curHealth.Ok = false;
                curHealth.Exceptions.Add(ex);
            }

            return curHealth;
        }

        public static string ConnectionString()
        {
            string connString = ConfigurationManager.ConnectionStrings[CONN_STRING_NAME].ConnectionString;
            return connString;
        }

    }
}

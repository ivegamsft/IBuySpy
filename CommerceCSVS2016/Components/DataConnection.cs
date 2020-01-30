using Microsoft.Azure;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ASPNET.StarterKit.Commerce
{
    public static class DataConnection
    {
        public static string GetConnString()
        {
            string dataConnKey = CloudConfigurationManager.GetSetting("DataConnectionString");
            string connstring = ConfigurationManager.ConnectionStrings[dataConnKey].ConnectionString;
            return connstring;
        }
    }
}
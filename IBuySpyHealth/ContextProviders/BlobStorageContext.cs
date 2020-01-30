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
    public class BlobStorageContext
    {
        private static Guid HEALTHCHECKID = Guid.Parse("{9F872B00-96C6-4C58-BE55-2C06F9ABED21}");
        private const string HEALTHCHECKNAME = "BlobStorageContext";

        public static HealthCheckItem GetHealth()
        {
            HealthCheckItem curHealth = new HealthCheckItem(HEALTHCHECKID);
            curHealth.Name = HEALTHCHECKNAME;
            curHealth.Ok = false;
            try
            {
                //TODO: Add get request to storage account
                if (CanSeeImages())
                {
                    curHealth.Ok = true;
                }
                else
                {
                    curHealth.StatusMessage = "Unable to access the images. Check blob storage";
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

        private static bool CanSeeImages()
        {
            return false;
        }
    }
}

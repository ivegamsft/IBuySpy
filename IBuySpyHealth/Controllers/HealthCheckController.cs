using IBuySpyCommon;
using IBuySpyHealth.ContextProviders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IBuySpyHealth.Controllers
{
    public class HealthCheckController : Controller
    {
        private static Guid HEALTHCHECKID = Guid.Parse("{F8835B28-8EE8-47F0-8C74-4C50B0521574}");
        private const string HEALTHCHECKNAME = "HealthCheckController";

        // GET: HealthCheck
        public ActionResult Index()
        {
            List<HealthCheckItem> healthChecks = new List<HealthCheckItem>();

            //Check the DB Conn string
            healthChecks.Add(SqlDbContext.GetHealth());

            //Check the provider to ensure access to DB
            healthChecks.Add(ProductContext.GetHealth());
            healthChecks.Add(UserContext.GetHealth());

            //Add the image check
            healthChecks.Add(BlobStorageContext.GetHealth());

            return View(healthChecks);
        }
    }
}
using Microsoft.ApplicationInsights.Extensibility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPNET.StarterKit.Commerce
{
    public partial class SplashLayout : System.Web.UI.MasterPage
    {
        protected string AppInsightsKey = TelemetryConfiguration.Active.InstrumentationKey;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
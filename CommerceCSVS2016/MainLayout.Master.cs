using ASPNET.StarterKit.Commerce.AzureFeatures;
using Microsoft.ApplicationInsights.Extensibility;
using System;
using System.Configuration;

namespace ASPNET.StarterKit.Commerce
{
    public partial class MainLayout : System.Web.UI.MasterPage
    {
        protected string AppInsightsKey = TelemetryConfiguration.Active.InstrumentationKey;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //#### SPECIAL FEATURE WITH FLAG - NEW UI
            if (IBuySpyFeatures.ShowNewUI())
            {
                NewUi.Visible = true;
                OriginalUi.Visible = false;
            }
            else
            {
                NewUi.Visible = false;
                OriginalUi.Visible = true;
                //bodyElement.Attributes.Add("background", "images/sitebkgrd.gif");
                //bodyElement.Attributes.Add("leftmargin", "0");
                //bodyElement.Attributes.Add("topmargin", "0");
                //bodyElement.Attributes.Add("rightmargin", "0");
                //bodyElement.Attributes.Add("bottommargin", "0");
                //bodyElement.Attributes.Add("marginheight", "0");
                //bodyElement.Attributes.Add("marginwidth", "0");
            }
            //#### SPECIAL FEATURE WITH FLAG - NEW UI
        }
    }
}
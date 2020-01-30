using System;
using System.Collections;
using System.ComponentModel;
using System.Web;
using System.Security;
using System.Security.Principal;
using System.Web.Security;
using System.Data.SqlClient;
using System.Threading;
using System.Globalization;

namespace ASPNET.StarterKit.Commerce 
{

	public class Global : System.Web.HttpApplication 
	{

		//*********************************************************************
		//
		// Application_BeginRequest Event
		//
		// The Application_BeginRequest method is an ASP.NET event that executes 
		// on each web request into the portal application.  The below method
		// obtains the current tabIndex and TabId from the querystring of the 
		// request -- and then obtains the configuration necessary to process
		// and render the request.
		//
		// This portal configuration is stored within the application's "Context"
		// object -- which is available to all pages, controls and components
		// during the processing of a single request.
		// 
		//*********************************************************************

		protected void Application_BeginRequest(Object sender, EventArgs e) 
		{
                
			try
			{
				if (Request.UserLanguages != null)
					Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages[0]);
				else
					// Default to English if there are no user languages
					Thread.CurrentThread.CurrentCulture = new CultureInfo("en-us");

				Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
			}
			catch (Exception)
			{
				Thread.CurrentThread.CurrentCulture = new CultureInfo("en-us");
			}
            
		}
      
	}
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using MerchantTribe.Commerce;
using log4net;

namespace SwetNation.Web
{
    public class Global : System.Web.HttpApplication
    {
        public override string GetVaryByCustomString(HttpContext context, string arg)
        {
            MerchantTribeApplication MTApp = MerchantTribeApplication.InstantiateForDataBase(new MerchantTribe.Commerce.RequestContext());
            MTApp.CurrentStore = MerchantTribe.Commerce.Utilities.UrlHelper.ParseStoreFromUrl(System.Web.HttpContext.Current.Request.Url, MTApp.AccountServices);

            if (arg == "UserSpecific")
            {
                string username = SessionManager.GetCurrentUserId(MTApp.CurrentStore);
                return username;
            }
            return base.GetVaryByCustomString(context, arg);
        }

        protected void Application_Start(object sender, EventArgs e)
        {
            // Log4Net
            log4net.Config.XmlConfigurator.Configure();
            MerchantTribe.Commerce.EventLog.LogEvent("System", "Application Startup", MerchantTribe.Web.Logging.EventLogSeverity.Information);
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                switch (Request.Url.Scheme)
                {
                    case "https":
                        Response.AddHeader("Strict-Transport-Security", "max-age=300");
                        break;
                    case "http":
                        var path = "https://" + Request.Url.Host + Request.Url.PathAndQuery;
                        Response.Status = "301 Moved Permanently";
                        Response.AddHeader("Location", path);
                        break;
                }
            }            
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Exception ex = Server.GetLastError().GetBaseException();
            MerchantTribe.Commerce.EventLog.LogEvent(ex, MerchantTribe.Web.Logging.EventLogSeverity.Error);
            while (ex.InnerException != null)
            {
                MerchantTribe.Commerce.EventLog.LogEvent(ex);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {
            MerchantTribe.Commerce.EventLog.LogEvent("System", "Application Shutdown", MerchantTribe.Web.Logging.EventLogSeverity.Information);
        }
    }
}
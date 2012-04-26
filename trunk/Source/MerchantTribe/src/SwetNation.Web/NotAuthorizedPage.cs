using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Content;

namespace SwetNation.Web
{
    public class NotAuthorizedPage : System.Web.UI.Page
    {
        public MerchantTribeApplication MTApp { get; set; }

        override protected void OnInit(EventArgs e)
        {
            //initialize our base class (System.Web,UI.Page)
            base.OnInit(e);

            MTApp = MerchantTribeApplication.InstantiateForDataBase(new MerchantTribe.Commerce.RequestContext());

            // Determine store id        
            MTApp.CurrentStore = MerchantTribe.Commerce.Utilities.UrlHelper.ParseStoreFromUrl(System.Web.HttpContext.Current.Request.Url, MTApp.AccountServices);
        }

        protected void FlashInfo(string message)
        {
            FlashMessage(message, "flash-message-info");
        }
        protected void FlashSuccess(string message)
        {
            FlashMessage(message, "flash-message-success");
        }
        protected void FlashFailure(string message)
        {
            FlashMessage(message, "flash-message-failure");
        }
        protected void FlashWarning(string message)
        {
            FlashMessage(message, "flash-message-warning");
        }
        private void FlashMessage(string message, string typeClass)
        {
            string format = "<div class=\"{0}\">{1}</div>";
            Session["messages"] += string.Format(format, typeClass, message);
        }
    }
}
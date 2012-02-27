using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Content;

namespace SwetNation.Web
{
    public class BaseUserControl : System.Web.UI.UserControl
    {
        public MerchantTribeApplication MTApp { get; set; }

        override protected void OnInit(EventArgs e)
        {
            //initialize our base class (System.Web,UI.Page)
            base.OnInit(e);

            MTApp = MerchantTribeApplication.InstantiateForDataBase(new MerchantTribe.Commerce.RequestContext());

            // Determine store id        
            MTApp.CurrentStore = MerchantTribe.Commerce.Utilities.UrlHelper.ParseStoreFromUrl(System.Web.HttpContext.Current.Request.Url, MTApp.AccountServices);
            if (MTApp.CurrentStore == null)
            {
                Response.Redirect("~/storenotfound");
            }

            if (MTApp.CurrentStore.Status == MerchantTribe.Commerce.Accounts.StoreStatus.Deactivated)
            {
                Response.Redirect("~/storenotavailable");
            }
        }
    }
}
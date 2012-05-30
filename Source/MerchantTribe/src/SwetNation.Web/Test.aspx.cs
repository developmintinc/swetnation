using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Contacts;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class Test : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = "ryancmartin1976@yahoo.com";
            string newpassword = "SRTECH1!";

            CustomerAccount current = MTApp.MembershipServices.Customers.FindByEmail(email);
            if (MTApp.MembershipServices.ResetPasswordForCustomer(email, newpassword))
            {
                FlashSuccess("Password Updated.");
            }
            else
            {
                FlashWarning("Password could not be updated.");
            }
        }        
    }
}
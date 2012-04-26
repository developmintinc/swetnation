using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;

namespace SwetNation.Web.controls
{
    public partial class PersonalProfileLinks : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                litMemberName.Text = "Welcome " + u.Email + " <a href='SignOut.aspx' style='color:#fff;'>(sign out)</a>";
            }
            else
            {
                litMemberName.Text = "<a href='SignIn.aspx' style='color:#fff;'>Login</a>";
            }

            if (SessionManager.IsUserAuthenticated(this.MTApp) == false)
            {

            }
        }
    }
}
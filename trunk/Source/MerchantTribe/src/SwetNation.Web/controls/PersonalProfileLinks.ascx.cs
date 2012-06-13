using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using SwetNation.Web.Code;

namespace SwetNation.Web.controls
{
    public partial class PersonalProfileLinks : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                litMemberName.Text = "<span class='white'>Welcome " + u.FirstName + "</span> <a href='SignOut.aspx' class='white'>(sign out)</a>";
            }
            else
            {
                litMemberName.Text = "<a href='SignIn.aspx' class='white'>Login</a>";
            }
        }
    }
}
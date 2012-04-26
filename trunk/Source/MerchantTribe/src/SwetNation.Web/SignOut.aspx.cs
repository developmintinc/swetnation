using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwetNation.Web
{
    public partial class SignOut : NotAuthorizedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MTApp.MembershipServices.LogoutCustomer(Request.RequestContext.HttpContext, MTApp);
            Response.Redirect("SignIn.aspx");
        }
    }
}
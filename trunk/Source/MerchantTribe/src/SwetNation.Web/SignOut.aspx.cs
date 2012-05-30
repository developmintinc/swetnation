using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class SignOut : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MTApp.MembershipServices.LogoutCustomer(Request.RequestContext.HttpContext, MTApp);
            Response.Redirect("SignIn.aspx");
        }
    }
}
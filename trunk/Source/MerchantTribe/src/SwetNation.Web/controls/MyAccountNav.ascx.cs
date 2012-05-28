using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web.controls
{
    public partial class MyAccountNav : BaseUserControl
    {
        // ******** property syntax ************
        public string MyProfileSelected { get; set; }
        public string PastOrdersSelected { get; set; }
        public string InviteFriendSelected { get; set; }
        public string ChangePasswordSelected { get; set; }
        // *************************************

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwetNation.Web.controls
{
    public partial class RightSidebarNav : System.Web.UI.UserControl
    {
        // ******** property syntax ************
        public string InviteFriendSelected { get; set; }
        public string ReturnPolicySelected { get; set; }
        public string CustomerServiceSelected { get; set; }
        public string PrivacyPolicySelected { get; set; }
        public string TermsOfUseSelected { get; set; }
        public string GiftCardSelected { get; set; }
        // *************************************

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}
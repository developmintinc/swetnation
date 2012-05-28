using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web.controls
{
    public partial class RightSidebarNav : BaseUserControl
    {
        // ******** property syntax ************
        public string ReturnPolicySelected { get; set; }
        public string PrivacyPolicySelected { get; set; }
        public string TermsOfUseSelected { get; set; }
        // *************************************

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SwetNation.Web.controls
{
    public partial class MyAccountNav : System.Web.UI.UserControl
    {
        // ******** property syntax ************
        public string MyAccountSelected { get; set; }
        public string PastOrdersSelected { get; set; }
        public string SavedItemsSelected { get; set; }
        public string ChangePasswordSelected { get; set; }
        public string ChangeEmailSelected { get; set; }
        public string SignOutSelected { get; set; }
        // *************************************

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
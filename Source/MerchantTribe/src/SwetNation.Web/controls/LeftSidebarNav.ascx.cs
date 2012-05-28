using System;
using SwetNation.Web.Code;

namespace SwetNation.Web.controls
{
    public partial class LeftSidebarNav : BaseUserControl
    {
        // ******** property syntax ************
        public string PageSelected { get; set; }
        public string AboutUsSelected { get; set; }
        public string ContactUsSelected { get; set; }
        public string JobOpportunitiesSelected { get; set; }
        public string FAQSelected { get; set; }
        // *************************************

        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageSelected();
        }

        private void SetPageSelected()
        {
            
        }
    }
}
using System;

namespace SwetNation.Web.controls
{
    public partial class LeftSidebarNav : System.Web.UI.UserControl
    {
        // ******** property syntax ************
        public string PageSelected { get; set; }
        public string AboutUsSelected { get; set; }
        public string ContactUsSelected { get; set; }
        public string OurServicesSelected { get; set; }
        public string OurTeamSelected { get; set; }
        public string ClientTestimonialsSelected { get; set; }
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
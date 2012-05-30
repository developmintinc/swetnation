using System;
using System.Web.UI;

namespace SwetNation.Web.Code
{
    public class MasterBasePage : MasterPage
    {
        private string _pageTitle;
        private string _pageDescription;

        public string PageTitle
        {
            get { return _pageTitle; }
            set { _pageTitle = value; }
        }

        public string PageDescription
        {
            get { return _pageDescription; }
            set { _pageDescription = value; }
        }

        protected override void OnLoad(EventArgs e)
        {
            
        }
    }
}
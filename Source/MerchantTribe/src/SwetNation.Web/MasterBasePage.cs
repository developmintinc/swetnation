using System;
using System.Web.UI;

namespace SwetNation.Web
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
            /*
            if (string.IsNullOrEmpty(PageTitle1))
            {
                _pageTitle = this.Page.Title;
            }
            _pageDescription = "Select from config file";
            this.Page.Title = "Shit tooth";
            HtmlMeta metaTag = new HtmlMeta();
            metaTag.Name = "Description";
            metaTag.Content = _pageDescription;
            Page.Header.Controls.Add(metaTag);            
            base.OnLoad(e);
             */
        }
    }
}
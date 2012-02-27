using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;

namespace SwetNation.Web.controls
{
    public partial class PrimaryNav : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildProductNavigation();
        }

        private void BuildProductNavigation()
        {
            string categoryItem = "";
            categoryItem += "<ul>";                
            List<MerchantTribe.Commerce.Catalog.CategorySnapshot> categories = new List<CategorySnapshot>();
            categories = MTApp.CatalogServices.Categories.FindAll();
            foreach(CategorySnapshot category in categories)
            {
                categoryItem += "<li><a href='Products.aspx?CategoryId=" + category.Bvin + "'>" + category.Name + "</a></li>";
            }            
            categoryItem += "</ul>";
            litProductNavigation.Text = categoryItem;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;

namespace SwetNation.Web
{
    public partial class Index : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetFeaturedBrands();
        }

        private void GetFeaturedBrands()
        {
            List<MerchantTribe.Commerce.Contacts.VendorManufacturer> vm = MTApp.ContactServices.Manufacturers.FindAll();
            lstFeaturedBrands.DataSource = vm;
            lstFeaturedBrands.DataBind();
        }
    }
}
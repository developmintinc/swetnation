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
    public partial class ProductDetail : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetProduct();
        }

        private void GetProduct()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["bvin"]))
            {
                string bvin = Request.QueryString["bvin"];
                MerchantTribe.Commerce.Catalog.Product resultItem = new MerchantTribe.Commerce.Catalog.Product();
                resultItem = MTApp.CatalogServices.Products.Find(bvin);
                if (resultItem != null)
                {
                    string listPrice = String.Format("{0:C}", resultItem.ListPrice);
                    string salePrice = String.Format("{0:C}", resultItem.SitePrice);
                    litListPriceContent.Text = listPrice;
                    litSalePriceContent.Text = salePrice;
                    litListPriceSlider.Text = salePrice;
                    litLongDescription.Text = resultItem.LongDescription;
                    litProductNameContent.Text = resultItem.ProductName;
                    litProductNameSlider.Text = resultItem.ProductName;
                    imgProductImageSmall.ImageUrl = "https://swetnation.com/shop/Images/sites/1/products/" + resultItem.Bvin + "/" + resultItem.ImageFileSmall;
                }
            }
        }
    }
}
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
    public partial class Products : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetProducts();
        }

        private void GetProducts()
        {
            List<MerchantTribe.Commerce.Catalog.Product> resultItems = new List<MerchantTribe.Commerce.Catalog.Product>();
            resultItems = MTApp.CatalogServices.Products.FindAllPaged(1, 10);
            rptProducts.DataSource = resultItems;
            rptProducts.DataBind();

            /*
            foreach (MerchantTribe.Commerce.Catalog.Product product in resultItems)
            {
                string id = product.Bvin;
                string productName = product.ProductName;
                string shortDesc = product.ShortDescription;
                string longDesc = product.LongDescription;
                decimal price = product.ListPrice;
                string imageUrl = product.ImageFileSmall;
            }
            */
        }
    }
}
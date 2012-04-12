using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Orders;

namespace SwetNation.Web.controls
{
    public partial class PrimaryNav : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildNavigation();
            //CheckShoppingCart();
        }

        private void BuildNavigation()
        {
            string navigation = "";
            IEnumerable<CategorySnapshot> categories = MTApp.CatalogServices.Categories.FindAll().OrderBy(x => x.SortOrder).Where(x => !x.Hidden);
            foreach(CategorySnapshot category in categories)
            {                
                string categoryName = category.Name;
                string categoryId = category.Bvin;
                navigation += "<li><a href='Products.aspx?CategoryId=" + categoryId + "' class='primary-navigation'>" + categoryName + "<span>Products</span></a><ul>";

                List<CategoryProductAssociation> categoryProductAssociations = MTApp.CatalogServices.CategoriesXProducts.FindForCategory(category.Bvin, 1, 1000);
                List<string> manufacturerIds = new List<string>();
                foreach(CategoryProductAssociation categoryProductAssociation in categoryProductAssociations)
                {
                    string productId = categoryProductAssociation.ProductId;
                    string manufacturerId = MTApp.CatalogServices.Products.Find(productId).ManufacturerId;
                    manufacturerIds.Add(manufacturerId);
                }

                manufacturerIds.Sort();
                Int32 index = 0;
                while (index < manufacturerIds.Count - 1)
                {
                    if (manufacturerIds[index] == manufacturerIds[index + 1])
                        manufacturerIds.RemoveAt(index);
                    else
                        index++;
                }

                foreach(string manufacturerId in manufacturerIds)
                {
                    MerchantTribe.Commerce.Contacts.VendorManufacturer vendorManufacturer = MTApp.ContactServices.Manufacturers.Find(manufacturerId);
                    string brandName = vendorManufacturer.DisplayName;
                    navigation += "<li><a href='Products.aspx?CategoryId=" + categoryId + "&ManufacturerId=" + manufacturerId + "'>" + brandName + "</a></li>";
                }

                navigation += "</ul></li>";
            }

            litNavigation.Text = navigation;
        }

        public void CheckShoppingCart()
        {
            string shoppingCartLink = "<li class='no-right-border' style='border-right: 0px solid black !important;'><a href='Cart.aspx'><img src='images/icons/shopping-carts/03-shopping-cart.png' width='40px' /></a></li>";
            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            if ((Basket.Items == null) || ((Basket.Items != null) && (Basket.Items.Count <= 0)))
            {
                hypCart.ToolTip = "You have no items in your shopping cart";
            }
            else
            {
                hypCart.ToolTip = "You have " + Basket.Items.Count.ToString() + " items in your shopping cart";
            }
        }
    }
}
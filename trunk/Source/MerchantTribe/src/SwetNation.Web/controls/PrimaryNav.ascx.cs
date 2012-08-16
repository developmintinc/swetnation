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
using SwetNation.Web.Code;

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
            string cachedPrimaryNav = SessionManager.GetOrAddToCache;
            if (!String.IsNullOrEmpty(cachedPrimaryNav))
            {
                litNavigation.Text = cachedPrimaryNav;
            }
            else
            {
                string navigation = "";
                IEnumerable<CategorySnapshot> categories = MTApp.CatalogServices.Categories.FindAll().OrderBy(x => x.SortOrder).Where(x => !x.Hidden);
                foreach (CategorySnapshot category in categories)
                {
                    string categoryName = category.Name;
                    string categoryId = category.Bvin;
                    string secondaryName = "Sales";
                    navigation += "<li><a href='Products.aspx?CategoryId=" + categoryId + "' class='primary-navigation'>" + categoryName + "<span>" + secondaryName + "</span></a><ul>";

                    //List<CategoryProductAssociation> categoryProductAssociations = MTApp.CatalogServices.CategoriesXProducts.FindForCategory(category.Bvin, 1, 1000);
                    List<string> manufacturerIds = new List<string>();

                    ProductSearchCriteria productSearchCriteria = new ProductSearchCriteria();
                    productSearchCriteria.CategoryId = categoryId;
                    //productSearchCriteria.DisplayInactiveProducts = false;
                    //productSearchCriteria.InventoryStatus = ProductInventoryStatus.Available;
                    productSearchCriteria.Status = ProductStatus.Active;
                    productSearchCriteria.HasManufacturerId = true;

                    int recordOut = 0;
                    var products = MTApp.CatalogServices.Products.FindByCriteria(productSearchCriteria, 1, 500, ref recordOut);
                    foreach (var product in products)
                    {
                        manufacturerIds.Add(product.ManufacturerId);
                    }

                    /*
                    foreach(CategoryProductAssociation categoryProductAssociation in categoryProductAssociations)
                    {
                        string productId = categoryProductAssociation.ProductId;
                        string manufacturerId = MTApp.CatalogServices.Products.Find(productId).ManufacturerId;
                        if (manufacturerId.Trim().ToLower() != "- no manufacturer -")
                            manufacturerIds.Add(manufacturerId);
                    }
                    */

                    manufacturerIds.Sort();
                    Int32 index = 0;
                    while (index < manufacturerIds.Count - 1)
                    {
                        if (manufacturerIds[index] == manufacturerIds[index + 1])
                            manufacturerIds.RemoveAt(index);
                        else
                            index++;
                    }

                    foreach (string manufacturerId in manufacturerIds)
                    {
                        if (manufacturerId != "- No Manufacturer -")
                        {
                            MerchantTribe.Commerce.Contacts.VendorManufacturer vendorManufacturer = MTApp.ContactServices.Manufacturers.Find(manufacturerId);
                            if (vendorManufacturer != null)
                            {
                                string brandName = vendorManufacturer.DisplayName;
                                navigation += "<li><a href='Products.aspx?CategoryId=" + categoryId + "&ManufacturerId=" + manufacturerId + "'>" + brandName + "</a></li>";
                            }
                        }
                    }

                    navigation += "</ul></li>";
                }

                litNavigation.Text = navigation;
                SessionManager.GetOrAddToCache = navigation;
            }            
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
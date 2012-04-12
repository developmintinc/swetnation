using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Orders;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Metrics;
using MerchantTribe.Commerce.Payment;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce.BusinessRules;
using MerchantTribe.Web.Logging;
using SwetNation.Web.models;

namespace SwetNation.Web
{
    public partial class Cart : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!Page.IsPostBack)
            {
                BindCartItems();
            }
        }

        protected void BindCartItems()
        {
            CartViewModel model = new CartViewModel();
            model = LoadCart(model);
            litSubTotal.Text = model.CurrentOrder.OrderDiscountDetails.Count > 0 ? string.Format("{0:c}", model.CurrentOrder.TotalOrderAfterDiscounts) : string.Format("{0:c}", model.CurrentOrder.TotalOrderBeforeDiscounts);
            rptCartItems.DataSource = model.LineItems;
            rptCartItems.DataBind();
        }
        
        private CartViewModel LoadCart(CartViewModel model)
        {
            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            if (Basket == null)
            {
                ///////////////////////////////////////////////////////////
                // TO DO
                ///////////////////////////////////////////////////////////
                lblMessage.Text = "there are no items in your shopping cart";
            }

            model.CurrentOrder = Basket;

            if ((Basket.Items == null) || ((Basket.Items != null) && (Basket.Items.Count <= 0)))
            {
                model.CartEmpty = true;
                ///////////////////////////////////////////////////////////
                // TO DO
                ///////////////////////////////////////////////////////////
            }

            foreach (LineItem li in model.CurrentOrder.Items)
            {
                CartLineItemViewModel ci = new CartLineItemViewModel();
                ci.Item = li;

                MerchantTribe.Commerce.Catalog.Product associatedProduct = li.GetAssociatedProduct(MTApp);
                if (associatedProduct != null)
                {
                    ci.ShowImage = true;
                    ci.ImageUrl = MerchantTribe.Commerce.Storage.DiskStorage.ProductVariantImageUrlMedium(MTApp.CurrentStore.Id, li.ProductId, associatedProduct.ImageFileSmall, li.VariantId, Request.IsSecureConnection);
                    ci.LinkUrl = "ProductDetail.aspx?bvin=" + associatedProduct.Bvin + "&OrderBvin=" + li.OrderBvin + "&LineItemId=" + li.Id;
                }


                if (li.LineTotal != li.LineTotalWithoutDiscounts)
                {
                    ci.HasDiscounts = true;
                }

                model.LineItems.Add(ci);                
            }

            return model;
        }

        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            HiddenField hfdLineItemId = (HiddenField)e.Item.FindControl("hfdLineItemId");
            string lineItemId = hfdLineItemId.Value;
            HiddenField hfdOrderBvin = (HiddenField)e.Item.FindControl("hfdOrderBvin");
            string orderBvin = hfdOrderBvin.Value;
            if (lineItemId != string.Empty && orderBvin != string.Empty)
            {
                if (e.CommandName == "RemoveItemFromCart")
                {
                    RemoveLineItem(lineItemId, orderBvin);
                    BindCartItems();
                }
            }
        }

        public void RemoveLineItem(string lineItemId, string orderBvin)
        {
            long Id = 0;
            long.TryParse(lineItemId, out Id);

            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            if (Basket != null)
            {
                if (Basket.bvin == orderBvin)
                {
                    var li = Basket.Items.Where(y => y.Id == Id).SingleOrDefault();
                    if (li != null)
                    {
                        Basket.Items.Remove(li);
                        MTApp.CalculateOrderAndSave(Basket);
                        SessionManager.SaveOrderCookies(Basket, MTApp.CurrentStore);
                    }
                }
            }            
        }
    }
}
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
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class Cart : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            this.IsLive();

            if (!Page.IsPostBack)
            {
                BindCartItems();
            }
        }

        public void btnAddCoupon_Click(object sender, EventArgs e)
        {
            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            string code = txtCouponCode.Text ?? string.Empty;
            Basket.AddCouponCode(code.Trim());
            MTApp.CalculateOrderAndSave(Basket);
            SessionManager.SaveOrderCookies(Basket, MTApp.CurrentStore);
            Response.Redirect("Cart.aspx");
        }

        protected void BindCartItems()
        {
            CartViewModel model = new CartViewModel();
            model = LoadCart(model);

            ////////////////////////////////////////////////////
            // SHIPPING
            ////////////////////////////////////////////////////
            SortableCollection<MerchantTribe.Commerce.Shipping.ShippingRateDisplay> Rates = MTApp.OrderServices.FindAvailableShippingRates(model.CurrentOrder);
            decimal shippingTotal = 0;
            foreach (MerchantTribe.Commerce.Shipping.ShippingRateDisplay rate in Rates)
            {
                if (!model.FreeShipping && !rate.DisplayName.ToLower().Contains("free"))
                {
                    shippingTotal = rate.Rate;
                    MTApp.OrderServices.OrdersRequestShippingMethodByUniqueKey(rate.UniqueKey, model.CurrentOrder);
                    MTApp.CalculateOrder(model.CurrentOrder);
                    MTApp.OrderServices.Orders.Update(model.CurrentOrder);
                    SessionManager.SaveOrderCookies(model.CurrentOrder, MTApp.CurrentStore);
                }
                else if (model.FreeShipping && rate.DisplayName.ToLower().Contains("free"))
                {
                    MTApp.OrderServices.OrdersRequestShippingMethodByUniqueKey(rate.UniqueKey, model.CurrentOrder);
                    MTApp.CalculateOrder(model.CurrentOrder);
                    MTApp.OrderServices.Orders.Update(model.CurrentOrder);
                    SessionManager.SaveOrderCookies(model.CurrentOrder, MTApp.CurrentStore);
                }

                //shippingrate.Value = rate.UniqueKey;                
            }            

            ////////////////////////////////////////////////////
            // TOTALS
            ////////////////////////////////////////////////////
            if (model.CurrentOrder.OrderDiscountDetails.Count > 0)
            {
                pnlTotalDiscount.Visible = true;
                litTotalOrderDiscounts.Text = string.Format("{0:c}", model.CurrentOrder.TotalOrderDiscounts);
            }

            litSubTotal.Text = string.Format("{0:c}", model.CurrentOrder.TotalOrderBeforeDiscounts);
            litTax.Text = string.Format("{0:c}", model.CurrentOrder.TotalTax);
            litShipping.Text = string.Format("{0:c}", model.CurrentOrder.TotalShippingAfterDiscounts);
            litGrandTotal.Text = string.Format("{0:c}", model.CurrentOrder.TotalGrand);

            ////////////////////////////////////////////////////
            // ITEMS
            ////////////////////////////////////////////////////
            rptCartItems.DataSource = model.LineItems;
            rptCartItems.DataBind();
        }
        
        private CartViewModel LoadCart(CartViewModel model)
        {
            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            if (Basket == null)
            {
                lblMessage.Text = "there are no items in your shopping cart";
            }

            model.CurrentOrder = Basket;

            if ((Basket.Items == null) || ((Basket.Items != null) && (Basket.Items.Count <= 0)))
            {
                model.CartEmpty = true;
            }

            bool freeShipping = true;
            foreach (LineItem li in model.CurrentOrder.Items)
            {
                CartLineItemViewModel ci = new CartLineItemViewModel();
                ci.Item = li;

                MerchantTribe.Commerce.Catalog.Product associatedProduct = li.GetAssociatedProduct(MTApp);
                if (associatedProduct != null)
                {
                    if (freeShipping)
                        freeShipping = associatedProduct.ShippingDetails.IsNonShipping;

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

            model.FreeShipping = freeShipping;

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

        public void lnkSecureShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}
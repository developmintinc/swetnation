using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Orders;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Payment;
using MerchantTribe.Commerce.BusinessRules;
using MerchantTribe.Payment;
using MerchantTribe.Web.Logging;
using MerchantTribe.Web.Validation;
using SwetNation.Web.models;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class Receipt : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();

            LoadOrder();
        }

        private void LoadOrder()
        {
            if (Request.Params["id"] != null)
            {
                Order o = MTApp.OrderServices.Orders.FindForCurrentStore(Request.Params["id"]);
                if (o == null)
                {
                    this.FlashFailure("Order could not be found. Please contact store for assistance.");
                    return;
                }

                litOrderNumber.Text = o.OrderNumber;
                //litFullOrderStatusDescription.Text = o.FullOrderStatusDescription();
                litBillingAddress.Text = o.BillingAddress.ToHtmlString();
                litShippingAddress.Text = o.ShippingAddress.ToHtmlString();

                litTotalsAsTable.Text = o.TotalsAsTable();

                // Order Items
                ucViewOrderItems.items = o.Items;
                ucViewOrderItems.LoadOrderItems();

                OrderPaymentSummary paySummary = MTApp.OrderServices.PaymentSummary(o);
                //ViewBag.OrderPaymentSummary = paySummary;                
            }
            else
            {
                FlashFailure("Order Number missing. Please contact an administrator.");
                return;
            }
        }
    }
}
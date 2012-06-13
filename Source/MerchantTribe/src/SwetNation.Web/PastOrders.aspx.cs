using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Orders;
using MerchantTribe.Commerce.Catalog;

namespace SwetNation.Web
{
    public partial class PastOrders : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            this.IsLive();
            if (!Page.IsPostBack)
            {
                GetOrderHistory();
            }
        }

        public string OrderLink(MerchantTribe.Commerce.Orders.OrderSnapshot o)
        {
            if (o == null) return string.Empty;
            string toFormat = "~/account/orderhistory/details/{0}";
            if (!string.IsNullOrEmpty(o.AcumaticaId)) { toFormat += "?acumaticamod=1"; }
            return (string.Format(toFormat, o.bvin));
        }

        public void GetOrderHistory()
        {
            List<OrderSnapshot> orders = LoadOrders();
            lstOrderHistory.DataSource = orders;
            lstOrderHistory.DataBind();
        }

        private List<OrderSnapshot> LoadOrders()
        {
            int totalCount = 0;
            List<OrderSnapshot> orders = new List<OrderSnapshot>();

            // pull all BV Orders
            orders = MTApp.OrderServices.Orders.FindByUserId(SessionManager.GetCurrentUserId(MTApp.CurrentStore), 1, 100, ref totalCount);

            if (orders == null) return new List<OrderSnapshot>();

            return orders;
        }

        protected void lstOrderHistory_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (String.Equals(e.CommandName, "GetDetails"))
            {
                pnlDetails.Visible = true;
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                string bvin = lstOrderHistory.DataKeys[dataItem.DisplayIndex].Value.ToString();
                GetOrderHistoryDetail(bvin);
            }
        }

        private void GetOrderHistoryDetail(string bvin)
        {
            Order o = MTApp.OrderServices.Orders.FindForCurrentStore(bvin);
            litOrderNumber.Text = o.OrderNumber;
            litFullOrderStatusDescription.Text = o.FullOrderStatusDescription();
            litBillingAddress.Text = o.BillingAddress.ToHtmlString();
            litShippingAddress.Text = o.ShippingAddress.ToHtmlString();
            pnlInstructions.Visible = (bool)(o.Instructions.Trim().Length > 0);
            litInstructions.Text = o.Instructions;
            pnlCoupon.Visible = (bool)(o.Coupons.Count() > 0);
            blCoupons.DataSource = o.Coupons;
            blCoupons.DataTextField = "CouponCode";
            blCoupons.DataBind();
            litTotalsAsTable.Text = o.TotalsAsTable();
            pnlPackages.Visible = (bool)(o.Packages.Count() > 0);
            lstPackages.DataSource = o.Packages;
            lstPackages.DataBind();

            lstItems.DataSource = o.Items;
            lstItems.DataBind();

            OrderPaymentSummary paySummary = MTApp.OrderServices.PaymentSummary(o);
            litPaymentsSummary.Text = paySummary.PaymentsSummary;
            litAmountCharged.Text = string.Format("{0:C}", paySummary.AmountCharged - paySummary.GiftCardAmount);
            litGiftCardAmount.Text = paySummary.GiftCardAmount.ToString("C");
            litTotalCredit.Text = paySummary.TotalCredit.ToString("C");
            litAmountRefunded.Text = paySummary.AmountRefunded.ToString("C");
            litAmountDue.Text = paySummary.AmountDue.ToString("C");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web.controls
{
    public partial class ViewOrderItems : BaseUserControl
    {
        public List<MerchantTribe.Commerce.Orders.LineItem> items {get;set;}

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadOrderItems()
        {
            rptOrderItems.DataSource = items;
            rptOrderItems.DataBind();
        }
    }
}
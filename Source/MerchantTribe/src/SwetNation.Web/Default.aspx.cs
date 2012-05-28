using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class Index : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            GetFeaturedBrands();
        }

        private void GetFeaturedBrands()
        {
            List<MerchantTribe.Commerce.Contacts.VendorManufacturer> vm = MTApp.ContactServices.Manufacturers.FindAll();
            lstFeaturedBrands.DataSource = vm;
            lstFeaturedBrands.DataBind();
        }

        public string ConvertSaleEndDateToString(DateTime saleEndsDate)
        {
            string saleEndsString = "";
            if (saleEndsDate != DateTime.MinValue)
            {
                saleEndsString = "SALE ENDS ON " + ConvertSaleEndDateToString(saleEndsDate.Month) + " " + saleEndsDate.Day;
            }
            else
            {
                saleEndsString = "SALE IS OPEN ENDED";
            }            
            return saleEndsString;
        }

        public string ConvertSaleEndDateToString(int month)
        {
            string monthString = "";
            switch (month)
            {
                case 1:
                    monthString = "JANUARY";
                    break;
                case 2:
                    monthString = "FEBUARY";
                    break;
                case 3:
                    monthString = "MARCH";
                    break;
                case 4:
                    monthString = "APRIL";
                    break;
                case 5:
                    monthString = "MAY";
                    break;
                case 6:
                    monthString = "JUNE";
                    break;
                case 7:
                    monthString = "JULY";
                    break;
                case 8:
                    monthString = "AUGUST";
                    break;
                case 9:
                    monthString = "SEPTEMBER";
                    break;
                case 10:
                    monthString = "OCTOBER";
                    break;
                case 11:
                    monthString = "NOVEMBER";
                    break;
                case 12:
                    monthString = "DECEMBER";
                    break;                
            }
            return monthString;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MerchantTribe.Commerce;
using MerchantTribe.Web.Geography;
using System.Text;
using MerchantTribe.Commerce.Orders;
using MerchantTribe.Commerce.Shipping;
using MerchantTribe.Commerce.Utilities;
using SwetNation.Web.models;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class EstimateShipping : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            if (!Page.IsPostBack)
            {
                Session["message"] = "";
                Setup();
            }
        }

        public void Setup()
        {
            EstimateShippingViewModel model = BuildViewModel();
            GetRates(model);

            // Populate Data for DropDownLists
            Country currentCountry = Country.FindByBvin(model.CountryId);
            if (currentCountry != null) 
                Session["Regions"] = currentCountry.Regions;                       
        }

        private EstimateShippingViewModel BuildViewModel()
        {
            EstimateShippingViewModel model = new EstimateShippingViewModel();
            List<Country> countries = MTApp.CurrentStore.Settings.FindActiveCountries();
            CountryId.DataSource = countries;
            CountryId.DataTextField = "DisplayName";
            CountryId.DataValueField = "Bvin";
            CountryId.DataBind();

            if (SessionManager.CurrentUserHasCart(MTApp.CurrentStore))
            {
                Order basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
                if (basket.ShippingAddress.CountryBvin != string.Empty)
                {
                    model.CountryId = basket.ShippingAddress.CountryBvin;
                }
                if (basket.ShippingAddress.RegionBvin != string.Empty)
                {
                    model.RegionId = basket.ShippingAddress.RegionBvin;
                    RegionId.Value = basket.ShippingAddress.RegionBvin;
                    TempRegionId.Value = basket.ShippingAddress.RegionBvin;
                }
                model.City = basket.ShippingAddress.City;
                City.Text = basket.ShippingAddress.City;
                model.PostalCode = basket.ShippingAddress.PostalCode;
                PostalCode.Text = basket.ShippingAddress.PostalCode;
            }
            return model;
        }

        private void GetRates(EstimateShippingViewModel model)
        {
            if (SessionManager.CurrentUserHasCart(MTApp.CurrentStore) == true)
            {
                Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
                if (Basket != null)
                {
                    Basket.ShippingAddress.PostalCode = model.PostalCode;
                    if (model.CountryId != string.Empty)
                    {
                        Country current = MerchantTribe.Web.Geography.Country.FindByBvin(model.CountryId);
                        if (current != null)
                        {
                            Basket.ShippingAddress.CountryBvin = model.CountryId;
                            Basket.ShippingAddress.CountryName = current.DisplayName;
                            Basket.ShippingAddress.RegionBvin = model.RegionId;
                            Basket.ShippingAddress.RegionName = model.RegionId;
                        }
                    }

                    MTApp.OrderServices.Orders.Update(Basket);
                    SortableCollection<ShippingRateDisplay> Rates;
                    Rates = MTApp.OrderServices.FindAvailableShippingRates(Basket);
                    if (Rates.Count < 1)
                    {
                        Session["message"] = "Unable to estimate at this time";
                    }
                    model.Rates = Rates.ToList();
                    blRates.DataSource = Rates.ToList();
                    blRates.DataTextField = "RateAndNameForDisplay";
                    blRates.DataValueField = "RateAndNameForDisplay";
                    blRates.DataBind();
                }
            }
        }

        public class ShippingRatesJsonResponse
        {
            public string totalsastable = string.Empty;
            public string rates = "";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Orders;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Payment;
using MerchantTribe.Commerce.BusinessRules;
using MerchantTribe.Web.Logging;
using MerchantTribe.Web.Validation;
using SwetNation.Web.models;

namespace SwetNation.Web
{
    public partial class Checkout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckoutViewModel model = IndexSetup();
        }

        private CheckoutViewModel IndexSetup()
        {
            CheckoutViewModel model = new CheckoutViewModel();
            LoadOrder(model);
            CheckForPoints(model);

            // Buttons
            ThemeManager themes = MTApp.ThemeManager();
            //model.ButtonCheckoutUrl = themes.ButtonUrl("PlaceOrder", Request.IsSecureConnection);
            //model.ButtonLoginUrl = MTApp.ThemeManager().ButtonUrl("Login", Request.IsSecureConnection);
            imgLogin.ImageUrl = MTApp.ThemeManager().ButtonUrl("Login", Request.IsSecureConnection);
            imgPlaceOrder.ImageUrl = themes.ButtonUrl("PlaceOrder", Request.IsSecureConnection);

            // Labels
            model.LabelRewardPoints = MTApp.CurrentStore.Settings.RewardsPointsName;

            // Agree Checkbox
            if (MTApp.CurrentStore.Settings.ForceTermsAgreement)
            {
                pnlShowAgreeToTerms.Visible = true;
                model.ShowAgreeToTerms = true;
                model.AgreedToTerms = false;
                model.AgreedToTermsDescription = SiteTerms.GetTerm(SiteTermIds.TermsAndConditionsAgreement);
                litAgreedToTermsDescription.Text = SiteTerms.GetTerm(SiteTermIds.TermsAndConditionsAgreement);
                model.LabelTerms = SiteTerms.GetTerm(SiteTermIds.TermsAndConditions);
                hypSiteTerms.NavigateUrl = "Terms.aspx";
                hypSiteTerms.Text = SiteTerms.GetTerm(SiteTermIds.TermsAndConditions);
            }
            else
            {
                pnlShowAgreeToTerms.Visible = false;
                model.ShowAgreeToTerms = false;
                model.AgreedToTerms = true;
            }

            // Populate Countries
            model.Countries = MTApp.CurrentStore.Settings.FindActiveCountries();
            //model.PaymentViewModel.AcceptedCardTypes = MTApp.CurrentStore.Settings.PaymentAcceptedCards;

            return model;
        }

        private void LoadOrder(CheckoutViewModel model)
        {
            Order result = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
            if (result == null) Response.Redirect("Cart.aspx");
            model.CurrentOrder = result;
            
            if (result.Items.Count == 0)
            {
                Response.Redirect("Cart.aspx");
            }

            // Form Values
            hypForgotPassword.NavigateUrl = "ForgotPassword.aspx?Email=" + model.CurrentOrder.UserEmail;
            txtSpecialInstructions.Text = model.CurrentOrder.Instructions;
            litTotalsAsTable.Text = model.CurrentOrder.TotalsAsTable();

            // Email
            model.IsLoggedIn = false;
            if (SessionManager.IsUserAuthenticated(this.MTApp))
            {
                model.IsLoggedIn = true;
                model.CurrentCustomer = MTApp.CurrentCustomer;
                if (model.CurrentCustomer != null)
                {
                    txtCustomerEmail.Text = model.CurrentCustomer.Email;
                }

                // Copy customer addresses to order
                model.CurrentCustomer.ShippingAddress.CopyTo(model.CurrentOrder.ShippingAddress);
                if (model.BillShipSame == false)
                {
                    Address billAddr = model.CurrentCustomer.BillingAddress;
                    billAddr.CopyTo(model.CurrentOrder.BillingAddress);
                    chkBillSame.Checked = false;
                }
                else
                {
                    chkBillSame.Checked = true;
                }
            }

            // Payment
            DisplayPaymentMethods(model);
        }
        
        public void CheckForPoints(CheckoutViewModel model)
        {
            model.ShowRewards = false;

            if (model.CurrentCustomer == null || model.CurrentCustomer.Bvin == string.Empty) return;

            string uid = model.CurrentCustomer.Bvin;
            int points = MTApp.CustomerPointsManager.FindAvailablePoints(uid);
            if (points > 0 && MTApp.CurrentStore.Settings.RewardsPointsOnPurchasesActive)
            {
                model.ShowRewards = true;
                int potentialPointsToUse = MTApp.CustomerPointsManager.PointsNeededForPurchaseAmount(model.CurrentOrder.TotalOrderAfterDiscounts);
                int amountToUse = 0;
                if (points > potentialPointsToUse)
                {
                    amountToUse = potentialPointsToUse;
                }
                else
                {
                    amountToUse = points;
                }
                model.RewardPointsAvailable = "You have " + points.ToString() + " " + model.LabelRewardPoints + " available.";
                decimal dollarValue = MTApp.CustomerPointsManager.DollarCreditForPoints(amountToUse);
                model.LabelRewardsUse = "Use " + amountToUse.ToString() + " [" + dollarValue.ToString("C") + "] " + model.LabelRewardPoints;
            }
        }

        public void DisplayPaymentMethods(CheckoutViewModel model)
        {
            MerchantTribe.Commerce.Payment.AvailablePayments availablePayments = new MerchantTribe.Commerce.Payment.AvailablePayments();
            Collection<DisplayPaymentMethod> enabledMethods;
            enabledMethods = availablePayments.EnabledMethods(MTApp.CurrentStore);

            model.PaymentViewModel.CheckDescription = WebAppSettings.PaymentCheckDescription;
            model.PaymentViewModel.CodDescription = WebAppSettings.PaymentCODDescription;
            model.PaymentViewModel.CompanyAccountDescription = WebAppSettings.PaymentCompanyAccountName;
            model.PaymentViewModel.PurchaseOrderDescription = WebAppSettings.PaymentPurchaseOrderName;
            model.PaymentViewModel.TelephoneDescription = WebAppSettings.PaymentTelephoneDescription;

            if ((model.CurrentOrder.TotalOrderAfterDiscounts > 0) || (!MTApp.CurrentStore.Settings.AllowZeroDollarOrders))
            {
                model.PaymentViewModel.NoPaymentNeeded = false;
                foreach (DisplayPaymentMethod m in enabledMethods)
                {
                    switch (m.MethodId)
                    {
                        case WebAppSettings.PaymentIdCheck:
                            model.PaymentViewModel.IsCheckActive = true;
                            break;
                        case WebAppSettings.PaymentIdCreditCard:
                            model.PaymentViewModel.IsCreditCardActive = true;
                            break;
                        case WebAppSettings.PaymentIdTelephone:
                            model.PaymentViewModel.IsTelephoneActive = true;
                            break;
                        case WebAppSettings.PaymentIdPurchaseOrder:
                            model.PaymentViewModel.IsPurchaseOrderActive = true;
                            break;
                        case WebAppSettings.PaymentIdCompanyAccount:
                            model.PaymentViewModel.IsCompanyAccountActive = true;
                            break;
                        case WebAppSettings.PaymentIdCashOnDelivery:
                            model.PaymentViewModel.IsCodActive = true;
                            break;
                        case WebAppSettings.PaymentIdPaypalExpress:
                            model.PaymentViewModel.IsPayPalActive = true;
                            break;
                        default:
                            // do nothing
                            break;
                    }
                }

                if (enabledMethods.Count == 1)
                {
                    switch (enabledMethods[0].MethodId)
                    {
                        case WebAppSettings.PaymentIdCheck:
                            model.PaymentViewModel.SelectedPayment = "check";
                            break;
                        case WebAppSettings.PaymentIdCreditCard:
                            model.PaymentViewModel.SelectedPayment = "creditcard";
                            break;
                        case WebAppSettings.PaymentIdTelephone:
                            model.PaymentViewModel.SelectedPayment = "telephone";
                            break;
                        case WebAppSettings.PaymentIdPurchaseOrder:
                            model.PaymentViewModel.SelectedPayment = "purchaseorder";
                            break;
                        case WebAppSettings.PaymentIdCompanyAccount:
                            model.PaymentViewModel.SelectedPayment = "companyaccount";
                            break;
                        case WebAppSettings.PaymentIdCashOnDelivery:
                            model.PaymentViewModel.SelectedPayment = "cod";
                            break;
                        case WebAppSettings.PaymentIdPaypalExpress:
                            model.PaymentViewModel.SelectedPayment = "paypal";
                            break;
                    }
                }
                else
                {
                    if (model.PaymentViewModel.IsCreditCardActive)
                    {
                        model.PaymentViewModel.SelectedPayment = "creditcard";
                    }
                }
            }
            else
            {
                model.PaymentViewModel.NoPaymentNeeded = true;
                model.PaymentViewModel.NoPaymentNeededDescription = WebAppSettings.PaymentNoPaymentNeededDescription;
            }
        }

        protected void chkBillSame_CheckedChanged(Object sender, EventArgs args)
        {
            CheckBox linkedItem = sender as CheckBox;
            CheckoutAddressBilling.ShowForm = linkedItem.Checked;
        }
    }
}
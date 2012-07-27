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
using MerchantTribe.Payment;
using MerchantTribe.Web.Logging;
using MerchantTribe.Web.Validation;
using SwetNation.Web.models;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    ////////////////////////////////////////////////////////////////////
    // SECTIONS:
    // SHIPPING ADDRESS
    // BILLING ADDRESS
    // REWARD POINTS
    // PAYMENT METHODS
    // SPECIAL INSTRUCTIONS
    // TERMS
    // ORDER SUMMARY
    ////////////////////////////////////////////////////////////////////
    public partial class Checkout : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            this.IsLive();
            Session["messages"] = "";
            if (!Page.IsPostBack)
            {
                // First time in I disable the validation for billing address
                SetBillingValidationGroup(true);
                CheckoutViewModel model = IndexSetup();
            }
        }

        ////////////////////////////////////////////////////////////////////
        // INITIALIZE
        ////////////////////////////////////////////////////////////////////
        private CheckoutViewModel IndexSetup()
        {
            CheckoutViewModel model = new CheckoutViewModel();
            LoadAddress();
            LoadOrder(model);
            CheckForPoints(model);

            // Labels
            model.LabelRewardPoints = MTApp.CurrentStore.Settings.RewardsPointsName;
            litRewardPoints.Text = model.LabelRewardPoints;

            // Agree Checkbox
            if (!MTApp.CurrentStore.Settings.ForceTermsAgreement)
            {
                pnlShowAgreeToTerms.Visible = false;
                model.ShowAgreeToTerms = false;
                model.AgreedToTerms = true;
            }

            // Populate Countries
            model.Countries = MTApp.CurrentStore.Settings.FindActiveCountries();

            return model;
        }

        ////////////////////////////////////////////////////////////////////
        // SHIPPING ADDRESS
        ////////////////////////////////////////////////////////////////////
        private void LoadAddress()
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                switch (u.ShippingAddress.IsEmpty() && u.BillingAddress.IsEmpty())
                {
                    case true:
                        ////////////////////////////////////////////////////////////////////
                        // SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        MerchantTribe.Commerce.Contacts.Address s = new MerchantTribe.Commerce.Contacts.Address();
                        s.Bvin = System.Guid.NewGuid().ToString();
                        hdfShippingAddressBvin.Value = s.Bvin;

                        ////////////////////////////////////////////////////////////////////
                        // BILLING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        MerchantTribe.Commerce.Contacts.Address b = new MerchantTribe.Commerce.Contacts.Address();
                        b.Bvin = System.Guid.NewGuid().ToString();
                        hdfBillingAddressBvin.Value = b.Bvin;
                        break;
                    default:
                        ////////////////////////////////////////////////////////////////////
                        // SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        if (u.ShippingAddress != null)
                        {
                            hdfShippingAddressBvin.Value = u.ShippingAddress.Bvin;
                            txtShippingFirstName.Text = txtShippingFirstName.Text == "" ? u.ShippingAddress.FirstName : txtShippingFirstName.Text;
                            txtShippingLastName.Text = txtShippingLastName.Text == "" ? u.ShippingAddress.LastName : txtShippingLastName.Text;
                            txtShippingAddress1.Text = txtShippingAddress1.Text == "" ? u.ShippingAddress.Line1 : txtShippingAddress1.Text;
                            txtShippingAddress2.Text = txtShippingAddress2.Text == "" ? u.ShippingAddress.Line2 : txtShippingAddress2.Text;
                            txtShippingCity.Text = txtShippingCity.Text == "" ? u.ShippingAddress.City : txtShippingCity.Text;
                            MerchantTribe.Web.Geography.RegionSnapShot shippingRegionSnapShot = u.ShippingAddress.RegionData;
                            ddlShippingState.SelectedIndex = ddlShippingState.Items.IndexOf(ddlShippingState.Items.FindByValue(shippingRegionSnapShot.Abbreviation));
                            txtShippingPostalCode.Text = txtShippingPostalCode.Text == "" ? u.ShippingAddress.PostalCode : txtShippingPostalCode.Text;
                            if (u.ShippingAddress.Phone != "")
                                txtShippingPhoneNumber.Text = u.ShippingAddress.Phone;
                        }

                        ////////////////////////////////////////////////////////////////////
                        // BILLING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        if (u.BillingAddress != null)
                        {
                            hdfBillingAddressBvin.Value = u.BillingAddress.Bvin;
                            txtBillingFirstName.Text = txtBillingFirstName.Text == "" ? u.BillingAddress.FirstName : txtBillingFirstName.Text;
                            txtBillingLastName.Text = txtBillingLastName.Text == "" ? u.BillingAddress.LastName : txtBillingLastName.Text;
                            txtBillingAddress1.Text = txtBillingAddress1.Text == "" ? u.BillingAddress.Line1 : txtBillingAddress1.Text;
                            txtBillingAddress2.Text = txtBillingAddress2.Text == "" ? u.BillingAddress.Line2 : txtBillingAddress2.Text;
                            txtBillingCity.Text = txtBillingCity.Text == "" ? u.BillingAddress.City : txtBillingCity.Text;
                            MerchantTribe.Web.Geography.RegionSnapShot billingRegionSnapShot = u.BillingAddress.RegionData;
                            ddlBillingState.SelectedIndex = ddlBillingState.Items.IndexOf(ddlBillingState.Items.FindByValue(billingRegionSnapShot.Abbreviation));
                            txtBillingPostalCode.Text = txtBillingPostalCode.Text == "" ? u.BillingAddress.PostalCode : txtBillingPostalCode.Text;
                        }

                        break;
                }
            }
        }

        ////////////////////////////////////////////////////////////////////
        // LOAD ORDER DETAILS
        ////////////////////////////////////////////////////////////////////
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
            txtSpecialInstructions.Text = model.CurrentOrder.Instructions;
            litTotalsAsTable.Text = model.CurrentOrder.TotalsAsTable();

            // Email
            model.CurrentCustomer = MTApp.CurrentCustomer;

            // Copy customer addresses to order
            model.CurrentCustomer.ShippingAddress.CopyTo(model.CurrentOrder.ShippingAddress);
            model.CurrentCustomer.BillingAddress.CopyTo(model.CurrentOrder.BillingAddress);

            // Payment
            DisplayPaymentMethods(model);

            // Order Items
            ucViewOrderItems.items = model.CurrentOrder.Items;
            ucViewOrderItems.LoadOrderItems();
        }

        ////////////////////////////////////////////////////////////////////
        // REWARD POINTS
        ////////////////////////////////////////////////////////////////////
        void CheckForPoints(CheckoutViewModel model)
        {
            pnlShowRewards.Visible = false;

            if (model.CurrentCustomer == null || model.CurrentCustomer.Bvin == string.Empty) return;

            string uid = model.CurrentCustomer.Bvin;
            int points = MTApp.CustomerPointsManager.FindAvailablePoints(uid);
            decimal pointsValue = MTApp.CustomerPointsManager.DollarCreditForPoints(points);
            if (points > 0 && MTApp.CurrentStore.Settings.RewardsPointsOnPurchasesActive && (pointsValue > model.CurrentOrder.TotalOrderAfterDiscounts))
            {
                pnlShowRewards.Visible = true;
                int potentialPointsToUse = MTApp.CustomerPointsManager.PointsNeededForPurchaseAmount(model.CurrentOrder.TotalOrderBeforeDiscounts);
                int amountToUse = 0;
                if (points > potentialPointsToUse)
                {
                    amountToUse = potentialPointsToUse;
                }
                else
                {
                    amountToUse = points;
                }
                litRewardPointsAvailable.Text = "You have [" + pointsValue.ToString("C") + "] " + model.LabelRewardPoints + " available.";
                decimal dollarValue = MTApp.CustomerPointsManager.DollarCreditForPoints(amountToUse);
                litLabelRewardsUse.Text = "Use [" + dollarValue.ToString("C") + "] " + model.LabelRewardPoints;
            }
        }
                
        ////////////////////////////////////////////////////////////////////
        // PAYMENT METHODS
        ////////////////////////////////////////////////////////////////////
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
                        case WebAppSettings.PaymentIdCreditCard:
                            model.PaymentViewModel.SelectedPayment = "creditcard";
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

        ////////////////////////////////////////////////////////////////////
        // COPY SHIPPING ADDRESS TO BILLING ADDRESS
        ////////////////////////////////////////////////////////////////////
        protected void chkBillingSame_CheckedChanged(Object sender, EventArgs args)
        {
            CheckBox linkedItem = sender as CheckBox;
            if (!linkedItem.Checked)
            {
                pnlBillingSection.Visible = true;
                SetBillingValidationGroup(false);
                txtBillingFirstName.Text = "";
                txtBillingLastName.Text = "";
                txtBillingAddress1.Text = "";
                txtBillingAddress2.Text = "";
                txtBillingCity.Text = "";
                ddlBillingState.SelectedIndex = 0;
                txtBillingPostalCode.Text = "";                
            }
            else
            {
                pnlBillingSection.Visible = false;
                SetBillingValidationGroup(true);
            }
        }

        private void SetBillingValidationGroup(bool disable)
        {
            if (disable)
            {
                rfvBillingFirstName.ValidationGroup = "";
                rfvBillingLastName.ValidationGroup = "";
                rfvBillingAddress1.ValidationGroup = "";
                rfvBillingCity.ValidationGroup = "";
                rfvBillingState.ValidationGroup = "";
                rfvBillingPostalCode.ValidationGroup = "";
            }
            else
            {
                rfvBillingFirstName.ValidationGroup = "vgMyAccount";
                rfvBillingLastName.ValidationGroup = "vgMyAccount";
                rfvBillingAddress1.ValidationGroup = "vgMyAccount";
                rfvBillingCity.ValidationGroup = "vgMyAccount";
                rfvBillingState.ValidationGroup = "vgMyAccount";
                rfvBillingPostalCode.ValidationGroup = "vgMyAccount";
            }
        }

        protected void UpdateAddress()
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                ////////////////////////////////////////////////////////////////////
                // SAVE ADDRESSES
                ////////////////////////////////////////////////////////////////////
                MerchantTribe.Web.Geography.RegionSnapShot shippingRegionSnapShot = new MerchantTribe.Web.Geography.RegionSnapShot();
                shippingRegionSnapShot.Abbreviation = ddlShippingState.SelectedItem.Value;
                shippingRegionSnapShot.Name = ddlShippingState.SelectedItem.Text;

                Address s = new Address();
                s.Bvin = hdfShippingAddressBvin.Value;
                s.FirstName = txtShippingFirstName.Text;
                s.LastName = txtShippingLastName.Text;
                s.Line1 = txtShippingAddress1.Text;
                s.Line2 = txtShippingAddress2.Text;
                s.City = txtShippingCity.Text;
                s.PostalCode = txtShippingPostalCode.Text;
                s.RegionData = shippingRegionSnapShot;
                s.Phone = txtShippingPhoneNumber.Text;

                Address b = new Address();
                b.Bvin = hdfBillingAddressBvin.Value;
                if (chkBillingSame.Checked)
                {
                    b.FirstName = s.FirstName;
                    b.LastName = s.LastName;
                    b.Line1 = s.Line1;
                    b.Line2 = s.Line2;
                    b.City = s.City;
                    b.PostalCode = s.PostalCode;
                    b.RegionData = s.RegionData;
                }
                else
                {
                    MerchantTribe.Web.Geography.RegionSnapShot billingRegionSnapShot = new MerchantTribe.Web.Geography.RegionSnapShot();
                    billingRegionSnapShot.Abbreviation = ddlBillingState.SelectedItem.Value;
                    billingRegionSnapShot.Name = ddlBillingState.SelectedItem.Text;

                    b.FirstName = txtBillingFirstName.Text;
                    b.LastName = txtBillingLastName.Text;
                    b.Line1 = txtBillingAddress1.Text;
                    b.Line2 = txtBillingAddress2.Text;
                    b.City = txtBillingCity.Text;
                    b.PostalCode = txtBillingPostalCode.Text;
                    b.RegionData = billingRegionSnapShot;
                }

                ////////////////////////////////////////////////////////////////////
                // SAVE ADDRESS TO SHIPPING AND BILLING
                ////////////////////////////////////////////////////////////////////
                u.ShippingAddress = s;
                u.BillingAddress = b;

                ////////////////////////////////////////////////////////////////////
                // SAVE USER PROFILE
                ////////////////////////////////////////////////////////////////////
                MTApp.MembershipServices.UpdateCustomer(u);
            }
        }

        public void lnkPlaceOrder_Click(Object sender, EventArgs args)
        {
            UpdateAddress();
            CheckoutViewModel model = IndexSetup();
            TagOrderWithAffiliate(model);
            LoadValuesFromForm(model);
            if (ValidateOrder(model))
            {
                ProcessOrder(model);
            }

            // Render Error Summary
            foreach (var v in model.Violations)
            {
                FlashFailure(v.ErrorMessage);
            }
        }

        private void TagOrderWithAffiliate(CheckoutViewModel model)
        {
            string affid = MTApp.ContactServices.GetValidAffiliateId(MTApp).ToString();
            if (!string.IsNullOrEmpty(affid))
            {
                model.CurrentOrder.AffiliateID = affid;
            }
        }

        private void LoadValuesFromForm(CheckoutViewModel model)
        {
            //CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            //model.CurrentCustomer = u;
            //model.CurrentOrder.BillingAddress = u.BillingAddress;
            //model.CurrentOrder.ShippingAddress = u.ShippingAddress;

            // Save addresses to customer account
            //MTApp.MembershipServices.Customers.Update(model.CurrentCustomer);

            //Shipping
            string shippingRateKey = Request.QueryString["shippingrate"];
            MTApp.OrderServices.OrdersRequestShippingMethodByUniqueKey(shippingRateKey, model.CurrentOrder);

            // Save Values so far in case of later errors
            MTApp.CalculateOrder(model.CurrentOrder);

            // Save Payment Information                    
            model.UseRewardsPoints = radUseRewardsPoints.Checked;
            ApplyRewardsPoints(model);

            // Payment Methods
            LoadPaymentFromForm(model);
            SavePaymentSelections(model);

            model.CurrentOrder.Instructions = txtSpecialInstructions.Text;

            // Save all the changes to the order
            MTApp.OrderServices.Orders.Update(model.CurrentOrder);
            SessionManager.SaveOrderCookies(model.CurrentOrder, MTApp.CurrentStore);
        }

        private void ApplyRewardsPoints(CheckoutViewModel model)
        {
            // Remove any current points info transactions
            foreach (OrderTransaction t in MTApp.OrderServices.Transactions.FindForOrder(model.CurrentOrder.bvin))
            {
                if (t.Action == MerchantTribe.Payment.ActionType.RewardPointsInfo)
                {
                    MTApp.OrderServices.Transactions.Delete(t.Id);
                }
            }

            // Don't add if we're not using points
            if (!model.UseRewardsPoints) return;

            // Apply Info to Order
            OrderPaymentManager payManager = new OrderPaymentManager(model.CurrentOrder, MTApp);
            payManager.RewardsPointsAddInfo(RewardsPotentialCredit(model));
        }

        private decimal RewardsPotentialCredit(CheckoutViewModel model)
        {
            decimal result = 0;
            if (!model.UseRewardsPoints) return result;

            int points = MTApp.CustomerPointsManager.FindAvailablePoints(model.CurrentCustomer.Bvin);
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
            result = MTApp.CustomerPointsManager.DollarCreditForPoints(amountToUse);
            return result;
        }

        private void LoadPaymentFromForm(CheckoutViewModel model)
        {
            model.PaymentViewModel.SelectedPayment = hfdPayMethod.Value ?? string.Empty;
            model.PaymentViewModel.DataPurchaseOrderNumber = string.Empty;
            model.PaymentViewModel.DataCompanyAccountNumber = string.Empty;
            model.PaymentViewModel.DataCreditCard.CardHolderName = txtCCCardHolder.Text ?? string.Empty;
            model.PaymentViewModel.DataCreditCard.CardNumber = MerchantTribe.Payment.CardValidator.CleanCardNumber(txtCCNumber.Text ?? string.Empty);
            int expMonth = -1;
            int.TryParse(ddlCCExpMonth.SelectedValue ?? string.Empty, out expMonth);
            model.PaymentViewModel.DataCreditCard.ExpirationMonth = expMonth;
            int expYear = -1;
            int.TryParse(ddlCCExpYear.SelectedValue ?? string.Empty, out expYear);
            model.PaymentViewModel.DataCreditCard.ExpirationYear = expYear;
            model.PaymentViewModel.DataCreditCard.SecurityCode = txtCCSecurityCode.Text ?? string.Empty;
        }

        private void SavePaymentSelections(CheckoutViewModel model)
        {
            OrderPaymentManager payManager = new OrderPaymentManager(model.CurrentOrder, MTApp);
            payManager.ClearAllNonStoreCreditTransactions();

            bool found = false;
            if (model.PaymentViewModel.SelectedPayment == "creditcard")
            {
                found = true;
                payManager.CreditCardAddInfo(model.PaymentViewModel.DataCreditCard, model.CurrentOrder.TotalGrandAfterStoreCredits(MTApp.OrderServices));
            }

            if ((found == false) && (model.PaymentViewModel.SelectedPayment == "paypal"))
            {
                found = true;
                // Need token and id before we can add this to the order
                // Handled on the checkout page.
                // payManager.PayPalExpressAddInfo(o.TotalGrand);
            }
        }

        private bool ValidateOrder(CheckoutViewModel model)
        {
            bool result = true;
            if (model.AgreedToTerms == false && model.ShowAgreeToTerms == true)
            {
                model.Violations.Add(new MerchantTribe.Web.Validation.RuleViolation("Terms", "Terms", SiteTerms.GetTerm(SiteTermIds.SiteTermsAgreementError)));
                result = false;
            }

            // Validate Shipping Address
            model.Violations.AddRange(ValidateAddress(model.CurrentOrder.ShippingAddress, "Shipping"));

            // Validate Billing Address
            model.Violations.AddRange(ValidateAddress(model.CurrentOrder.BillingAddress, "Billing"));

            Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);

            // Make sure a shipping method is selected
            // Basket validation checks for shipping method unique key
            if (!Basket.IsValid())
            {
                model.Violations.AddRange(Basket.GetRuleViolations());
            }

            // Payment Validation
            model.Violations.AddRange(ValidatePayment(model));

            if ((model.Violations.Count > 0))
            {
                result = false;
            }

            return result;
        }

        private List<MerchantTribe.Web.Validation.RuleViolation> ValidateAddress(Address a, string prefix)
        {
            List<MerchantTribe.Web.Validation.RuleViolation> result = new List<MerchantTribe.Web.Validation.RuleViolation>();
            string pre = prefix.Trim().ToLowerInvariant();
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " Country Name", a.CountryData.Name, result, pre + "countryname");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " First Name", a.FirstName, result, pre + "firstname");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " Last Name", a.LastName, result, pre + "lastname");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " Street", a.Line1, result, pre + "address");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " City", a.City, result, pre + "city");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " Postal Code", a.PostalCode, result, pre + "zip");
            MerchantTribe.Web.Validation.ValidationHelper.Required(prefix + " Region/State", a.RegionData.Abbreviation, result, pre + "state");
            return result;
        }

        private List<MerchantTribe.Web.Validation.RuleViolation> ValidatePayment(CheckoutViewModel model)
        {
            List<MerchantTribe.Web.Validation.RuleViolation> violations = new List<MerchantTribe.Web.Validation.RuleViolation>();

            // Nothing to validate if no payment is needed
            if (model.PaymentViewModel.NoPaymentNeeded)
            {
                return violations;
            }

            if (model.PaymentViewModel.SelectedPayment == "creditcard")
            {
                return ValidateCreditCard(model);
            }
            
            if (model.PaymentViewModel.SelectedPayment == "paypal")
            {
                return violations;
            }

            // We haven't return anything so nothing is selected.
            // Try CC as default payment method        
            if (model.PaymentViewModel.DataCreditCard.CardNumber.Length > 12)
            {
                model.PaymentViewModel.SelectedPayment = "creditcard";
                return ValidateCreditCard(model);
            }

            // nothing selected, trial of cc failed
            violations.Add(new RuleViolation("Payment Method", "", "Please select a payment method", ""));

            return violations;
        }

        private List<RuleViolation> ValidateCreditCard(CheckoutViewModel model)
        {
            List<RuleViolation> violations = new List<RuleViolation>();
            if ((!MerchantTribe.Payment.CardValidator.IsCardNumberValid(model.PaymentViewModel.DataCreditCard.CardNumber)))
            {
                violations.Add(new RuleViolation("Credit Card Number", "", "Please enter a valid credit card number", "cccardnumber"));
            }

            MerchantTribe.Payment.CardType cardTypeCheck = MerchantTribe.Payment.CardValidator.GetCardTypeFromNumber(model.PaymentViewModel.DataCreditCard.CardNumber);
            List<CardType> acceptedCards = MTApp.CurrentStore.Settings.PaymentAcceptedCards;
            if (!acceptedCards.Contains(cardTypeCheck))
            {
                violations.Add(new RuleViolation("Card Type Not Accepted", "", "That card type is not accepted by this store. Please use a different card.", "cccardnumber"));
            }

            ValidationHelper.RequiredMinimum(1, "Card Expiration Year", model.PaymentViewModel.DataCreditCard.ExpirationYear, violations, "ccexpyear");
            ValidationHelper.RequiredMinimum(1, "Card Expiration Month", model.PaymentViewModel.DataCreditCard.ExpirationMonth, violations, "ccexpmonth");
            ValidationHelper.Required("Name on Card", model.PaymentViewModel.DataCreditCard.CardHolderName, violations, "cccardholder");

            if (MTApp.CurrentStore.Settings.PaymentCreditCardRequireCVV == true)
            {
                ValidationHelper.RequiredMinimum(3, "Card Security Code", model.PaymentViewModel.DataCreditCard.SecurityCode.Length, violations, "ccsecuritycode");
            }

            return violations;
        }

        ////////////////////////////////////////////////////////////////////
        // PROCESS ORDER
        ////////////////////////////////////////////////////////////////////
        private void ProcessOrder(CheckoutViewModel model)
        {
            // Save as Order
            OrderTaskContext c = new OrderTaskContext(MTApp);
            c.UserId = SessionManager.GetCurrentUserId(MTApp.CurrentStore);
            c.Order = model.CurrentOrder;

            // Check for PayPal Request            
            bool paypalCheckoutSelected = model.PaymentViewModel.SelectedPayment == "paypal";
            if (paypalCheckoutSelected)
            {
                c.Inputs.Add("bvsoftware", "Mode", "PaypalExpress");
                c.Inputs.Add("bvsoftware", "AddressSupplied", "1");
                if (!Workflow.RunByName(c, WorkflowNames.ThirdPartyCheckoutSelected))
                {
                    EventLog.LogEvent("Paypal Express Checkout Failed", "Specific Errors to follow", EventLogSeverity.Error);
                    // Show Errors     
                    List<MerchantTribe.Web.Validation.RuleViolation> violations = new List<MerchantTribe.Web.Validation.RuleViolation>();
                    foreach (WorkflowMessage item in c.GetCustomerVisibleErrors())
                    {
                        violations.Add(new MerchantTribe.Web.Validation.RuleViolation("Workflow", item.Name, item.Description));
                    }
                }
            }
            else
            {
                if (Workflow.RunByName(c, WorkflowNames.ProcessNewOrder) == true)
                {
                    // Clear Cart ID because we're now an order
                    SessionManager.SetCurrentCartId(MTApp.CurrentStore, string.Empty);

                    // Process Payment
                    if (MerchantTribe.Commerce.BusinessRules.Workflow.RunByName(c, MerchantTribe.Commerce.BusinessRules.WorkflowNames.ProcessNewOrderPayments))
                    {
                        MerchantTribe.Commerce.BusinessRules.Workflow.RunByName(c, MerchantTribe.Commerce.BusinessRules.WorkflowNames.ProcessNewOrderAfterPayments);
                        Order tempOrder = MTApp.OrderServices.Orders.FindForCurrentStore(model.CurrentOrder.bvin);
                        MerchantTribe.Commerce.Integration.Current().OrderReceived(tempOrder, MTApp);
                        Response.Redirect("Receipt.aspx?id=" + model.CurrentOrder.bvin);
                    }
                    else
                    {
                        // Redirect to Payment Error
                        SessionManager.SetCurrentPaymentPendingCartId(MTApp.CurrentStore, model.CurrentOrder.bvin);
                        //Response.Redirect("PaymentError.aspx");
                        this.FlashFailure("The payment information you provided was not able to be processed. Please update your payment information and try again.");
                    }
                }
                else
                {
                    // Show Errors      
                    List<MerchantTribe.Web.Validation.RuleViolation> violations = new List<MerchantTribe.Web.Validation.RuleViolation>();
                    foreach (WorkflowMessage item in c.GetCustomerVisibleErrors())
                    {
                        violations.Add(new MerchantTribe.Web.Validation.RuleViolation("Workflow", item.Name, item.Description));
                    }
                    if (violations.Count < 1)
                    {
                        violations.Add(new MerchantTribe.Web.Validation.RuleViolation("Workflow", "Internal Error", "An internal error occured while attempting to place your order. Please contact the store owner directly to complete your order."));
                    }
                }
            }
        }

        protected void radUseRewardsPoints_CheckedChanged(object sender, System.EventArgs e)
        {
            if (radUseRewardsPoints.Checked == true)
            {
                rfvCCNumber.ValidationGroup = "";
                rfvSecurityCode.ValidationGroup = "";
                rfvCCCardHolder.ValidationGroup = "";
                rfvCCExpMonth.ValidationGroup = "";
                rfvCCExpYear.ValidationGroup = "";
            }
            else
            {
                rfvCCNumber.ValidationGroup = "vgMyAccount";
                rfvSecurityCode.ValidationGroup = "vgMyAccount";
                rfvCCCardHolder.ValidationGroup = "vgMyAccount";
                rfvCCExpMonth.ValidationGroup = "vgMyAccount";
                rfvCCExpYear.ValidationGroup = "vgMyAccount";
            }
        }

        public void lnkCancelOrder_Click(Object sender, EventArgs args)
        {
            string bvin = SessionManager.GetCurrentPaymentPendingCartId(MTApp.CurrentStore);
            if (bvin.Trim().Length < 1) Response.Redirect("Cart.aspx");

            Order Basket = MTApp.OrderServices.Orders.FindForCurrentStore(bvin);
            if (Basket != null)
            {
                Basket.StatusCode = OrderStatusCode.Cancelled;
                Basket.StatusName = "Cancelled";

                OrderNote n = new OrderNote();
                n.IsPublic = true;
                n.Note = "Cancelled by Customer";
                Basket.Notes.Add(n);

                MTApp.OrderServices.Orders.Update(Basket);
                SessionManager.SetCurrentPaymentPendingCartId(MTApp.CurrentStore, string.Empty);
            }
            Response.Redirect("Cart.aspx");
        }
    }
}
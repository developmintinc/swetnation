using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.models;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Marketing;
using MerchantTribe.Commerce.Marketing.PromotionQualifications;
using MerchantTribe.Commerce.Membership;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class SignUp : BasePage
    {
        Utilities _utilities;

        protected void Page_Load(object sender, EventArgs e)
        {
            _utilities = new Utilities(MTApp);
            Session["messages"] = "";

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["InvitedBy"] != "")
                {
                    Session["InvitedBy"] = string.Format("{0}", Request.QueryString["InvitedBy"]);
                }

                litAgreedToTermsDescription.Text = SiteTerms.GetTerm(SiteTermIds.TermsAndConditionsAgreement);
                hypSiteTerms.NavigateUrl = "TermsOfUse.aspx";
                hypSiteTerms.Text = SiteTerms.GetTerm(SiteTermIds.TermsAndConditions);
            }            
        }
                
        public void btnSignUp_Click(object sender, EventArgs e)
        {
            if (chkAgreed.Checked)
            {
                SignInViewModel posted = new SignInViewModel();
                posted.FirstName = txtFirstName.Text;
                posted.LastName = txtLastName.Text;
                posted.Email = txtEmail.Text;
                posted.Password = txtPassword.Text;
                posted.PasswordConfirm = txtConfirmPassword.Text;
                posted.Gender = ddlGender.SelectedValue;

                // Process Requrest
                ValidateModelResponse validated = ValidateLoginModel(posted, true);
                if (validated.Success == false)
                {
                    foreach (string s in validated.ResultMessages)
                    {
                        FlashWarning(s);
                    }
                }
                else
                {
                    bool result = false;
                    CustomerAccount u = new CustomerAccount();
                    if (u != null)
                    {
                        ////////////////////////////////////////////////////////////////////
                        // SETUP USER
                        ////////////////////////////////////////////////////////////////////
                        u.FirstName = posted.FirstName.Trim();
                        u.LastName = posted.LastName.Trim();
                        u.Email = posted.Email.Trim();
                        u.Gender = posted.Gender;

                        ////////////////////////////////////////////////////////////////////
                        // SETUP SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        Address a = new Address();
                        a.Bvin = System.Guid.NewGuid().ToString();
                        a.FirstName = u.FirstName;
                        a.LastName = u.LastName;
                        u.ShippingAddress = a;

                        ////////////////////////////////////////////////////////////////////
                        // CREATE USER
                        ////////////////////////////////////////////////////////////////////
                        CreateUserStatus s = CreateUserStatus.None;
                        result = MTApp.MembershipServices.CreateCustomer(u, ref s, posted.Password.Trim());
                        if (result == false)
                        {
                            switch (s)
                            {
                                case CreateUserStatus.DuplicateUsername:
                                    FlashWarning("That email already exists. Select another email or login to your current account.");
                                    break;
                                default:
                                    FlashWarning("Unable to save user. Unknown error.");
                                    break;
                            }
                        }
                        else
                        {
                            // Update bvin field so that next save will call updated instead of create
                            MerchantTribe.Web.Cookies.SetCookieString(WebAppSettings.CookieNameAuthenticationTokenCustomer(MTApp.CurrentStore.Id), u.Bvin, this.Request.RequestContext.HttpContext, false, new EventLog());

                            if (string.Format("{0}", Session["InvitedBy"]) != "")
                            {
                                // SIGN UP NEW MEMBER WITH PROMO CODE
                                //_utilities.CreatePromoForInvitedFriend(u.Email, false);
                                
                                // SIGN UP EXISITNG MEMBER WITH PROMO CODE
                                _utilities.CreatePromoForInvitedFriend(string.Format("{0}", Session["InvitedBy"]), false);

                                // SEND EMAIL TO EXISTING MEMBER INFORMING THEM OF PROMO CODE
                                SendInvitationConfirmationEmail(u.FirstName + " " + u.LastName);
                            }

                            Response.Redirect("~/Default.aspx");
                        }
                    }
                }
            }
            else
            {
                Session["messages"] = "<span style='font-size:14px;color:red;font-weight:bold'>You must agree to our terms to proceed</span>";
            }
        }

        private ValidateModelResponse ValidateLoginModel(SignInViewModel posted, bool isCreate)
        {
            ValidateModelResponse resp = new ValidateModelResponse();
            resp.Success = true;

            if (posted == null)
            {
                resp.Success = false;
                return resp;
            }

            if (!MerchantTribe.Web.Validation.EmailValidation.MeetsEmailFormatRequirements(posted.Email))
            {
                resp.Success = false;
                resp.ResultMessages.Add("Please enter a valid email address");
            }

            if (posted.Password.Trim().Length < WebAppSettings.PasswordMinimumLength)
            {
                resp.Success = false;
                resp.ResultMessages.Add("Password must be at least " + WebAppSettings.PasswordMinimumLength + " characters long.");
            }

            if (isCreate)
            {
                if (posted.PasswordConfirm != posted.Password)
                {
                    resp.Success = false;
                    resp.ResultMessages.Add("Passwords don't match. Please try again.");
                }
            }
            return resp;
        }

        private void SendInvitationConfirmationEmail(string memberName)
        {
            ///////////////////////////////////////////////////////////////
            // CREATE BODY MESSAGE
            ///////////////////////////////////////////////////////////////
            string emailAddress = string.Format("{0}", Session["InvitedBy"]);
            string message = "You invited " + memberName + " to join Swet Nation and they did. Now you are rewarded with a $10 off your next purchase by using the following Promo Code: 'INVITE'.</a><br /><br />";

            ///////////////////////////////////////////////////////////////
            // CREATE MAIL MESSAGE
            ///////////////////////////////////////////////////////////////
            if (IsEmailSyntaxValid(emailAddress))
            {
                System.Net.Mail.MailAddress mailAddress = new System.Net.Mail.MailAddress("noreply@swetnation.com");
                System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();
                m.IsBodyHtml = true;
                m.From = mailAddress;
                m.To.Add(emailAddress.Trim());
                m.Subject = "Swet Nation :: $10 Off Your Next Order";
                m.Body = message;
                MerchantTribe.Commerce.Utilities.MailServices.SendMail(m);
            }
        }

        private bool IsEmailSyntaxValid(string emailToValidate)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(emailToValidate, @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        private class ValidateModelResponse
        {
            public bool Success { get; set; }
            public List<string> ResultMessages { get; set; }
            public ValidateModelResponse()
            {
                Success = false;
                ResultMessages = new List<string>();
            }
        }
    }
}
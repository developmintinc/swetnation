using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.models;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;

namespace SwetNation.Web
{
    public partial class SignUp : NotAuthorizedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["messages"] = "";
        }


        public void btnSignUp_Click(object sender, EventArgs e)
        {
            SignInViewModel posted = new SignInViewModel();
            posted.Email = txtEmail.Text;
            posted.Password = txtPassword.Text;
            posted.PasswordConfirm = txtPassword.Text;

            // Process Requrest
            ValidateModelResponse validated = ValidateLoginModel(posted, false);
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
                    u.Email = posted.Email.Trim();
                    CreateUserStatus s = CreateUserStatus.None;
                    
                    // Create new user
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
                        MerchantTribe.Web.Cookies.SetCookieString(WebAppSettings.CookieNameAuthenticationTokenCustomer(MTApp.CurrentStore.Id),
                                                                  u.Bvin,
                                                                  this.Request.RequestContext.HttpContext, false, new EventLog());
                        Response.Redirect("~/MyAccount.aspx");
                    }
                }
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
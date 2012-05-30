using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.models;
using MerchantTribe.Commerce;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class SignIn : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["messages"] = "";
        }

        public void btnSignIn_Click(object sender, EventArgs e)
        {
            SignInViewModel posted = new SignInViewModel();
            posted.Email = txtEmail.Text;
            posted.Password = txtPassword.Text;
            posted.PasswordConfirm = txtPassword.Text;

            if (Request.QueryString["mode"] != null)
            {
                posted.Mode = Request.QueryString["mode"];
            }

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
                string errorMessage = string.Empty;
                string userId = string.Empty;
                if (MTApp.MembershipServices.LoginCustomer(posted.Email.Trim(), posted.Password.Trim(), ref errorMessage, this.Request.RequestContext.HttpContext, ref userId, MTApp))
                {
                    MerchantTribe.Commerce.Orders.Order cart = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
                    if (cart != null && !string.IsNullOrEmpty(cart.bvin))
                    {
                        cart.UserEmail = posted.Email.Trim();
                        cart.UserID = userId;
                        MTApp.CalculateOrderAndSave(cart);
                        SessionManager.SaveOrderCookies(cart, MTApp.CurrentStore);
                    }

                    // if we got here from checkout, return to checkout
                    if (posted.Mode.Trim().ToLowerInvariant() == "checkout")
                    {
                        Response.Redirect("~/Checkout.aspx");
                    }
                    // otherwise send to account home
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    string errorMessage2 = string.Empty;
                    // Failed to Login as Customer, Try admin account
                    if (MTApp.AccountServices.LoginAdminUser(posted.Email.Trim(), posted.Password.Trim(), ref errorMessage2, this.Request.RequestContext.HttpContext, MTApp))
                    {
                        //Response.Redirect("~/bvadmin");
                    }
                    this.FlashWarning(errorMessage);
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
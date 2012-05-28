using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Contacts;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            Session["messages"] = "";
        }

        public void lnkUpdate_Click(object sender, EventArgs e)
        {
            string currentpassword = txtCurrentPassword.Text;
            string newpassword = txtNewPassword.Text;

            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            CustomerAccount current = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (current == null)
            {
                FlashWarning("Error, please try again.");
                return;
            }

            if (!MTApp.MembershipServices.DoPasswordsMatchForCustomer(currentpassword.Trim(), current))
            {
                FlashWarning("Check your current password and try again.");
                return;
            }

            try
            {
                if (newpassword.Trim().Length < WebAppSettings.PasswordMinimumLength)
                {
                    FlashWarning("Password must be at least " + WebAppSettings.PasswordMinimumLength + " characters long.");
                }
                else
                {
                    if (MTApp.MembershipServices.ChangePasswordForCustomer(current.Email, currentpassword.Trim(), newpassword.Trim()))
                    {
                        FlashSuccess("Password Updated.");
                    }
                    else
                    {
                        FlashWarning("Password could not be updated.");
                    }

                    if (MTApp.MembershipServices.ResetPasswordForCustomer(current.Email, newpassword))
                    {

                    }
                }
            }
            catch (SystemMembershipUserException cex)
            {
                switch (cex.Status)
                {
                    case CreateUserStatus.UpdateFailed:
                        FlashWarning("Couldn't Save Changes. " + cex.Message);
                        break;
                    case CreateUserStatus.InvalidPassword:
                        FlashWarning("Couldn't Save Changes. Check your password and try again.");
                        break;
                    default:
                        FlashFailure(cex.Message);
                        break;
                }
            }

            return;
        }
    }
}
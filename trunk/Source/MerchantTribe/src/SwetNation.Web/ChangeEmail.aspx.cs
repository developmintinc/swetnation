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
    public partial class ChangeEmail : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            Session["messages"] = "";
        }

        public void lnkUpdate_Click(object sender, EventArgs e)
        {
            string currentpassword = txtCurrentPassword.Text;
            string newemail = txtNewEmail.Text;
            Session["NewEmail"] = newemail;

            CustomerAccount current = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (current == null)
            {
                FlashWarning("Error, please try again.");
                return;
            }

            if (!MTApp.MembershipServices.DoPasswordsMatchForCustomer(currentpassword.Trim(), current))
            {
                FlashWarning("Your password was incorrect. Try Again.");
                return;
            }

            try
            {
                if (!MerchantTribe.Web.Validation.EmailValidation.MeetsEmailFormatRequirements(newemail))
                {
                    FlashWarning("Please enter a valid new email address.");
                    return;
                }

                string oldEmail = current.Email;
                MTApp.MembershipServices.UpdateCustomerEmail(current, newemail.Trim());

                List<MailingListSnapShot> lists = MTApp.ContactServices.MailingLists.FindAllPublicPaged(1, 1000);
                foreach (MailingListSnapShot m in lists)
                {
                    if (MTApp.ContactServices.MailingLists.CheckMembership(m.Id, oldEmail))
                    {
                        MailingList l = MTApp.ContactServices.MailingLists.Find(m.Id);
                        l.UpdateMemberEmail(oldEmail, newemail.Trim());
                    }
                }

                FlashSuccess("Email Address Changed");
            }
            catch (SystemMembershipUserException CreateEx)
            {
                switch (CreateEx.Status)
                {
                    case CreateUserStatus.DuplicateUsername:
                        FlashWarning("A user account with that email address already exists. Please select another email address.");
                        break;
                    case CreateUserStatus.InvalidPassword:
                        FlashWarning("Please check your password and try again.");
                        break;
                    case CreateUserStatus.UserNotFound:
                        FlashFailure("User account couldn't be located.");
                        break;
                }
            }

            return;
        }
    }
}
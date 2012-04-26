using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Utilities;

namespace SwetNation.Web
{
    public partial class ForgotPassword : NotAuthorizedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["messages"] = "";
        }

        public void btnSendReminder_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            if (!MerchantTribe.Web.Validation.EmailValidation.MeetsEmailFormatRequirements(email))
            {
                FlashWarning("Please enter a valid email address");
                return;
            }

            try
            {
                CustomerAccount thisUser = MTApp.MembershipServices.Customers.FindByEmail(email);
                string newPassword = string.Empty;
                if ((thisUser != null) && (thisUser.Bvin != string.Empty))
                {
                    newPassword = MTApp.MembershipServices.GeneratePasswordForCustomer(WebAppSettings.PasswordMinimumLength + 2);
                    thisUser.Password = thisUser.EncryptPassword(newPassword);
                    if (MTApp.MembershipServices.UpdateCustomer(thisUser))
                    {
                        HtmlTemplate t = MTApp.ContentServices.GetHtmlTemplateOrDefault(HtmlTemplateType.ForgotPassword);
                        if (t != null)
                        {
                            System.Net.Mail.MailMessage m;
                            List<IReplaceable> tempList = new List<IReplaceable>();
                            tempList.Add(thisUser);
                            tempList.Add(new Replaceable("[[NewPassword]]", newPassword));
                            t = t.ReplaceTagsInTemplate(MTApp, tempList);
                            m = t.ConvertToMailMessage(thisUser.Email);
                            if (MailServices.SendMail(m) == false)
                            {
                                FlashFailure("Error while sending mail!");
                            }
                        }

                        FlashSuccess("Your new password has been sent by email.");
                    }
                    else
                    {
                        FlashFailure("An error occurred while trying to update password.");
                    }
                }
                else
                {
                    FlashFailure(SiteTerms.GetTerm(SiteTermIds.Username) + " not found.");
                }
                return;
            }

            catch (SystemMembershipUserException CreateEx)
            {
                switch (CreateEx.Status)
                {
                    case CreateUserStatus.UpdateFailed:
                        FlashFailure("Update to user account failed.");
                        break;
                    default:
                        FlashFailure(CreateEx.Message);
                        break;
                }
            }
        }
    }
}
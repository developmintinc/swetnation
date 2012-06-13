using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Membership;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class InviteFriend : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            Session["messages"] = "";
        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            ///////////////////////////////////////////////////////////////
            // CAPTURE MEMBERS EMAIL ADDRESS
            ///////////////////////////////////////////////////////////////
            string memberEmail = "";
            string memberName = "";
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                memberEmail = u.Email;
                memberName = u.FirstName + " " + u.LastName;
            }

            ///////////////////////////////////////////////////////////////
            // CREATE BODY MESSAGE
            ///////////////////////////////////////////////////////////////
            string[] emailAddresses = txtFriendsEmail.Text.Trim().Split(';');
            string message = "<a href='https://swetnation.com/SingUp.aspx?InvitedBy=" + memberEmail + "'>You are invited to join Swet Nation by " + memberName + ". After you sign up and become a member by following this link to Swet Nation you will be able to use the following Promo Code: 'INVITE' and get $10 off your first purchase.</a><br /><br />";
            if (txtMessage.Text != "")
            {
                message += txtMessage.Text;
            }

            ///////////////////////////////////////////////////////////////
            // CREATE MAIL MESSAGE
            ///////////////////////////////////////////////////////////////
            foreach (string emailAddress in emailAddresses)
            {
                if (IsEmailSyntaxValid(emailAddress))
                {
                    System.Net.Mail.MailAddress mailAddress = new System.Net.Mail.MailAddress("noreply@swetnation.com");
                    System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();
                    m.IsBodyHtml = true;
                    m.From = mailAddress;
                    m.To.Add(emailAddress.Trim());
                    m.Subject = "Swet Nation :: Members Only Invitation";
                    m.Body = message;
                    if (MerchantTribe.Commerce.Utilities.MailServices.SendMail(m))
                    {
                        this.FlashSuccess("Your invitation has been sent, thank you!");
                    }
                    else
                    {
                        this.FlashFailure("The invitation did not go through. Please try again!");
                    }
                }
                else
                {
                    this.FlashFailure("The following email address is not valid: " + emailAddress);
                }
            }
        }

        private bool IsEmailSyntaxValid(string emailToValidate)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(emailToValidate, @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }
    }
}
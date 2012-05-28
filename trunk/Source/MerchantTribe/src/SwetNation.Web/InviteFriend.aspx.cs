using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class InviteFriend : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();
            Session["messages"] = ""; ;
        }

        public void btnSubmit_Click(object sender, EventArgs e)
        {
            ///////////////////////////////////////////////////////////////
            // CREATE BODY MESSAGE
            ///////////////////////////////////////////////////////////////
            string[] emailAddresses = txtFriendsEmail.Text.Trim().Split(';');
            string message = "You are invited to join <a href='https://swetnation.com/web/join.aspx'>Swet Nation</a>"; ;
            if (txtMessage.Text != "")
            {
                message = "You are invited to join <a href='https://swetnation.com/web/join.aspx'>Swet Nation</a></br></br>";
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
                    m.Subject = "Swet Nation :: Invitation";
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
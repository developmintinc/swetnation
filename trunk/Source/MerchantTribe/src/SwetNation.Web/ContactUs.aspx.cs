using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class ContactUs : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["messages"] = "";
        }

        public void btnContactUs_Click(object sender, EventArgs e)
        {
            ///////////////////////////////////////////////////////////////
            // CREATE BODY MESSAGE
            ///////////////////////////////////////////////////////////////
            string body = "Name: " + txtName.Text + "</br>";
            body += "Email: " + txtEmail.Text + "</br>";
            body += "Message: " + txtMessage.Text + "</br>";

            ///////////////////////////////////////////////////////////////
            // CREATE MAIL MESSAGE
            ///////////////////////////////////////////////////////////////
            System.Net.Mail.MailAddress mailAddress = new System.Net.Mail.MailAddress("support@swetnation.com");
            System.Net.Mail.MailMessage m = new System.Net.Mail.MailMessage();
            m.IsBodyHtml = true;
            m.From = mailAddress;
            m.To.Add(mailAddress);
            m.Subject = "Swet Nation :: Contact Us Request";
            m.Body = body;
            if (MerchantTribe.Commerce.Utilities.MailServices.SendMail(m))
            {
                this.FlashSuccess("Your message has been sent, thank you!");
            }
            else
            {
                this.FlashFailure("The message did not go through. Please try again!");
            }
        }
    }
}
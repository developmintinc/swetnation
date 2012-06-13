using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Marketing;
using MerchantTribe.Commerce.Marketing.PromotionQualifications;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class Test : BasePage
    {
        bool removeUser = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = "ryancmartin1976@yahoo.com";            

            //string newpassword = "SRTECH1!";
            /*
            CustomerAccount current = MTApp.MembershipServices.Customers.FindByEmail(email);
            if (MTApp.MembershipServices.ResetPasswordForCustomer(email, newpassword))
            {
                FlashSuccess("Password Updated.");
            }
            else
            {
                FlashWarning("Password could not be updated.");
            }
            */

            CreatePromoForInvitedFriend(email);
        }

        private void CreatePromoForInvitedFriend(string email)
        {
            ///////////////////////////////////////////////////////
            // GET PROMOTION
            ///////////////////////////////////////////////////////
            Promotion p = GetCurrentPromotion();
            if (p == null) return;

            ///////////////////////////////////////////////////////
            // GET QUALIFICATION
            ///////////////////////////////////////////////////////
            UserIs q = (UserIs)GetCurrentQualification(p);
            if (q == null) return;

            ///////////////////////////////////////////////////////
            // GET MEMBERS
            ///////////////////////////////////////////////////////
            CustomerAccount u = MTApp.MembershipServices.Customers.FindByEmail(email);
            if (u != null)
            {
                ///////////////////////////////////////////////////////
                // ADD USER TO QUALIFICIATION
                ///////////////////////////////////////////////////////
                if (removeUser)
                    q.RemoveUserId(u.Bvin);
                else
                    q.AddUserId(u.Bvin);
                MTApp.MarketingServices.Promotions.Update(p);
            }
        }

        private IPromotionQualification GetCurrentQualification(Promotion p)
        {
            if (p == null) return null;
            string itemId = "3";
            long temp = 0;
            long.TryParse(itemId, out temp);
            IPromotionQualification q = p.GetQualification(temp);
            return q;
        }

        private Promotion GetCurrentPromotion()
        {
            string promoid = "8";
            long pid = 0;
            long.TryParse(promoid, out pid);
            Promotion p = MTApp.MarketingServices.Promotions.Find(pid);
            return p;
        }
    }
}
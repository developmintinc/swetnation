using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Marketing;
using MerchantTribe.Commerce.Marketing.PromotionQualifications;

namespace SwetNation.Web.Code
{
    public class Utilities
    {
        MerchantTribeApplication _mtapp;
        public Utilities(MerchantTribeApplication mtapp)
        {
            _mtapp = mtapp;
        }

        public void CreatePromoForInvitedFriend(string memberEmail, bool removeUser)
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
            CustomerAccount u = _mtapp.MembershipServices.Customers.FindByEmail(memberEmail);
            if (u != null)
            {
                ///////////////////////////////////////////////////////
                // ADD USER TO QUALIFICIATION
                ///////////////////////////////////////////////////////
                if (removeUser)
                    q.RemoveUserId(u.Bvin);
                else
                    q.AddUserId(u.Bvin);

                _mtapp.MarketingServices.Promotions.Update(p);
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
            Promotion p = _mtapp.MarketingServices.Promotions.Find(pid);
            return p;
        }
    }
}
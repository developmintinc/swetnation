using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MerchantTribe.Payment
{
    public static class EnumHelper
    {
        public static string ActionTypeToString(ActionType a)
        {
            switch (a)
            {
                case ActionType.CreditCardCapture:
                    return "Credit Card Capture Hold";                    
                case ActionType.CreditCardCharge:
                    return "Credit Card Charge";                    
                case ActionType.CreditCardHold:
                    return "Credit Card Hold";                    
                case ActionType.CreditCardInfo:
                    return "Credit Card Info";                    
                case ActionType.CreditCardRefund:
                    return "Credit Card Refund";                    
                case ActionType.CreditCardVoid:
                    return "Credit Card Void";    
                case ActionType.CashReceived:
                    return "Cash Received";
                case ActionType.CashReturned:
                    return "Cash Returned";
                case ActionType.CheckReceived:
                    return "Check Received";
                case ActionType.CheckReturned:
                    return "Check Returned";
                case ActionType.GiftCardActivate:
                    return "Gift Card Activate";
                case ActionType.GiftCardCapture:
                    return "Gift Card Capture";
                case ActionType.GiftCardDecrease:
                    return "Gift Card Decrease Value";
                case ActionType.GiftCardHold:
                    return "Gift Card Hold Funds";
                case ActionType.GiftCardIncrease:
                    return "Gift Card Increase Value";
                case ActionType.GiftCardInfo:
                    return "Gift Card Info";
                case ActionType.RewardPointsBalanceInquiry:
                    return "Credits Balance Inquiry";                    
                case ActionType.RewardPointsCapture:
                    return "Credits Capture";
                case ActionType.RewardPointsDecrease:
                    return "Credits Decrease";
                case ActionType.RewardPointsHold:
                    return "Credits Hold";
                case ActionType.RewardPointsIncrease:
                    return "Credits Increase";
                case ActionType.RewardPointsInfo:
                    return "Credits Info";
                case ActionType.RewardPointsUnHold:
                    return "Credits UnHold";
                case ActionType.PayPalCapture:
                    return "PayPal Capture Hold";
                case ActionType.PayPalCharge:
                    return "PayPal Charge";
                case ActionType.PayPalHold:
                    return "PayPal Hold";
                case ActionType.PayPalRefund:
                    return "PayPal Refund";
                case ActionType.PayPalVoid:
                    return "PayPal Void";
                case ActionType.PayPalExpressCheckoutInfo:
                    return "PayPal Express Checkout Selected";
                case ActionType.PurchaseOrderAccepted:
                    return "Purchase Order Accepted";
                case ActionType.PurchaseOrderInfo:
                    return "Purchase Order Info";
                case ActionType.CompanyAccountAccepted:
                    return "Company Account Accepted";
                case ActionType.CompanyAccountInfo:
                    return "Company Account Info";

            }

            return "Unknown";
        }
    }
}

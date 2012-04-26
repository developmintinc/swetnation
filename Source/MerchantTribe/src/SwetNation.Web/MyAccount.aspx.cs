using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce;

namespace SwetNation.Web
{
    public partial class MyAccount : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadAddress();
            }
        }

        private void LoadAddress()
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                switch (u.Addresses.Count)
                {
                    case 0:
                        MerchantTribe.Commerce.Contacts.Address a = new MerchantTribe.Commerce.Contacts.Address();
                        a.Bvin = System.Guid.NewGuid().ToString();
                        hfdAddressBvin.Value = a.Bvin;
                        break;
                    default:
                        foreach (MerchantTribe.Commerce.Contacts.Address address in u.Addresses)
                        {
                            hfdAddressBvin.Value = address.Bvin;
                            txtFirstName.Text = address.FirstName;
                            txtLastName.Text = address.LastName;
                            txtAddress1.Text = address.Line1;
                            txtAddress2.Text = address.Line2;
                            txtCity.Text = address.City;
                            txtState.Text = address.RegionName;
                            txtPostalCode.Text = address.PostalCode;
                            txtPhone.Text = address.Phone;
                            break;
                        }
                        break;
                }
            }
        }
                
        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            Address a = new Address();
            a.Bvin = hfdAddressBvin.Value;
            a.FirstName = txtFirstName.Text;
            a.LastName = txtLastName.Text;
            a.Line1 = txtAddress1.Text;
            a.Line2 = txtAddress2.Text;
            a.City = txtCity.Text;
            a.RegionName = txtState.Text;
            a.PostalCode = txtPostalCode.Text;
            a.Phone = txtPhone.Text;

            if (u.Addresses.Count == 0)
                MTApp.MembershipServices.CheckIfNewAddressAndAddWithUpdate(u, a);
            else
                u.UpdateAddress(a);
            MTApp.MembershipServices.UpdateCustomer(u);

            LoadAddress();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Contacts;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce;
using SwetNation.Web.Code;

namespace SwetNation.Web
{
    public partial class MyProfile : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IsAuthorized();

            if (!Page.IsPostBack)
            {
                LoadProfile();
                LoadAddress();
            }
        }

        private void LoadProfile()
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                txtFirstName.Text = u.FirstName;
                txtLastName.Text = u.LastName;
                txtEmailAddress.Text = u.Email;
                txtDOB.Text = u.DOB;
                ddlGender.SelectedIndex = ddlGender.Items.IndexOf(ddlGender.Items.FindByValue(u.Gender));                
            }
        }

        private void LoadAddress()
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                switch (u.ShippingAddress.IsEmpty())
                {
                    case true:
                        ////////////////////////////////////////////////////////////////////
                        // SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        MerchantTribe.Commerce.Contacts.Address s = new MerchantTribe.Commerce.Contacts.Address();
                        s.Bvin = System.Guid.NewGuid().ToString();
                        hdfShippingAddressBvin.Value = s.Bvin;
                        break;
                    default:
                        ////////////////////////////////////////////////////////////////////
                        // SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        if (u.ShippingAddress != null)
                        {                            
                            hdfShippingAddressBvin.Value = u.ShippingAddress.Bvin;
                            txtShippingFirstName.Text = u.ShippingAddress.FirstName;
                            txtShippingLastName.Text = u.ShippingAddress.LastName;
                            txtShippingAddress1.Text = u.ShippingAddress.Line1;
                            txtShippingAddress2.Text = u.ShippingAddress.Line2;
                            txtShippingCity.Text = u.ShippingAddress.City;
                            MerchantTribe.Web.Geography.RegionSnapShot shippingRegionSnapShot = u.ShippingAddress.RegionData;
                            ddlShippingState.SelectedIndex = ddlShippingState.Items.IndexOf(ddlShippingState.Items.FindByValue(shippingRegionSnapShot.Abbreviation));
                            txtShippingPostalCode.Text = u.ShippingAddress.PostalCode;
                            if (u.ShippingAddress.Phone != "")
                                txtPhone.Text = u.ShippingAddress.Phone;
                        }
                        break;
                }
            }
        }
                
        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            CustomerAccount u = MTApp.MembershipServices.Customers.Find(SessionManager.GetCurrentUserId(MTApp.CurrentStore));
            if (u != null)
            {
                ////////////////////////////////////////////////////////////////////
                // SAVE USER PROFILE
                ////////////////////////////////////////////////////////////////////
                u.FirstName = txtFirstName.Text;
                u.LastName = txtLastName.Text;
                u.DOB = txtDOB.Text;
                u.Gender = ddlGender.SelectedValue;

                ////////////////////////////////////////////////////////////////////
                // SETUP REGION
                ////////////////////////////////////////////////////////////////////
                MerchantTribe.Web.Geography.RegionSnapShot shippingRegionSnapShot = new MerchantTribe.Web.Geography.RegionSnapShot();
                shippingRegionSnapShot.Abbreviation = ddlShippingState.SelectedItem.Value;
                shippingRegionSnapShot.Name = ddlShippingState.SelectedItem.Text;

                ////////////////////////////////////////////////////////////////////
                // SAVE ADDRESSES
                ////////////////////////////////////////////////////////////////////
                Address s = new Address();
                s.Bvin = hdfShippingAddressBvin.Value;
                s.FirstName = txtShippingFirstName.Text;
                s.LastName = txtShippingLastName.Text;
                s.Line1 = txtShippingAddress1.Text;
                s.Line2 = txtShippingAddress2.Text;
                s.City = txtShippingCity.Text;
                s.PostalCode = txtShippingPostalCode.Text;
                s.Phone = txtPhone.Text;
                s.RegionData = shippingRegionSnapShot;

                ////////////////////////////////////////////////////////////////////
                // SAVE ADDRESS TO SHIPPING AND BILLING
                ////////////////////////////////////////////////////////////////////
                u.ShippingAddress = s;

                ////////////////////////////////////////////////////////////////////
                // SAVE USER PROFILE
                ////////////////////////////////////////////////////////////////////
                MTApp.MembershipServices.UpdateCustomer(u);

                ////////////////////////////////////////////////////////////////////
                // RELOAD DATA
                ////////////////////////////////////////////////////////////////////
                LoadProfile();
                LoadAddress();
            }            
        }
    }
}
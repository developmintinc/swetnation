﻿using System;
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
                switch (u.ShippingAddress.IsEmpty() && u.BillingAddress.IsEmpty())
                {
                    case true:
                        ////////////////////////////////////////////////////////////////////
                        // SHIPPING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        MerchantTribe.Commerce.Contacts.Address s = new MerchantTribe.Commerce.Contacts.Address();
                        s.Bvin = System.Guid.NewGuid().ToString();
                        hdfShippingAddressBvin.Value = s.Bvin;

                        ////////////////////////////////////////////////////////////////////
                        // BILLING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        MerchantTribe.Commerce.Contacts.Address b = new MerchantTribe.Commerce.Contacts.Address();
                        b.Bvin = System.Guid.NewGuid().ToString();
                        hdfBillingAddressBvin.Value = b.Bvin;
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
                        ////////////////////////////////////////////////////////////////////
                        // BILLING ADDRESS
                        ////////////////////////////////////////////////////////////////////
                        if (u.BillingAddress != null)
                        {
                            hdfBillingAddressBvin.Value = u.BillingAddress.Bvin;
                            txtBillingFirstName.Text = u.BillingAddress.FirstName;
                            txtBillingLastName.Text = u.BillingAddress.LastName;
                            txtBillingAddress1.Text = u.BillingAddress.Line1;
                            txtBillingAddress2.Text = u.BillingAddress.Line2;
                            txtBillingCity.Text = u.BillingAddress.City;
                            MerchantTribe.Web.Geography.RegionSnapShot billingRegionSnapShot = u.BillingAddress.RegionData;
                            ddlBillingState.SelectedIndex = ddlBillingState.Items.IndexOf(ddlBillingState.Items.FindByValue(billingRegionSnapShot.Abbreviation));
                            txtBillingPostalCode.Text = u.BillingAddress.PostalCode;
                            if (txtPhone.Text == "" && u.BillingAddress.Phone != "")
                                txtPhone.Text = u.BillingAddress.Phone;
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

                MerchantTribe.Web.Geography.RegionSnapShot billingRegionSnapShot = new MerchantTribe.Web.Geography.RegionSnapShot();
                billingRegionSnapShot.Abbreviation = ddlBillingState.SelectedItem.Value;
                billingRegionSnapShot.Name = ddlBillingState.SelectedItem.Text;
                
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

                Address b = new Address();
                b.Bvin = hdfBillingAddressBvin.Value;
                b.FirstName = txtBillingFirstName.Text;
                b.LastName = txtBillingLastName.Text;
                b.Line1 = txtBillingAddress1.Text;
                b.Line2 = txtBillingAddress2.Text;
                b.City = txtBillingCity.Text;
                b.PostalCode = txtBillingPostalCode.Text;
                b.Phone = txtPhone.Text;
                b.RegionData = billingRegionSnapShot;

                ////////////////////////////////////////////////////////////////////
                // SAVE ADDRESS TO SHIPPING AND BILLING
                ////////////////////////////////////////////////////////////////////
                u.ShippingAddress = s;
                u.BillingAddress = b;

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

        protected void chkShippingSame_CheckedChanged(Object sender, EventArgs args)
        {
            CheckBox linkedItem = sender as CheckBox;
            if (linkedItem.Checked)
            {
                txtShippingFirstName.Text = txtBillingFirstName.Text;
                txtShippingLastName.Text = txtBillingLastName.Text;
                txtShippingAddress1.Text = txtBillingAddress1.Text;
                txtShippingAddress2.Text = txtBillingAddress2.Text;
                txtShippingCity.Text = txtBillingCity.Text;
                ddlShippingState.SelectedIndex = ddlBillingState.Items.IndexOf(ddlBillingState.Items.FindByText(ddlBillingState.SelectedItem.Text));
                txtShippingPostalCode.Text = txtBillingPostalCode.Text;
            }
            else
            {
                txtShippingFirstName.Text = "";
                txtShippingLastName.Text = "";
                txtShippingAddress1.Text = "";
                txtShippingAddress2.Text = "";
                txtShippingCity.Text = "";
                ddlShippingState.SelectedIndex = 0;
                txtShippingPostalCode.Text = "";
            }
        }
    }
}
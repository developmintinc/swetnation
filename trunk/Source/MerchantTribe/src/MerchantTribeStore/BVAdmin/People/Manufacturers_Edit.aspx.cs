using MerchantTribe.Commerce;
using System.Collections.Generic;
using MerchantTribe.Commerce.Contacts;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Collections.ObjectModel;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Web.Logging;

namespace MerchantTribeStore
{
    partial class BVAdmin_People_Manufacturers_Edit : BaseAdminPage
    {
        protected override void OnLoad(System.EventArgs e)
        {
            base.OnLoad(e);
            SetEditorMode();

            if (!Page.IsPostBack)
            {
                this.DisplayNameField.Focus();

                if (Request.QueryString["id"] != null)
                {
                    this.BvinField.Value = Request.QueryString["id"];
                    InitializeForm();

                    if (this.BvinField.Value == "0")
                    {
                        this.BvinField.Value = string.Empty;
                        LoadGroups(new VendorManufacturer());
                        EmailTemplateDropDownList.SelectedValue = WebAppSettings.DefaultDropShipEmailTemplateId;
                    }
                    else
                    {
                        LoadManufacturer();
                    }
                }
            }
            this.UserPicker1.MessageBox = this.MessageBox1;
            this.UserPicker1.UserSelected += this.UserSelected;
        }

        private void InitializeForm()
        {
            EmailTemplateDropDownList.DataSource = MTApp.ContentServices.GetAllTemplatesForStoreOrDefaults();
            EmailTemplateDropDownList.DataTextField = "DisplayName";
            EmailTemplateDropDownList.DataValueField = "Id";
            EmailTemplateDropDownList.DataBind();
        }

        private void SetEditorMode()
        {
            AddressEditor1.RequireAddress = false;
            AddressEditor1.RequireCity = false;
            AddressEditor1.RequireCompany = false;
            AddressEditor1.RequireFirstName = false;
            AddressEditor1.RequireLastName = false;
            AddressEditor1.RequirePhone = false;
            AddressEditor1.RequirePostalCode = false;
            AddressEditor1.RequireRegion = false;
            AddressEditor1.ShowCompanyName = true;
            AddressEditor1.ShowPhoneNumber = true;
            AddressEditor1.ShowCounty = true;
        }

        private void LoadManufacturer()
        {
            VendorManufacturer m = MTApp.ContactServices.Manufacturers.Find(this.BvinField.Value);
            if (m != null)
            {
                if (m.Bvin != string.Empty)
                {
                    this.DisplayNameField.Text = m.DisplayName;
                    this.EmailField.Text = m.EmailAddress;
                    this.AddressEditor1.LoadFromAddress(m.Address);
                    this.EmailTemplateDropDownList.SelectedValue = m.DropShipEmailTemplateId;
                    this.DescriptionField.Text = m.Description;
                    this.SaleStartsField.Text = m.SaleStarts.HasValue ? m.SaleStarts.Value.ToShortDateString() : string.Empty;
                    this.SaleEndsField.Text = m.SaleEnds.HasValue ? m.SaleEnds.Value.ToShortDateString() : string.Empty;
                    this.SortOrderField.Text = m.SortOrder.ToString();
                    LoadImagePreview(m);
                }
            }

            LoadGroups(m);
        }

        private void LoadImagePreview(VendorManufacturer vm)
        {
            string imageUrl = MerchantTribe.Commerce.Storage.DiskStorage.ManufacturerImageUrlSmall(MTApp.CurrentStore.Id, vm.Bvin, vm.ImageFileSmall, true);
            this.imgPreviewSmall.ImageUrl = imageUrl;
        }

        protected override void OnPreInit(System.EventArgs e)
        {
            base.OnPreInit(e);
            this.PageTitle = "Edit Manufacturer";
            this.CurrentTab = AdminTabType.People;
            ValidateCurrentUserHasPermission(MerchantTribe.Commerce.Membership.SystemPermissions.PeopleView);
        }

        protected void btnCancel_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Response.Redirect("Manufacturers.aspx");
        }

        protected void btnSaveChanges_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            this.lblError.Text = string.Empty;

            if (Save() == true)
            {
                Response.Redirect("Manufacturers.aspx");
            }
        }

        private bool Save()
        {
            bool result = false;

            VendorManufacturer m = MTApp.ContactServices.Manufacturers.Find(this.BvinField.Value);
            if (m == null) m = new VendorManufacturer();            
            m.DisplayName = this.DisplayNameField.Text.Trim();
            m.EmailAddress = this.EmailField.Text.Trim();
            m.Address = this.AddressEditor1.GetAsAddress();
            m.DropShipEmailTemplateId = this.EmailTemplateDropDownList.SelectedValue;
            string fileName = UploadImage(m);
            if (fileName != "")
            {
                m.ImageFileSmall = fileName;
                m.ImageFileMedium = fileName;
            }                
            m.Description = this.DescriptionField.Text.Trim();
            if (this.SaleStartsField.Text != "")
                m.SaleStarts = Convert.ToDateTime(this.SaleStartsField.Text);
            if (this.SaleEndsField.Text != "")
                m.SaleEnds = Convert.ToDateTime(this.SaleEndsField.Text);
            if (this.SortOrderField.Text != "")
                m.SortOrder = Convert.ToInt32(this.SortOrderField.Text);
            if (this.BvinField.Value == string.Empty)
                result = MTApp.ContactServices.Manufacturers.Create(m);
            else
                result = MTApp.ContactServices.Manufacturers.Update(m);

            if (result == false)
                this.lblError.Text = "Unable to save manufacturer. Uknown error.";
            else
                // Update bvin field so that next save will call updated instead of create
                this.BvinField.Value = m.Bvin;
            
            return result;
        }

        protected void RemoveButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            VendorManufacturer m = MTApp.ContactServices.Manufacturers.Find(this.BvinField.Value);
            if (m != null)
            {
                foreach (System.Web.UI.WebControls.ListItem li in MemberList.Items)
                {
                    if (li.Selected == true)
                    {
                        m.RemoveContact(li.Value);
                    }
                }
            }
            MTApp.ContactServices.Manufacturers.Update(m);
            LoadGroups(m);
        }

        private void LoadGroups(VendorManufacturer m)
        {
            MemberList.DataSource = m.Contacts;
            MemberList.DataValueField = "bvin";
            MemberList.DataTextField = "Username";
            MemberList.DataBind();
        }

        protected void UserSelected(MerchantTribe.Commerce.Controls.UserSelectedEventArgs args)
        {
            if (this.BvinField.Value == string.Empty)
            {
                Save();
            }
            VendorManufacturer m = MTApp.ContactServices.Manufacturers.Find(this.BvinField.Value);
            if (m != null)
            {
                m.AddContact(args.UserAccount.Bvin);
                MTApp.ContactServices.Manufacturers.Update(m);
            }
            LoadGroups(m);
        }

        private string UploadImage(VendorManufacturer m)
        {
            string fileNameResult = "";
            if (imgupload.HasFile)
            {
                if (imgupload.PostedFile.ContentType == "image/jpeg" || imgupload.PostedFile.ContentType == "image/png" || imgupload.PostedFile.ContentType == "image/gif")
                {
                    string fileName = Path.GetFileNameWithoutExtension(imgupload.FileName);
                    string ext = Path.GetExtension(imgupload.FileName);

                    if (m != null)
                    {
                        // Construct filename
                        string filename = Path.GetFileName(imgupload.FileName);
                        filename = Server.MapPath("~/Images/sites/1/manufacturers/" + m.Bvin + "/") + filename;

                        // Delete the old one if it exists
                        if (File.Exists(filename))
                        {
                            File.SetAttributes(filename, FileAttributes.Normal);
                            File.Delete(filename);
                        }

                        if (imgupload != null)
                        {
                            if (Directory.Exists(Path.GetDirectoryName(filename)) == false)
                                Directory.CreateDirectory(Path.GetDirectoryName(filename));
                            imgupload.SaveAs(filename);
                        }

                        // Starting the process of saving the small image
                        string pathOfOriginal = Path.GetDirectoryName(filename);
                        string pathOfOutputSmall = Path.Combine(pathOfOriginal, "small");
                        if (!Directory.Exists(pathOfOutputSmall))
                        {
                            Directory.CreateDirectory(pathOfOutputSmall);
                        }

                        string pathOfOutputMedium = Path.Combine(pathOfOriginal, "medium");
                        if (!Directory.Exists(pathOfOutputMedium))
                        {
                            Directory.CreateDirectory(pathOfOutputMedium);
                        }

                        ShrinkImageFileOnUpload(filename, "medium", 440, 440, imgupload);
                        ShrinkImageFileOnUpload(filename, "small", 240, 240, imgupload);

                        fileNameResult = fileName + ext;
                        m.ImageFileSmall = fileName + ext;
                        m.ImageFileMedium = fileName + ext;

                        if (this.BvinField.Value != string.Empty)
                        {
                            bool result = MTApp.ContactServices.Manufacturers.Update(m);
                        }

                        //StatusLabel.Text = File.Exists(filename) ? "Upload status: File uploaded!" : "Upload status: File not uploaded!";
                        //this.MessageBox1.ShowError("Only .PNG, .JPG, .GIF file types are allowed for icon images");
                    }
                }
                else
                    this.MessageBox1.ShowError("Only .PNG, .JPG, .GIF file types are allowed for icon images");                
            }

            return fileNameResult;
        }

        public void ShrinkImageFileOnUpload(string originalFile, string outputDirectory, int maxWidth, int maxHeight, FileUpload file)
        {
            string pathOfOriginal = Path.GetDirectoryName(originalFile);
            string pathOfOutput = Path.Combine(pathOfOriginal, outputDirectory);

            if (!Directory.Exists(pathOfOutput))
                Directory.CreateDirectory(pathOfOutput);

            string outputFile = Path.Combine(pathOfOutput, Path.GetFileName(originalFile));
            outputFile = outputFile.Replace("/", @"\");

            // Create a bitmap of the content of the fileUpload control in memory
            Bitmap originalBMP = new Bitmap(file.FileContent);

            // Calculate the new image dimensions
            int origWidth = originalBMP.Width;
            int origHeight = originalBMP.Height;
            int sngRatio = origWidth / origHeight;
            int newWidth = maxWidth;
            int newHeight = newWidth / (sngRatio == 0 ? 1 : sngRatio);

            // Create a new bitmap which will hold the previous resized bitmap
            Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);

            // Create a graphic based on the new bitmap
            Graphics oGraphics = Graphics.FromImage(newBMP);

            // Set the properties for the new graphic file
            oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

            // Draw the new graphic based on the resized bitmap
            oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

            // Save the new graphic file to the server
            newBMP.Save(outputFile);

            // Once finished with the bitmap objects, we deallocate them.
            originalBMP.Dispose();
            newBMP.Dispose();
            oGraphics.Dispose();
        }

    }
}
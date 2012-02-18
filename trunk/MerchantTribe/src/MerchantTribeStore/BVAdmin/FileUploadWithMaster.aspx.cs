using System;
using System.IO;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Accounts;
using MerchantTribe.Commerce.Catalog;

namespace MerchantTribeStore.BVAdmin
{
    public partial class FileUploadWithMaster : BaseAdminPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (WebAppSettings.IsIndividualMode)
            {
                // Simple pci check for default admin username
                if (MTApp.CurrentRequestContext.CurrentAdministrator(MTApp).Email == "admin@merchanttribe.com") Response.Redirect("ChangeEmail.aspx?pci=1");
            }
        }

        protected override void OnPreInit(System.EventArgs e)
        {
            base.OnPreInit(e);
            this.PageTitle = "Dashboard";
            this.CurrentTab = AdminTabType.Dashboard;
        }
        
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.UploadImage();
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Message = " + ex.Message + "<br />Inner Message = " + ex.InnerException;
            }
            

            /*
            if (FileUploadControl.HasFile)
            {
                try
                {
                    if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png" || FileUploadControl.PostedFile.ContentType == "image/gif")
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 102400)
                        {
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            filename = Server.MapPath("~/Images/sites/1/products/c700d9d0-12a2-4f6d-841a-c355f7887a8e/medium/") + filename;
                            FileUploadControl.SaveAs(filename);
                            if (File.Exists(filename))
                            {
                                StatusLabel.Text = "Upload status: File uploaded!";
                            }
                            else
                            {
                                StatusLabel.Text = "Upload status: File not uploaded!";
                            }
                        }
                        else
                            StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                    }
                    else
                        StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
            */
        }

        protected void UploadImage()
        {
            // Image Upload
            if ((this.FileUploadControl.HasFile))
            {
                // Apparently, .FileName returns the full path (in IE)
                // where .FileName returns just the file name which is what we want.
                string fileName = Path.GetFileNameWithoutExtension(FileUploadControl.FileName);
                string ext = Path.GetExtension(FileUploadControl .FileName);

                if (MerchantTribe.Commerce.Storage.DiskStorage.ValidateImageType(ext))
                {
                    Product p;
                    p = MTApp.CatalogServices.Products.Find("49a3651e-a9fd-4e15-8dc9-a4501ee1ed95");
                    if (p != null)
                    {
                        fileName = MerchantTribe.Web.Text.CleanFileName(fileName);
                        if ((MerchantTribe.Commerce.Storage.DiskStorage.UploadProductImage(MTApp.CurrentStore.Id, p.Bvin, this.FileUploadControl)))
                        {
                            p.ImageFileSmall = fileName + ext;
                            p.ImageFileMedium = fileName + ext;
                            StatusLabel.Text = "Uploaded Large, Medium and Small photos named " + p.ImageFileSmall;
                        }
                    }
                }
                else
                {
                    StatusLabel.Text = "Only .PNG, .JPG, .GIF file types are allowed for icon images";
                }
            }
        }
    }
}
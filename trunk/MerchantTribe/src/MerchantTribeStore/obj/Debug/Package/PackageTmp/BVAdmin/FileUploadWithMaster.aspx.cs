using System;
using System.IO;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Accounts;

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
        }
    }
}
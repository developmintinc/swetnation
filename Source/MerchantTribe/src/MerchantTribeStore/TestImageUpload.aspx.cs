using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Web;
using MerchantTribe.Web.Logging;

namespace MerchantTribeStore
{
    public partial class TestImageUpload : BaseProductAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EventLog.LogEvent("TestImageUpload.cs / Page_Load()", "!Page.IsPostBack", EventLogSeverity.Debug);
            }
        }

        protected override bool Save()
        {
            return true;
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

        private bool WriteFileToPath(string saveLocation, FileUpload file)
        {
            bool result = true;

            try
            {
                if (file != null)
                {
                    if (Directory.Exists(Path.GetDirectoryName(saveLocation)) == false)
                        Directory.CreateDirectory(Path.GetDirectoryName(saveLocation));
                    file.SaveAs(saveLocation);
                }
            }
            catch (Exception ex)
            {
                EventLog.LogEvent(ex);
                result = false;
            }

            return result;
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            bool tryThisInstead = false;

            // Image Upload
            if (tryThisInstead && this.FileUploadControl.HasFile)
            {
                EventLog.LogEvent("TestImageUpload.cs / tryThisInstead = true", "tryThisInstead = true", EventLogSeverity.Debug);

                Product p;
                p = MTApp.CatalogServices.Products.Find("7c57ac98-b639-4bf4-8ba5-a63d0bfbcfc3");

                // Apparently, .FileName returns the full path (in IE)
                // where .FileName returns just the file name which is what we want.
                string fileName = Path.GetFileNameWithoutExtension(FileUploadControl.FileName);
                string ext = Path.GetExtension(FileUploadControl.FileName);

                if (MerchantTribe.Commerce.Storage.DiskStorage.ValidateImageType(ext))
                {
                    fileName = MerchantTribe.Web.Text.CleanFileName(fileName);
                    if ((MerchantTribe.Commerce.Storage.DiskStorage.UploadProductImage(MTApp.CurrentStore.Id, p.Bvin, this.FileUploadControl)))
                    {
                        p.ImageFileSmall = fileName + ext;
                        EventLog.LogEvent("Products_Edit.cs / UploadImage()", "p.ImageFileSmall = " + p.ImageFileSmall, EventLogSeverity.Debug);
                    }
                }
                else
                {
                    this.MessageBox1.ShowError("Only .PNG, .JPG, .GIF file types are allowed for icon images");
                }
            }
            else if (FileUploadControl.HasFile)
            {
                try
                {
                    EventLog.LogEvent("TestImageUpload", "##############################################", EventLogSeverity.Debug);
                    EventLog.LogEvent("TestImageUpload", "STARTING IMAGE UPLOAD PROCESS", EventLogSeverity.Debug);
                    EventLog.LogEvent("TestImageUpload", "##############################################", EventLogSeverity.Debug);
                    EventLog.LogEvent("TestImageUpload", "ContentType = " + FileUploadControl.PostedFile.ContentType, EventLogSeverity.Debug);

                    if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png" || FileUploadControl.PostedFile.ContentType == "image/gif")
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 102400)
                        {
                            EventLog.LogEvent("TestImageUpload", "ContentLength = " + FileUploadControl.PostedFile.ContentLength, EventLogSeverity.Debug);

                            // Construct filename
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            EventLog.LogEvent("TestImageUpload", "filename = " + filename, EventLogSeverity.Debug);
                            filename = Server.MapPath("~/Images/sites/1/products/12345678-b639-4bf4-8ba5-a63d0bfbcfc3/") + filename;
                            EventLog.LogEvent("TestImageUpload", "filename with mappath = " + filename, EventLogSeverity.Debug);

                            // Delete the old one if it exists
                            if (File.Exists(filename))
                            {
                                EventLog.LogEvent("TestImageUpload", "deleting existing file", EventLogSeverity.Debug);
                                File.SetAttributes(filename, FileAttributes.Normal);
                                File.Delete(filename);
                            }

                            if (FileUploadControl != null)
                            {
                                if (Directory.Exists(Path.GetDirectoryName(filename)) == false)
                                    Directory.CreateDirectory(Path.GetDirectoryName(filename));
                                FileUploadControl.SaveAs(filename);
                            }

                            // Save uploaded file
                            /*
                            EventLog.LogEvent("TestImageUpload", "Saving file", EventLogSeverity.Debug);
                            FileUploadControl.SaveAs(filename);
                            */

                            // Starting the process of saving the small image
                            string pathOfOriginal = Path.GetDirectoryName(filename);
                            string pathOfOutput = Path.Combine(pathOfOriginal, "small");
                            if (!Directory.Exists(pathOfOutput))
                            {
                                EventLog.LogEvent("TestImageUpload", "Directory doesn't exists", EventLogSeverity.Debug);
                                Directory.CreateDirectory(pathOfOutput);
                            }

                            string outputFile = Path.Combine(pathOfOutput, Path.GetFileName(filename));
                            EventLog.LogEvent("TestImageUpload", "Combined file and path = " + outputFile, EventLogSeverity.Debug);
                            outputFile = outputFile.Replace("/", @"\");
                            EventLog.LogEvent("TestImageUpload", "Replacing forward slash with back slash = " + outputFile, EventLogSeverity.Debug);

                            EventLog.LogEvent("TestImageUpload", "Entering Shrink medium image method", EventLogSeverity.Debug);
                            ShrinkImageFileOnUpload(filename, "medium", 440, 440, FileUploadControl);

                            EventLog.LogEvent("TestImageUpload", "Entering Shrink small image method", EventLogSeverity.Debug);
                            ShrinkImageFileOnUpload(filename, "small", 240, 240, FileUploadControl);

                            StatusLabel.Text = File.Exists(filename) ? "Upload status: File uploaded!" : "Upload status: File not uploaded!";
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
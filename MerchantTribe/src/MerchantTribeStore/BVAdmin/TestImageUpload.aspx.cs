using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Web.Logging;

namespace MerchantTribeStore.BVAdmin
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

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png" || FileUploadControl.PostedFile.ContentType == "image/gif")
                    {
                        if (FileUploadControl.PostedFile.ContentLength < 1024000)
                        {
                            string fileName = Path.GetFileNameWithoutExtension(FileUploadControl.FileName);
                            string ext = Path.GetExtension(FileUploadControl.FileName);

                            Product p;
                            p = MTApp.CatalogServices.Products.Find("49a3651e-a9fd-4e15-8dc9-a4501ee1ed95");

                            if (p != null)
                            {
                                // Construct filename
                                string filename = Path.GetFileName(FileUploadControl.FileName);
                                filename = Server.MapPath("~/Images/sites/1/products/" + p.Bvin + "/") + filename;

                                // Delete the old one if it exists
                                if (File.Exists(filename))
                                {
                                    File.SetAttributes(filename, FileAttributes.Normal);
                                    File.Delete(filename);
                                }

                                if (FileUploadControl != null)
                                {
                                    if (Directory.Exists(Path.GetDirectoryName(filename)) == false)
                                        Directory.CreateDirectory(Path.GetDirectoryName(filename));
                                    FileUploadControl.SaveAs(filename);
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

                                //string outputFile = Path.Combine(pathOfOutputSmall, Path.GetFileName(filename));

                                ShrinkImageFileOnUpload(filename, "medium", 440, 440, FileUploadControl);
                                ShrinkImageFileOnUpload(filename, "small", 240, 240, FileUploadControl);

                                p.ImageFileSmall = fileName + ext;
                                p.ImageFileMedium = fileName + ext;

                                StatusLabel.Text = File.Exists(filename) ? "Upload status: File uploaded!" : "Upload status: File not uploaded!";
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
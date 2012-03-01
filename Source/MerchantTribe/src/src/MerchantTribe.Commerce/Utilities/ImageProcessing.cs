using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using MerchantTribe.Web;
using MerchantTribe.Web.Logging;

namespace MerchantTribe.Commerce.Utilities
{
    public class ImageProcessing
    {
        private const int TINYWIDTH = 50;
        private const int TINYHEIGHT = 50;
        private const int SMALLWIDTH = 220;
        private const int SMALLHEIGHT = 220;
        private const int MEDIUMWIDTH = 440;
        private const int MEDIUMHEIGHT = 440;
        private const int LOGOWIDTH = 310;
        private const int LOGOHEIGHT = 110;
        private const int BANNERWIDTH = 700;
        private const int BANNERHEIGHT = 400;
        private const int THEMEPREVIEWHEIGHT = 120;
        private const int THEMEPREVIEWWIDTH = 160;
        private const int THEMEPREVIEWBIGHEIGHT = 480;
        private const int THEMEPREVIEWBIGWIDTH = 640;

        private static bool ShrinkImage(string originalFile, string outputDirectory, int maxWidth, int maxHeight)
        {
            bool result = true;

            try
            {
                string pathOfOriginal = Path.GetDirectoryName(originalFile);
                string pathOfOutput = Path.Combine(pathOfOriginal, outputDirectory);
                if (!Directory.Exists(pathOfOutput))
                    Directory.CreateDirectory(pathOfOutput);
                string outputFile = Path.Combine(pathOfOutput, Path.GetFileName(originalFile));
                outputFile = outputFile.Replace("/", @"\");
                Images.ShrinkImageFileOnDisk(originalFile, outputFile, maxWidth, maxHeight);
            }
            catch (Exception ex)
            {
                result = false;
                EventLog.LogEvent(ex);
            }

            return result;
        }

        public static bool ShrinkImageFileOnUpload(string originalFile, string outputDirectory, int maxWidth, int maxHeight, FileUpload file)
        {
            bool result = true;

            try
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
                int newHeight = newWidth;
                if (sngRatio != 0)
                {
                    newHeight = newWidth / sngRatio;
                }

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
            catch (Exception ex)
            {
                result = false;
                EventLog.LogEvent(ex);
            }

            return result;
        }

        public void ResizeImage(string originalFile, string newFile, int newWidth, int maxHeight, bool onlyResizeIfWider)
        {
            System.Drawing.Image fullsizeImage = System.Drawing.Image.FromFile(originalFile);

            // Prevent using images internal thumbnail
            fullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);
            fullsizeImage.RotateFlip(System.Drawing.RotateFlipType.Rotate180FlipNone);

            if (onlyResizeIfWider)
            {
                if (fullsizeImage.Width <= newWidth)
                {
                    newWidth = fullsizeImage.Width;
                }
            }

            int newHeight = fullsizeImage.Height * newWidth / fullsizeImage.Width;
            if (newHeight > maxHeight)
            {
                // Resize with height instead
                newWidth = fullsizeImage.Width * maxHeight / fullsizeImage.Height;
                newHeight = maxHeight;
            }

            System.Drawing.Image newImage = fullsizeImage.GetThumbnailImage(newWidth, newHeight, null, IntPtr.Zero);

            // Clear handle to original file so that we can overwrite it if necessary
            fullsizeImage.Dispose();

            // Save resized picture
            newImage.Save(newFile);
        }

        public static bool ShrinkToSmallOnUpload(string originalFile, FileUpload file)
        {
            return ShrinkImageFileOnUpload(originalFile, "small", SMALLWIDTH, SMALLHEIGHT, file);
        }

        public static bool ShrinkToMediumOnUpload(string originalFile, FileUpload file)
        {
            return ShrinkImageFileOnUpload(originalFile, "medium", MEDIUMWIDTH, MEDIUMHEIGHT, file);
        }

        public static bool ShrinkToTiny(string originalFile)
        {
            return ShrinkImage(originalFile, "tiny", TINYWIDTH, TINYHEIGHT);
        }
        public static bool ShrinkToSmall(string originalFile)
        {
            return ShrinkImage(originalFile, "small", SMALLWIDTH, SMALLHEIGHT);
        }
        public static bool ShrinkToMedium(string originalFile)
        {
            return ShrinkImage(originalFile, "medium", MEDIUMWIDTH, MEDIUMHEIGHT);            
        }
        public static bool ShrinkToLogo(string originalFile)
        {
            return ShrinkImage(originalFile, "logo", LOGOWIDTH, LOGOHEIGHT);            
        }
        public static bool ShrinkToBanner(string originalFile)
        {
            return ShrinkImage(originalFile, "banner", BANNERWIDTH, BANNERHEIGHT);            
        }

        public static bool ShrinkToThemePreview(string originalFile)
        {
            return ShrinkImage(originalFile, "", THEMEPREVIEWWIDTH, THEMEPREVIEWHEIGHT);
        }
        public static bool ShrinkToThemePreviewBig(string originalFile)
        {
            return ShrinkImage(originalFile, "", THEMEPREVIEWBIGWIDTH, THEMEPREVIEWBIGHEIGHT);
        }
    }
}

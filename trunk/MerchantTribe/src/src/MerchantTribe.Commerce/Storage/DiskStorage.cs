﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Accounts;
using MerchantTribe.Web.Logging;

namespace MerchantTribe.Commerce.Storage
{
    public class DiskStorage
    {

        internal static string BaseUrl()
        {
            return BaseUrl(false);
        }
        internal static string BaseUrl(bool isSecure)
        {
            string u = WebAppSettings.ApplicationBaseImageUrl;
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            return u;
        }
        protected static string BaseImageUrl()
        {
            string u = WebAppSettings.ApplicationBaseImageUrl;
            return u;
        }
        internal static string BaseStoreUrl(long storeId)
        {
            return BaseStoreUrl(storeId, false);
        }
        internal static string BaseStoreUrl(long storeId, bool isSecure)
        {
            return BaseUrl(isSecure) + storeId.ToString() + "/";
        }
        internal static string BaseStorePhysicalPath(long storeId)
        {
            return WebAppSettings.ApplicationBaseImagePhysicalPath + storeId.ToString() + "\\";
        }
        internal static string BaseStoreThemeUrl(long storeId, string themeId)
        {
            return BaseStoreThemeUrl(storeId, themeId, false);
        }
        internal static string BaseStoreThemeUrl(long storeId, string themeId, bool isSecure)
        {
            return BaseStoreUrl(storeId, isSecure) + "themes/theme-" + themeId + "/";
        }
        internal static string BaseStoreThemePhysicalPath(long storeId, string themeId)
        {
            return BaseStorePhysicalPath(storeId) + "themes\\theme-" + themeId + "\\";
        }
        protected static string BuiltinThemesPath()
        {
            string u = WebAppSettings.ApplicationBuiltinThemesPath;
            return u;
        }
        protected static string BuiltInDemoImagesPath()
        {
            string p = BuiltinThemesPath();
            p = p.Replace("\\themes", "\\demoimages");
            return p;
        }

        public static bool ValidateImageType(string extension)
        {
            bool result = false;

            switch (extension.ToUpperInvariant())
            {
                case ".PNG":
                    result = true;
                    break;
                case ".JPG":
                    result = true;
                    break;
                case ".GIF":
                    result = true;
                    break;
            }

            return result;
        }
        public static bool ValidateStoreAssetType(string extension)
        {
            bool result = false;

            switch (extension.ToUpperInvariant())
            {
                case ".PNG":
                    result = true;
                    break;
                case ".JPG":
                    result = true;
                    break;
                case ".GIF":
                    result = true;
                    break;
                case ".PDF":
                    result = true;
                    break;
                case ".DOC":
                    result = true;
                    break;
                case ".DOCX":
                    result = true;
                    break;
                case ".TXT":
                    result = true;
                    break;
            }

            return result;
        }

        public static bool CopyDemoProductImage(long storeId, string productId, string imageName)
        {
            try
            {
                string saveLocation = WebAppSettings.BaseImagePhysicalPath;
                saveLocation += storeId.ToString() + "/products/" + productId + "/";
                
                FileHelper.CopySingle(Path.Combine(BuiltInDemoImagesPath(), "small"),
                                        Path.Combine(saveLocation, "small"), imageName, true);
                FileHelper.CopySingle(Path.Combine(BuiltInDemoImagesPath(), "medium"),
                                        Path.Combine(saveLocation, "medium"), imageName, true);
            }
            catch (Exception ex)
            {
                EventLog.LogEvent(ex);
                return false;
            }
            return true;
        }
        public static string ReadDemoProductXml()
        {
            string result = string.Empty;
            string source = Path.Combine(BuiltInDemoImagesPath(), "SampleProducts.xml");
            if (File.Exists(source))
            {
                result = File.ReadAllText(source);
            }
            return result;
        }
        public static bool UploadProductImage(long storeId, string productId, FileUpload file)
        {
            bool result = true;
            if (!ValidateImageType(Path.GetExtension(file.FileName)))
            {
                return false;
            }

            //string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            string saveLocation = "/images/sites/";
            saveLocation += storeId.ToString(CultureInfo.InvariantCulture) + "/products/" + productId + "/";
            saveLocation += Path.GetFileName(Web.Text.CleanFileName(file.FileName));
            saveLocation = HttpContext.Current.Server.MapPath(saveLocation);

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }

            result = WriteFileToPath(saveLocation, file);
            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToSmallOnUpload(saveLocation, file);
                if (result)
                    result = Utilities.ImageProcessing.ShrinkToMediumOnUpload(saveLocation, file);
            }

            return result;
        }
        public static bool UploadProductImage(long storeId, string productId, string fileName, byte[] data)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(fileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/products/" + productId + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteBytesToPath(saveLocation, data);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);
                if (result)
                {
                    result = Utilities.ImageProcessing.ShrinkToMedium(saveLocation);
                }
            }
            return result;
        }
        public static bool UploadProductVariantImage(long storeId, string productId, string variantId, FileUpload file)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/products/" + productId + "/variants/" + variantId ;

            // Clear out old images before posting new one
            if (Directory.Exists(saveLocation))
            {
                FileHelper.DeleteDirectoryAndFilesRecursive(saveLocation);
            }
    
            saveLocation += "/" + variantId;
            saveLocation += System.IO.Path.GetExtension(file.FileName);           
            result = WriteFileToPath(saveLocation, file);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);
                if (result)
                {
                    result = Utilities.ImageProcessing.ShrinkToMedium(saveLocation);
                }
            }
            return result;
        }

        public static string ProductImageUrlOriginal(long storeId, string productId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }
        public static string ProductImageUrlMedium(long storeId, string productId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/medium/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }

        public static string ProductImageUrlSmall(long storeId, string productId, string productImage, bool isSecure)
        {
            //EventLog.LogEvent("Products_Edit.cs", "ProductImageUrlSmall : Enter", EventLogSeverity.Debug);
            // return outside image references without rewriting
            if (productImage.StartsWith("http"))
            {
                return productImage;
            }

            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }

            u += storeId.ToString() + "/products/" + productId + "/small/";
            u += productImage;

            /////////////////////////////////////////////////////////////////////////////
            // TECHNICAL DEBT - THIS SHOULD BE CHECKED ON THE PRODUCTION SERVER
            /////////////////////////////////////////////////////////////////////////////
            if (WebAppSettings.IsDebugMode)
                u = u.Replace("/shop", "");

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }

            return u;
        }

        public static string ManufacturerImageUrlSmall(long storeId, string manufacturerId, string manufacturerImage, bool isSecure)
        {
            // return outside image references without rewriting
            if (manufacturerImage.StartsWith("http"))
            {
                return manufacturerImage;
            }

            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }

            u += storeId.ToString() + "/manufacturers/" + manufacturerId + "/small/";
            u += manufacturerImage;

            /////////////////////////////////////////////////////////////////////////////
            // TECHNICAL DEBT - THIS SHOULD BE CHECKED ON THE PRODUCTION SERVER
            /////////////////////////////////////////////////////////////////////////////
            if (WebAppSettings.IsDebugMode)
                u = u.Replace("/shop", "");

            if (manufacturerImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }

            return u;
        }

        //Flex Page Image Upload
        public static string FlexPageImageUrl(long storeId, string categoryId, string pageVersion, string fileName, bool isSecure)
        {
            string missing = "/Content/admin/images/MissingImage.png";

            if (fileName == string.Empty) return missing;

            string physicalLocation = WebAppSettings.BaseImagePhysicalPath;
            physicalLocation += storeId.ToString() + "/pages/" + categoryId + "/" + pageVersion + "/";
            physicalLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            if (!File.Exists(physicalLocation)) return missing;

            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/pages/" + categoryId + "/" + pageVersion + "/";
            u += MerchantTribe.Web.Text.CleanFileName(fileName);
            return u;
        }
        public static bool UploadFlexPageImagePartial(long storeId, Stream inputStream, string fileName, bool isFirstPart, string categoryId, string pageVersion)
        {
            bool result = false;

            if (!ValidateImageType(System.IO.Path.GetExtension(fileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/pages/" + categoryId + "/" + pageVersion + "/";
            if (!Directory.Exists(saveLocation))
            {
                Directory.CreateDirectory(saveLocation);
            }
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            if (isFirstPart)
            {
                // Delete the old one if it exists and this is the first part upload
                if (File.Exists(saveLocation))
                {
                    File.SetAttributes(saveLocation, FileAttributes.Normal);
                    File.Delete(saveLocation);
                }
                
                // Create New
                FileStream fs = File.Create(saveLocation);
                inputStream.CopyTo(fs);
                fs.Flush();
                fs.Close();
            }
            else
            {
                // Append to existing
                FileStream writeStream = File.Open(saveLocation, FileMode.Append);
                inputStream.CopyTo(writeStream);
                writeStream.Flush();
                writeStream.Close();
            }
            
            result = true;            
            return result;
        }

        // Additional Image Urls
        public static bool UploadAdditionalProductImage(long storeId, string productId, string imageId, FileUpload file)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/products/" + productId + "/additional/" + imageId + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteFileToPath(saveLocation, file);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToTiny(saveLocation);
                if (result)
                {                    
                    result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);
                    if (result)
                    {
                        result = Utilities.ImageProcessing.ShrinkToMedium(saveLocation);
                    }
                }
            }
            return result;
        }
        public static bool UploadProductAdditionalImage(long storeId, string productId, string imageId, string fileName, byte[] data)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(fileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/products/" + productId + "/additional/" + imageId + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteBytesToPath(saveLocation, data);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToTiny(saveLocation);
                if (result)
                {
                    result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);
                    if (result)
                    {
                        result = Utilities.ImageProcessing.ShrinkToMedium(saveLocation);
                    }
                }
            }
            return result;
        }
        
        public static bool DeleteAdditionalProductImage(long storeId, string productId, string imageId)
        {
            bool result = true;

            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString() + "/products/" + productId.ToString() + "/additional/" + imageId;

            if (Directory.Exists(sourceFolder))
            {

                try
                {
                    FileHelper.DeleteDirectoryAndFilesRecursive(sourceFolder);
                    Directory.Delete(sourceFolder);
                }
                catch (Exception ex)
                {
                    result = false;
                    EventLog.LogEvent(ex);
                }
            }

            return result;
        }
        public static string ProductAdditionalImageUrlOriginal(long storeId, string productId, string imageId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/additional/";
            u += imageId + "/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }
        public static string ProductAdditionalImageUrlMedium(long storeId, string productId, string imageId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/additional/";
            u += imageId + "/medium/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }
        public static string ProductAdditionalImageUrlSmall(long storeId, string productId, string imageId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/additional/";
            u += imageId + "/small/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }
        public static string ProductAdditionalImageUrlTiny(long storeId, string productId, string imageId, string productImage, bool isSecure)
        {
            string u = BaseImageUrl().ToString();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/products/" + productId + "/additional/";
            u += imageId + "/tiny/";
            u += productImage;

            if (productImage.Trim().Length < 1)
            {
                u = "/Content/admin/images/MissingImage.png";
            }
            return u;
        }

        public static string ProductVariantImageUrlMedium(long storeId, string productId, string productImage, string variantId, bool isSecure)
        {            
            if (VariantImageExists(storeId, productId, variantId))
            {
                string variantImage = string.Empty;
                string saveLocation = WebAppSettings.BaseImagePhysicalPath;
                saveLocation += storeId.ToString() + "/products/" + productId + "/variants/" + variantId;
                if (Directory.Exists(saveLocation))
                {
                    string[] images = Directory.GetFiles(saveLocation);
                    if (images != null)
                    {
                        if (images.Length > 0)
                        {
                            variantImage = System.IO.Path.GetFileName(images[0]);
                        }
                    }
                }

                string u = BaseImageUrl().ToString();
                if (isSecure)
                {
                    u = u.Replace("http://", "https://");
                }
                u += storeId.ToString() + "/products/" + productId + "/variants/" + variantId + "/medium/" + variantImage;
                return u;
            }
            else
            {
                return ProductImageUrlMedium(storeId, productId, productImage, isSecure);
            }                                    
        }

        private static bool VariantImageExists(long storeId, string productId, string variantId)
        {
            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/products/" + productId + "/variants/" + variantId;
            if (Directory.Exists(saveLocation))
            {
                string[] images = Directory.GetFiles(saveLocation);
                if (images != null)
                {
                    if (images.Length > 0)
                    {
                        return true;
                    }
                }
            }

            return false;
        }

        // Category Banners and Icons
        public static bool UploadCategoryBanner(long storeId, string categoryId, FileUpload file)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }
            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/categorybanners/" + categoryId.ToString() + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteFileToPath(saveLocation, file);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToBanner(saveLocation);
            }

            return result;
        }
        public static bool UploadCategoryBanner(long storeId, string categoryId, string fileName, byte[] data)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(fileName)))
            {
                return false;
            }
            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/categorybanners/" + categoryId.ToString() + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteBytesToPath(saveLocation, data);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToBanner(saveLocation);
            }

            return result;
        }
        public static bool UploadCategoryIcon(long storeId, string categoryId, FileUpload file)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/categoryicons/" + categoryId.ToString() + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteFileToPath(saveLocation, file);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);                
            }

            return result;
        }
        public static bool UploadCategoryIcon(long storeId, string categoryId, string fileName, byte[] data)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(fileName)))
            {
                return false;
            }

            string saveLocation = WebAppSettings.BaseImagePhysicalPath;
            saveLocation += storeId.ToString() + "/categoryicons/" + categoryId.ToString() + "/";
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(fileName));

            // Delete the old one if it exists
            if (File.Exists(saveLocation))
            {
                File.SetAttributes(saveLocation, FileAttributes.Normal);
                File.Delete(saveLocation);
            }
            result = WriteBytesToPath(saveLocation, data);

            if (result)
            {
                result = Utilities.ImageProcessing.ShrinkToSmall(saveLocation);
            }

            return result;
        }
        public static string CategoryBannerUrl(long storeId, string categoryId, string imageName, bool isSecure)
        {
            string u = BaseImageUrl();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/categorybanners/" + categoryId.ToString() + "/banner/";
            u += imageName;
            return u;
        }
        public static string CategoryBannerOriginalUrl(long storeId, string categoryId, string imageName, bool isSecure)
        {
            string u = BaseImageUrl();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/categorybanners/" + categoryId.ToString() + "/";
            u += imageName;
            return u;
        }
        public static string CategoryIconUrl(long storeId, string categoryId, string imageName, bool isSecure)
        {
            string u = BaseImageUrl();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/categoryicons/" + categoryId.ToString() + "/small/";
            u += imageName;
            return u;
        }
        public static string CategoryIconOriginalUrl(long storeId, string categoryId, string imageName, bool isSecure)
        {
            string u = BaseImageUrl();
            if (isSecure)
            {
                u = u.Replace("http://", "https://");
            }
            u += storeId.ToString() + "/categoryicons/" + categoryId.ToString() + "/";
            u += imageName;
            return u;
        }

        private static bool WriteFileToPath(string saveLocation, FileUpload file)
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
        private static bool WriteBytesToPath(string saveLocation, byte[] data)
        {
            bool result = true;

            try
            {
                if (data != null)
                {
                    if (Directory.Exists(Path.GetDirectoryName(saveLocation)) == false)
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(saveLocation));
                    }
                    File.WriteAllBytes(saveLocation, data);                    
                }
            }
            catch (Exception ex)
            {
                EventLog.LogEvent(ex);
                result = false;
            }

            return result;
        }
        private static bool WriteFileToPath(string saveLocation, System.IO.FileStream stream)
        {
            bool result = true;

            try
            {
                if (stream != null)
                {
                    if (Directory.Exists(Path.GetDirectoryName(saveLocation)) == false)
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(saveLocation));
                    }

                    // Create a FileStream object to write a stream to a file
                    using (FileStream fileStream = System.IO.File.Create(saveLocation, (int)stream.Length))
                    {
                        // Fill the bytes[] array with the stream data
                        byte[] bytesInStream = new byte[stream.Length];                        
                        stream.Read(bytesInStream, 0, (int)bytesInStream.Length);

                        // Use FileStream object to write to the specified file
                        fileStream.Write(bytesInStream, 0, bytesInStream.Length);
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog.LogEvent(ex);
                result = false;
            }

            return result;
        }
     
        public static string StoreLogoOriginalUrl(long storeId, long logorevision, string logoimage)
        {
            return StoreLogoOriginalUrl(storeId, logorevision, logoimage, false);
        }

        public static string StoreLogoOriginalUrl(long storeId, long logorevision, string logoimage, bool isSecure)
        {
            string result = BaseImageUrl().ToString();
            if (isSecure)
            {
                result = result.Replace("http://", "https://");
            }

            result += storeId.ToString() + "/storelogo/" + logorevision.ToString() + logoimage;

            return result;
        }

        public static string StoreLogoUrl(long storeId, long logorevision, string imageName)
        {
            return StoreLogoUrl(storeId, logorevision, imageName, false);
        }
        public static string StoreLogoUrl(long storeId, long logorevision, string imageName, bool isSecure)
        {
            if (imageName == "[[default]]")
            {
                return "/content/images/system/DefaultStoreLogo.png";
            }

            string result = BaseImageUrl().ToString();
            if (isSecure)
            {
                result = result.Replace("http://", "https://");
            }

            result += storeId.ToString() + "/storelogo/" + logorevision.ToString() + "/logo/" + imageName;

            return result;
        }

        public static bool UploadStoreImage(Store s, FileUpload file)
        {
            bool result = true;

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }
            
            if (s != null)
            {
                int newRevision = s.Settings.LogoRevision + 1;

                string saveLocation = WebAppSettings.BaseImagePhysicalPath;
                saveLocation += s.Id.ToString() + "/storelogo/" + newRevision + "/";
                saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));

                result = WriteFileToPath(saveLocation, file);

                if (result)
                {
                    s.Settings.LogoRevision = newRevision;
                    result = Utilities.ImageProcessing.ShrinkToLogo(saveLocation);
                }
            }
            return result;
        }

        public static bool DeleteProductImages(long storeId, string productId)
        {
            bool result = true;

            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString() + "/products/" + productId + "/";

            if (Directory.Exists(sourceFolder))
            {

                try
                {
                    FileHelper.DeleteDirectoryAndFilesRecursive(sourceFolder);
                }
                catch (Exception ex)
                {
                    result = false;
                    EventLog.LogEvent(ex);
                }
            }

            return result;
        }
        public static bool DeleteProductVariantImage(long storeId, string productId, string variantId)
        {
            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString() + "/products/" + productId + "/variants/" + variantId;

            if (Directory.Exists(sourceFolder))
            {
                try
                {
                    FileHelper.DeleteDirectoryAndFilesRecursive(sourceFolder);
                    return true;
                }
                catch (Exception ex)
                {                    
                    EventLog.LogEvent(ex);                    
                }
            }

            return false;
        }

        public static bool CloneAllProductFiles(long storeId, string originalId, string newId)
        {
            bool result = true;

            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString() + "/products/" + originalId + "/";

            string destFolder = WebAppSettings.BaseImagePhysicalPath;
            destFolder += storeId.ToString() + "/products/" + newId + "/";
            
            if (Directory.Exists(sourceFolder))
            {
                if (!Directory.Exists(destFolder))
                {
                    Directory.CreateDirectory(destFolder);
                }
                try
                {
                    FileHelper.CopyAllFiles(sourceFolder, destFolder);
                }
                catch (Exception ex)
                {
                    result = false;
                    EventLog.LogEvent(ex);
                }
            }

            return result;
        }

        public static bool DeleteCategoryImages(long storeId, long categoryId)
        {
            bool result = true;

            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString() + "/categories/" + categoryId.ToString() + "/";

            if (Directory.Exists(sourceFolder))
            {
                foreach (string f in Directory.GetFiles(sourceFolder))
                {
                    try
                    {
                        File.SetAttributes(f, FileAttributes.Normal);
                        File.Delete(f);
                    }
                    catch (Exception ex)
                    {
                        result = false;
                        EventLog.LogEvent(ex);
                    }
                }
                Directory.Delete(sourceFolder);
            }

            return result;
        }
        
        public static bool DestroyAllFilesForStore(long storeId)
        {
            bool result = true;

            string sourceFolder = WebAppSettings.BaseImagePhysicalPath;
            sourceFolder += storeId.ToString();

            if (Directory.Exists(sourceFolder))
            {

                try
                {
                    FileHelper.DeleteDirectoryAndFilesRecursive(sourceFolder);
                }
                catch (Exception ex)
                {
                    result = false;
                    EventLog.LogEvent(ex);
                }
            }

            return result;
        }

        public static bool UploadThemePreview(long storeId, string themeId, FileUpload file, bool isBig)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(BaseStoreThemePhysicalPath(storeId, themeId)))
            {
                Directory.CreateDirectory(BaseStoreThemePhysicalPath(storeId, themeId));
            }

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = BaseStoreThemePhysicalPath(storeId, themeId);
            if (isBig)
            {
                saveLocation += "preview_big.png";
            }
            else
            {
                saveLocation += "preview.png";
            }
            result = WriteFileToPath(saveLocation, file);

            if (result)
            {
                if (isBig)
                {
                    Utilities.ImageProcessing.ShrinkToThemePreviewBig(saveLocation);
                }
                else
                {
                    Utilities.ImageProcessing.ShrinkToThemePreview(saveLocation);
                }
            }
            return result;
        }

        #region Assets
        
        protected static string AssetPhysicalPath(long storeId, string themeId)
        {
            return BaseStoreThemePhysicalPath(storeId, themeId) + "assets\\";            
        }
        public static string AssetUrl(long storeId, string themeId, string fileName, bool isSecure)
        {
            return BaseStoreThemeUrl(storeId, themeId, isSecure) + "assets/" + fileName;
        }
        public static List<AssetSnapshot> ListAssetsForTheme(long storeId, string themeId)
        {
            List<AssetSnapshot> result = new List<AssetSnapshot>();

            string p = AssetPhysicalPath(storeId, themeId);
            if (Directory.Exists(p))
            {
                string[] files = Directory.GetFiles(p);
                foreach (string f in files)
                {
                    AssetSnapshot snap = new AssetSnapshot(Path.GetFileName(f), storeId, themeId);
                    result.Add(snap);
                }
            }

            return result;
        }        
        public static bool UploadAsset(long storeId, string themeId, FileUpload file)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(AssetPhysicalPath(storeId, themeId)))
            {
                Directory.CreateDirectory(AssetPhysicalPath(storeId, themeId));
            }

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }
            
            string saveLocation = AssetPhysicalPath(storeId, themeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));
            result = WriteFileToPath(saveLocation, file);
            
            return result;
        }
        public static bool RemoveAsset(long storeId, string themeId, string fileName)
        {
            string f = AssetPhysicalPath(storeId, themeId) + fileName;
            if (File.Exists(f))
            {
                File.SetAttributes(f, FileAttributes.Normal);
                File.Delete(f);
                return true;
            }
            return false;
        }        

        #endregion

        #region Buttons

        protected static string ThemeButtonPhysicalPath(long storeId, string themeId)
        {
            return BaseStoreThemePhysicalPath(storeId, themeId) + "buttons\\";
        }
        public static string ThemeButtonUrl(long storeId, string themeId, string fileName, bool isSecure)
        {
            string u = BaseStoreThemeUrl(storeId, themeId, isSecure);
            u += "buttons/" + fileName;
            return u;
        }
        public static List<ButtonSnapshot> ListButtonsForTheme(long storeId, string themeId)
        {
            List<ButtonSnapshot> result = new List<ButtonSnapshot>();

            string p = ThemeButtonPhysicalPath(storeId, themeId);
            if (Directory.Exists(p))
            {
                string[] files = Directory.GetFiles(p);
                foreach (string f in files)
                {
                    ButtonSnapshot snap = new ButtonSnapshot(Path.GetFileName(f), storeId, themeId);
                    result.Add(snap);
                }
            }

            return result;
        }
        public static bool UploadThemeButton(long storeId, string themeId, FileUpload file)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(ThemeButtonPhysicalPath(storeId, themeId)))
            {
                Directory.CreateDirectory(ThemeButtonPhysicalPath(storeId, themeId));
            }

            if (!ValidateImageType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = ThemeButtonPhysicalPath(storeId, themeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));
            result = WriteFileToPath(saveLocation, file);

            return result;
        }
        public static bool RemoveThemeButton(long storeId, string themeId, string fileName)
        {
            string f = ThemeButtonPhysicalPath(storeId, themeId) + fileName;
            if (File.Exists(f))
            {
                File.SetAttributes(f, FileAttributes.Normal);
                File.Delete(f);
                return true;
            }
            return false;
        }        

        #endregion

        #region Store Assets

        protected static string StoreAssetPhysicalPath(long storeId)
        {
            return BaseStorePhysicalPath(storeId) + "storeassets\\";
        }
        public static string StoreAssetUrl(long storeId, string fileName, bool isSecure)
        {
            return BaseStoreUrl(storeId, isSecure) + "storeassets/" + fileName;
        }
        public static List<StoreAssetSnapshot> ListStoreAssets(long storeId)
        {
            List<StoreAssetSnapshot> result = new List<StoreAssetSnapshot>();

            string p = StoreAssetPhysicalPath(storeId);
            if (Directory.Exists(p))
            {
                string[] files = Directory.GetFiles(p);
                foreach (string f in files)
                {
                    StoreAssetSnapshot snap = new StoreAssetSnapshot(Path.GetFileName(f), storeId);
                    result.Add(snap);
                }
            }

            return result;
        }
        public static bool UploadStoreAsset(long storeId, FileUpload file)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(StoreAssetPhysicalPath(storeId)))
            {
                Directory.CreateDirectory(StoreAssetPhysicalPath(storeId));
            }

            if (!ValidateStoreAssetType(System.IO.Path.GetExtension(file.FileName)))
            {
                return false;
            }

            string saveLocation = StoreAssetPhysicalPath(storeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(file.FileName));
            result = WriteFileToPath(saveLocation, file);

            return result;
        }
        public static bool RemoveStoreAsset(long storeId, string fileName)
        {
            string f = StoreAssetPhysicalPath(storeId) + fileName;
            if (File.Exists(f))
            {
                File.SetAttributes(f, FileAttributes.Normal);
                File.Delete(f);
                return true;
            }
            return false;
        }

        #endregion

        #region File Vault

        protected static string FileVaultPhysicalPath(long storeId)
        {
            return BaseStorePhysicalPath(storeId) + "filevault\\";
        }
        //public static List<StoreAssetSnapshot> ListStoreAssets(long storeId)
        //{
        //    List<StoreAssetSnapshot> result = new List<StoreAssetSnapshot>();

        //    string p = StoreAssetPhysicalPath(storeId);
        //    if (Directory.Exists(p))
        //    {
        //        string[] files = Directory.GetFiles(p);
        //        foreach (string f in files)
        //        {
        //            StoreAssetSnapshot snap = new StoreAssetSnapshot(Path.GetFileName(f), storeId);
        //            result.Add(snap);
        //        }
        //    }

        //    return result;
        //}
        public static bool FileVaultUpload(long storeId, string diskFileName, FileUpload file)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(FileVaultPhysicalPath(storeId)))
            {
                Directory.CreateDirectory(FileVaultPhysicalPath(storeId));
            }            

            string saveLocation = FileVaultPhysicalPath(storeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(diskFileName));
            result = WriteFileToPath(saveLocation, file);

            return result;
        }
        public static bool FileVaultUpload(long storeId, string diskFileName, System.IO.FileStream stream)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(FileVaultPhysicalPath(storeId)))
            {
                Directory.CreateDirectory(FileVaultPhysicalPath(storeId));
            }

            string saveLocation = FileVaultPhysicalPath(storeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(diskFileName));
            result = WriteFileToPath(saveLocation, stream);

            return result;
        }
        public static bool FileVaultUpload(long storeId, string diskFileName, byte[] data)
        {
            bool result = true;

            // Ensure the directory exists
            if (!Directory.Exists(FileVaultPhysicalPath(storeId)))
            {
                Directory.CreateDirectory(FileVaultPhysicalPath(storeId));
            }

            string saveLocation = FileVaultPhysicalPath(storeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(diskFileName));
            result = WriteBytesToPath(saveLocation, data);

            return result;
        }
        public static bool FileVaultUploadPartial(long storeId, string diskFileName, byte[] data, bool isFirstPart)
        {
            bool result = false;

             // Ensure the directory exists
            if (!Directory.Exists(FileVaultPhysicalPath(storeId)))
            {
                Directory.CreateDirectory(FileVaultPhysicalPath(storeId));
            }

             string saveLocation = FileVaultPhysicalPath(storeId);
            saveLocation += System.IO.Path.GetFileName(MerchantTribe.Web.Text.CleanFileName(diskFileName));            
         
            if (isFirstPart)
            {
                // Delete the old one if it exists and this is the first part upload
                if (File.Exists(saveLocation))
                {
                    File.SetAttributes(saveLocation, FileAttributes.Normal);
                    File.Delete(saveLocation);
                }

                // Create New
                FileStream fs = File.Create(saveLocation);
                fs.Write(data, 0, data.Length);                
                fs.Flush();
                fs.Close();
            }
            else
            {
                // Append
                using (FileStream writeStream = File.Open(saveLocation, FileMode.Append, FileAccess.Write, FileShare.None))
                {
                    writeStream.Write(data, 0, data.Length);
                }                               
            }

            result = true;
            return result;
        }

        public static bool FileVaultRemove(long storeId, string fileName)
        {
            string f = FileVaultPhysicalPath(storeId) + MerchantTribe.Web.Text.CleanFileName(fileName);
            if (File.Exists(f))
            {
                File.SetAttributes(f, FileAttributes.Normal);
                File.Delete(f);
                return true;
            }
            return false;
        }
        public static bool FileVaultFileExists(long storeId, string fileName)
        {
            if (File.Exists(FileVaultPhysicalPath(storeId) + MerchantTribe.Web.Text.CleanFileName(fileName)))
            {
                return true;
            }
            return false;
        }
        public static byte[] FileVaultGetBytes(long storeId, string fileName)
        {
            byte[] bytes = null;

            if (FileVaultFileExists(storeId, fileName))
            {
                bytes = File.ReadAllBytes(FileVaultPhysicalPath(storeId) + MerchantTribe.Web.Text.CleanFileName(fileName));
            }

            return bytes;
        }
        public static System.IO.FileStream FileVaultGetStream(long storeId, string fileName)
        {
            FileStream stream = null;

            if (FileVaultFileExists(storeId, fileName))
            {
                stream = File.Open(FileVaultPhysicalPath(storeId) + MerchantTribe.Web.Text.CleanFileName(fileName), FileMode.Open, FileAccess.Read, FileShare.Read);
            }

            return stream;
        }
        #endregion
             
        private static bool WriteTextToFile(string saveLocation, string data)
        {
            bool result = true;

            try
            {
                if (Directory.Exists(Path.GetDirectoryName(saveLocation)) == false)
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(saveLocation));
                }
                File.WriteAllText(saveLocation, data);
            }
            catch (Exception ex)
            {
                EventLog.LogEvent(ex);
                result = false;
            }

            return result;
        }
        public static bool WriteThemeFile(long storeId, string themeId, string fileName, string fileText)
        {
            bool result = true;
            
            string saveLocation = BaseStoreThemePhysicalPath(storeId, themeId);
            if (Directory.Exists(saveLocation))
            {
                saveLocation += fileName;
                result = WriteTextToFile(saveLocation, fileText);
            }

            return result;
        }
        public static string ReadThemeFile(long storeId,string themeId, string fileName)
        {
            string result = string.Empty;
            string location = BaseStoreThemePhysicalPath(storeId, themeId);
            location += fileName;
            if (File.Exists(location))
            {
                result = File.ReadAllText(location);
            }
            return result;
        }
        public static bool WriteCustomHeader(long storeId, string themeId, string headerText)
        {
            return WriteThemeFile(storeId, themeId, "header.htm", headerText);
        }
        public static bool WriteCustomFooter(long storeId, string themeId, string footerText)
        {
            return WriteThemeFile(storeId, themeId, "footer.htm", footerText);
        }
        public static string ReadCustomHeader(long storeId, string themeId)
        {
            return ReadThemeFile(storeId, themeId, "header.htm");
        }
        public static string ReadCustomFooter(long storeId, string themeId)
        {
            return ReadThemeFile(storeId, themeId, "footer.htm");
        }

        public static string ReadStyleSheet(long storeId, string themeId)
        {
            return ReadThemeFile(storeId, themeId, "styles.css");
        }
        public static bool WriteStyleSheet(long storeId,string themeId, string css)
        {
            bool result = true;

            result =  WriteThemeFile(storeId, themeId, "styles.css", css);
            MinifyStyleSheet(storeId, themeId);

            return result;
        }
           
        public static bool MinifyStyleSheet(long storeId,string themeId)
        {
            bool result = true;
            string css = ReadStyleSheet(storeId, themeId);
            css = css.Replace("{{assets}}", BaseStoreThemeUrl(storeId, themeId, true) + "assets/");
            string compressed = MerchantTribe.Web.Css.Compressor.Minify(css);
            result = WriteThemeFile(storeId, themeId, "styles.min.css", compressed);
            return result;
        }

        public static string GetMinifiedStyleSheet(long storeId, string themeId)
        {            
            string css = ReadStyleSheet(storeId, themeId);
            //css = css.Replace("{{assets}}", BaseStoreThemeUrl(storeId, themeId, true) + "assets/");
            css = css.Replace("{{assets}}", "../../images/sites/" + storeId + "/themes/theme-" + themeId + "/assets/");

            // inject common themes
            string common = string.Empty;
            string location = Path.Combine(WebAppSettings.ApplicationBuiltinThemesPath,"common.css");            
            if (File.Exists(location))
            {
                common = File.ReadAllText(location);
            }
            css = css.Replace("{{commonstyles}}", common);

            // inject common updates
            string commonupdates = string.Empty;
            string locationupdates = Path.Combine(WebAppSettings.ApplicationBuiltinThemesPath, "commonupdates.css");
            if (File.Exists(locationupdates))
            {
                commonupdates = File.ReadAllText(locationupdates);
            }
            css = css.Replace("{{commonupdates}}", commonupdates);
            
            // minify
            string compressed = MerchantTribe.Web.Css.Compressor.Minify(css);
            return compressed;            
        }

        public static string GetMinifiedAdminStyleSheet(string physicalFile, string baseUrl)
        {
            string css = File.ReadAllText(physicalFile);
            css = css.Replace("~/", baseUrl);
            string compressed = MerchantTribe.Web.Css.Compressor.Minify(css);
            return compressed;
        }

        internal static string[] ListInstalledThemePaths(long storeId)
        {
            string[] result = { };

            if (Directory.Exists(BaseStorePhysicalPath(storeId) + "themes"))
            {
                result = Directory.GetDirectories(BaseStorePhysicalPath(storeId) + "themes");
            }

            return result;
        }

        internal static string[] ListAvailableThemePaths()
        {
            string[] result = { };

            if (Directory.Exists(WebAppSettings.ApplicationBuiltinThemesPath)) 
            {
                result = Directory.GetDirectories(WebAppSettings.ApplicationBuiltinThemesPath); 
            }

            return result;
        }

        internal static bool DeleteThemeFolder(long storeId, string themeId)
        {
            bool result = true;

            if (Directory.Exists(BaseStoreThemePhysicalPath(storeId, themeId)))
            {
                FileHelper.DeleteDirectoryAndFilesRecursive(BaseStoreThemePhysicalPath(storeId, themeId));
            }

            return result;
        }

        internal static bool InstallTheme(long storeId, string themeId)
        {
            bool result = true;

            string source = BuiltinThemesPath() + "\\theme-" + themeId;
            string destination = BaseStoreThemePhysicalPath(storeId, themeId);
            
            // Delete the existing theme if it is there
            DeleteThemeFolder(storeId, themeId);

            // Make sure the destination folder exists
            FileHelper.CreateAndCheckDirectory(destination);

            result = FileHelper.CopyAllFiles(source, destination);

            return result;
        }
    }
}

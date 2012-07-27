using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Web.UI.WebControls;
using System.Collections.ObjectModel;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Membership;
using MerchantTribe.Commerce.Utilities;
using System.Collections.Generic;

namespace MerchantTribeStore
{

    partial class products_products_edit_images : BaseProductAdminPage
    {

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            this.PageTitle = "Edit Product Images";
            this.CurrentTab = AdminTabType.Catalog;
            ValidateCurrentUserHasPermission(SystemPermissions.CatalogView);
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Response.Cache.SetExpires(System.DateTime.UtcNow.ToLocalTime());
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetValidUntilExpires(true);
            
            if (!Page.IsPostBack)
            {
                this.ProductIdField.Value = Request.QueryString["id"];                
            }

            Page.ClientScript.RegisterClientScriptBlock(typeof(System.Web.UI.Page), "imagesorter", RenderJQuery(this.ProductIdField.Value), true);

            LoadImages();
        }

        private string RenderJQuery(string productBvin)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("$(document).ready(function() {");

            sb.Append("$(\"#dragitem-list\").sortable({");
            sb.Append("placeholder:  'ui-state-highlight',");
            sb.Append("axis:   'y',");
            sb.Append("opacity:  '0.75',");
            sb.Append("cursor:  'move',");
            sb.Append("update: function(event, ui) {");
            sb.Append(" var sorted = $(this).sortable('toArray');");
            sb.Append(" sorted += '';");
            sb.Append("$.post('Products_Edit_Images_Sort.aspx',");
            sb.Append("  { \"ids\": sorted,");
            sb.Append("    \"bvin\": \"" + productBvin + "\"");
            sb.Append("  });");
            sb.Append(" }");
            sb.Append("});");

            sb.Append("$('#dragitem-list').disableSelection();");

            sb.Append("$('.trash').click(function() {");          
            sb.Append(" RemoveItem($(this));");
            sb.Append(" return false;");
            sb.Append("});");

            sb.Append("});");
            // End of Document Ready

            sb.Append("function RemoveItem(lnk) {");
            sb.Append("  var id = $(lnk).attr('id');");
            sb.Append("$.post('Products_Edit_Images_Delete.aspx',");
            sb.Append("  { \"id\": id.replace('rem', ''),");
            sb.Append("  \"bvin\": \"" + productBvin + "\"");
            sb.Append("  },");
            sb.Append("  function() {");
            sb.Append("lnk.parent().parent().parent().parent().parent().slideUp('slow', function() {");
            sb.Append("lnk.parent().parent().parent().parent().parent().remove();});");
            sb.Append("  }");
            sb.Append(" );");
            sb.Append("}");

            return sb.ToString();
        }

        private void LoadImages()
        {
            List<ProductImage> images = MTApp.CatalogServices.ProductImages.FindByProductId(this.ProductIdField.Value);

            RenderImages(images);
        }

        private void RenderImages(List<ProductImage> images)
        {
            StringBuilder sb = new StringBuilder();


            sb.Append("<div id=\"dragitem-list\">");
                      
            foreach (ProductImage img in images)
            {
                RenderSingleItem(sb, img);
                
            }

            sb.Append("</div>");

            this.litImages.Text = sb.ToString();
        }

        private void RenderSingleItem(StringBuilder sb, ProductImage img)
        {        
            //string destinationLink = "ProductChoices_Edit.aspx?cid=" + o.Bvin + "&id=" + productBvin;
            string destinationLink = "#";

            sb.Append("<div class=\"dragitem\" id=\"img" + img.Bvin + "\"><table class=\"formtable\" width=\"100%\"><tr>");
            sb.Append("<td width=\"25%\"><a href=\"" + destinationLink + "\">");            
            sb.Append("<img src=\"");
            sb.Append(MerchantTribe.Commerce.Storage.DiskStorage.ProductAdditionalImageUrlTiny(MTApp.CurrentStore.Id,
                                                                                                      img.ProductId,
                                                                                                      img.Bvin,
                                                                                                      img.FileName,
                                                                                                      true));
            sb.Append("\" border=\"0\" alt=\"" + img.AlternateText + "\" />");
            sb.Append("</a></td>");

            sb.Append("<td>");
            sb.Append(img.Caption);            
            sb.Append("</td>");

            //sb.Append("<td width=\"75\"><a href=\"" + destinationLink + "\"><img src=\"../images/buttons/edit.png\" alt=\"edit\" /></a></td>");

            sb.Append("<td width=\"30\"><a href=\"#\" class=\"trash\" id=\"rem" + img.Bvin + "\"");            
            sb.Append("><img src=\"../../images/system/trashcan.png\" alt=\"Delete\" /></a></td>");
            sb.Append("<td width=\"30\"><a href=\"#\" class=\"handle\"><img src=\"../../images/system/draghandle.png\" alt=\"Move\" /></a></td>");

            sb.Append("</tr></table></div>");
        }
                
        protected override bool Save()
        {
            return true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (imgupload.HasFile)
            {
                if (imgupload.PostedFile.ContentType == "image/jpeg" || imgupload.PostedFile.ContentType == "image/png" || imgupload.PostedFile.ContentType == "image/gif")
                {
                    string fileName = Path.GetFileNameWithoutExtension(imgupload.FileName);
                    string ext = Path.GetExtension(imgupload.FileName);

                    if (MerchantTribe.Commerce.Storage.DiskStorage.ValidateImageType(ext))
                    {
                        fileName = MerchantTribe.Web.Text.CleanFileName(fileName);

                        ProductImage img = new ProductImage();
                        img.Bvin = System.Guid.NewGuid().ToString();

                        // Construct filename
                        string filename = Path.GetFileName(imgupload.FileName);
                        filename = Server.MapPath("~/Images/sites/1/products/" + this.ProductIdField.Value + "/additional/" + img.Bvin + "/") + filename;

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

                        string pathOfOutputTiny = Path.Combine(pathOfOriginal, "tiny");
                        if (!Directory.Exists(pathOfOutputTiny))
                        {
                            Directory.CreateDirectory(pathOfOutputTiny);
                        }

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

                        ShrinkImageFileOnUpload(filename, "tiny", 50, 50, imgupload);
                        ShrinkImageFileOnUpload(filename, "small", 240, 240, imgupload);
                        ShrinkImageFileOnUpload(filename, "medium", 440, 440, imgupload);

                        img.AlternateText = fileName + ext;
                        img.FileName = fileName + ext;
                        img.Caption = string.Empty;
                        img.ProductId = this.ProductIdField.Value;
                        if (MTApp.CatalogServices.ProductImages.Create(img))
                        {
                            this.MessageBox1.ShowOk("New Image Added at " + DateTime.Now.ToString() + ".");
                        }
                        else
                        {
                            this.MessageBox1.ShowWarning("Unable to save image record. Unknown error.");
                        }

                        //p.ImageFileSmall = fileName + ext;
                        //p.ImageFileMedium = fileName + ext;
                        /*
                        if (MerchantTribe.Commerce.Storage.DiskStorage.UploadAdditionalProductImage(MTApp.CurrentStore.Id, this.ProductIdField.Value, img.Bvin, this.imgupload))
                        {
                            img.AlternateText = fileName + ext;
                            img.FileName = fileName + ext;
                            img.Caption = string.Empty;
                            img.ProductId = this.ProductIdField.Value;
                            if (MTApp.CatalogServices.ProductImages.Create(img))
                            {
                                this.MessageBox1.ShowOk("New Image Added at " + DateTime.Now.ToString() + ".");
                            }
                            else
                            {
                                this.MessageBox1.ShowWarning("Unable to save image record. Unknown error.");
                            }
                        }
                        else
                        {
                            this.MessageBox1.ShowWarning("Unable to save image. Unknown error.");
                        }
                        */

                        if (Directory.Exists(Path.GetDirectoryName(filename)) == true)
                            this.MessageBox1.ShowOk("New Image Added at " + DateTime.Now.ToString() + ".");
                        else
                            this.MessageBox1.ShowWarning("Unable to save image record. Unknown error.");

                        LoadImages();
                    }
                }
                else
                    this.MessageBox1.ShowError("Only .PNG, .JPG, .GIF file types are allowed for icon images");
            }
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

        protected void btnAdd2_Click(object sender, EventArgs e)
        {
            // Image Upload
            if ((this.imgupload.HasFile))
            {

                string fileName = System.IO.Path.GetFileNameWithoutExtension(imgupload.FileName);
                string ext = System.IO.Path.GetExtension(imgupload.FileName);

                if (MerchantTribe.Commerce.Storage.DiskStorage.ValidateImageType(ext))
                {
                    fileName = MerchantTribe.Web.Text.CleanFileName(fileName);

                    ProductImage img = new ProductImage();
                    img.Bvin = System.Guid.NewGuid().ToString();

                    if (MerchantTribe.Commerce.Storage.DiskStorage.UploadAdditionalProductImage(MTApp.CurrentStore.Id, this.ProductIdField.Value, img.Bvin, this.imgupload))
                    {
                        img.AlternateText = fileName + ext;
                        img.FileName = fileName + ext;
                        img.Caption = string.Empty;
                        img.ProductId = this.ProductIdField.Value;                        
                        if (MTApp.CatalogServices.ProductImages.Create(img))
                        {
                            this.MessageBox1.ShowOk("New Image Added at " + DateTime.Now.ToString() + ".");
                        }
                        else
                        {
                            this.MessageBox1.ShowWarning("Unable to save image record. Unknown error.");
                        }
                    }
                    else
                    {
                        this.MessageBox1.ShowWarning("Unable to save image. Unknown error.");
                    }

                    LoadImages();
                }
                else
                {
                    this.MessageBox1.ShowError("Only .PNG, .JPG, .GIF file types are allowed for icon images");                    
                }
            }
        }        
    }
}
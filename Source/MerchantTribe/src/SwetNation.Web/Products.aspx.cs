using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;
using MerchantTribe.Commerce;
using MerchantTribe.Commerce.Orders;
using System.Text;
using SwetNation.Web.models;

namespace SwetNation.Web
{
    public partial class Products : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowProductIntro();
            if (Page.IsPostBack)
            {
                
            }
            else
            {
                GetProducts();
                BindCategoryDropDown();
                pnlStatus.Visible = false;
            }
        }

        private void ShowProductIntro()
        {
            string manufacturerId = "";
            if (!String.IsNullOrEmpty(Request.QueryString["ManufacturerId"]))
                manufacturerId = Request.QueryString["ManufacturerId"];

            pnlBurton.Visible = false;
            pnlLululemon.Visible = false;
            pnlNike.Visible = false;
            pnlSpecialized.Visible = false;
            if (manufacturerId == "78f6d011-f0c9-427c-bdba-4d744715bd04")
                pnlBurton.Visible = true;
            else if (manufacturerId == "00467203-a901-4ee2-9749-f0613825ae68")
                pnlLululemon.Visible = true;
            else if (manufacturerId == "c1c58612-0c46-4398-96f2-af95b227ca1d")
                pnlNike.Visible = true;
            else if (manufacturerId == "36d6c17a-5d73-4e31-8c71-1614d07170ec")
                pnlSpecialized.Visible = true;
        }

        private void BindCategoryDropDown()
        {
            List<MerchantTribe.Commerce.Catalog.CategorySnapshot> categories = new List<CategorySnapshot>();
            categories = MTApp.CatalogServices.Categories.FindAll();
            ddlCategories.DataSource = categories;
            ddlCategories.DataTextField = "Name";
            ddlCategories.DataValueField = "bvin";
            ddlCategories.DataBind();
        }

        private void GetProducts()
        {
            ProductSearchCriteria productSearchCriteria = new ProductSearchCriteria();
            productSearchCriteria.Status = ProductStatus.Active;

            if (!String.IsNullOrEmpty(Request.QueryString["ManufacturerId"]))
                productSearchCriteria.ManufacturerId += Request.QueryString["ManufacturerId"];

            if (!String.IsNullOrEmpty(Request.QueryString["CategoryId"]))
                productSearchCriteria.CategoryId += Request.QueryString["CategoryId"];

            List<MerchantTribe.Commerce.Catalog.Product> resultItems = new List<MerchantTribe.Commerce.Catalog.Product>();
            resultItems = MTApp.CatalogServices.Products.FindByCriteria(productSearchCriteria);
            lstProducts.DataSource = resultItems;
            lstProducts.DataBind();
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            GetProducts();
        }

        protected void lstProducts_ItemCommand(object source, ListViewCommandEventArgs e)
        {
            string productId = Convert.ToString(e.CommandArgument);
            MerchantTribe.Commerce.Catalog.Product result = null;
            if (productId != string.Empty)
            {
                //result = MTApp.CatalogServices.Products.Find(productId);
                if ((String)e.CommandName == "AddToCart")
                {
                    AddToCart(productId);
                }
                else if ((String)e.CommandName == "SaveForLater")
                {

                }
            }
        }

        public void AddToCart(string bvin)
        {
            ProductPageViewModel model = ProductSetup(bvin);
            // see if we're editing a line item instead of a new add
            string lineItemString = Request.Form["lineitemid"];
            if (!string.IsNullOrEmpty(lineItemString))
            {
                if (model.LineItemId == string.Empty) model.LineItemId = lineItemString;
            }
            ParseSelections(model);
            if (Request.Form["savelaterbutton.x"] != null)
            {
                // Save for Later
                MTApp.CatalogServices.SaveProductToWishList(model.LocalProduct, model.Selections, 1, MTApp);
                ///////////////////////////////////////////////////////////////////////////
                // TO DO
                ///////////////////////////////////////////////////////////////////////////
                //return Redirect("~/account/saveditems");
            }
            else
            {
                // Add to Cart
                bool IsPurchasable = ValidateSelections(model);
                if ((IsPurchasable))
                {
                    DetermineQuantityToAdd(model);
                    if (model.Quantity > 0)
                    {
                        LineItem li = MTApp.CatalogServices.ConvertProductToLineItem(model.LocalProduct,
                                                                                        model.Selections,
                                                                                        model.Quantity,
                                                                                        MTApp);
                        Order Basket = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
                        if (Basket.UserID != SessionManager.GetCurrentUserId(MTApp.CurrentStore))
                        {
                            Basket.UserID = SessionManager.GetCurrentUserId(MTApp.CurrentStore);
                        }
                        if (model.LineItemId.Trim().Length > 0)
                        {
                            long lineItemId = 0;
                            long.TryParse(model.LineItemId, out lineItemId);
                            var toRemove = Basket.Items.Where(y => y.Id == lineItemId).SingleOrDefault();
                            if (toRemove != null) Basket.Items.Remove(toRemove);
                        }
                        MTApp.AddToOrderWithCalculateAndSave(Basket, li);
                        SessionManager.SaveOrderCookies(Basket, MTApp.CurrentStore);

                        /////////////////////////////////////////////////////////////////
                        // TO DO
                        /////////////////////////////////////////////////////////////////
                        //return Redirect("~/cart");

                        pnlStatus.Visible = true;
                        litStatus.Text = "Item has been added to your shopping cart";
                    }
                }
            }
            // Load Selections from form here
            // Do checks and add
            model.PreRenderedOptions = HtmlRendering.ProductOptions(model.LocalProduct.Options, model.Selections);
        }

        private ProductPageViewModel ProductSetup(string bvin)
        {
            ProductPageViewModel model = new ProductPageViewModel();
            model.LocalProduct = ParseProductFromBvin(bvin);
            RenderOptionsJavascript(model);
            CheckForBackOrder(model);
            model.MainImageUrl = MerchantTribe.Commerce.Storage.DiskStorage.ProductImageUrlMedium(MTApp.CurrentStore.Id, model.LocalProduct.Bvin, model.LocalProduct.ImageFileSmall, Request.IsSecureConnection);
            model.MainImageAltText = model.LocalProduct.ImageFileSmallAlternateText;
            RenderPrices(model);
            LoadRelatedItems(model);
            RenderAdditionalImages(model);
            if (Request.QueryString["LineItemId"] != null)
            {
                model.OrderId = Request.QueryString["OrderBvin"];
                model.LineItemId = Request.QueryString["LineItemId"];
            }
            if (SessionManager.IsUserAuthenticated(MTApp))
            {
                model.IsAvailableForWishList = true;
            }
            return model;
        }

        private MerchantTribe.Commerce.Catalog.Product ParseProductFromBvin(string bvin)
        {
            MerchantTribe.Commerce.Catalog.Product result = null;
            if (bvin != string.Empty)
            {
                result = MTApp.CatalogServices.Products.Find(bvin);
                bool possibleError = false;
                if (result == null)
                {
                    possibleError = true;
                }
                else if (result.Status == ProductStatus.Disabled)
                {
                    possibleError = true;
                }

                if (possibleError)
                {
                    ///////////////////////////////////////////////////////////////////////////
                    // TO DO
                    ///////////////////////////////////////////////////////////////////////////
                    //Response.Redirect(Url.Content("~/Error?type=product"));
                }
            }
            return result;
        }

        private void RenderOptionsJavascript(ProductPageViewModel model)
        {
            if (!model.LocalProduct.HasOptions()) return;
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type=\"text/javascript\">");
            // Evaluate Selections
            sb.Append("function EvaluateSelections() {" + System.Environment.NewLine);
            sb.Append(" var loadingUrl = 'images/system/ajax-loader.gif';" + System.Environment.NewLine);
            sb.Append(" var loadingTag = '<img src=\"' + loadingUrl + '\" border=\"0\" alt=\"loading...\" />';" + System.Environment.NewLine);
            //sb.Append(" $('#sku').html(loadingTag);")
            //sb.Append(" $('#pricewrapper').html(loadingTag);")
            sb.Append(" $('.buttons').hide();" + System.Environment.NewLine);
            sb.Append(" $('#localmessage').html('<label>&nbsp;</label><span class=\"choice\">' + loadingTag + '</span>');" + System.Environment.NewLine);
            //sb.Append(" $('#imgMain').attr('src',loadingUrl);"+ System.Environment.NewLine)
            // Write each option to temp varible so we can get it's value as a string
            // This ensures the JSON will get correctly quoted by JQuery
            foreach (Option opt in model.LocalProduct.Options)
            {
                if (opt.OptionType == OptionTypes.CheckBoxes | opt.OptionType == OptionTypes.DropDownList | opt.OptionType == OptionTypes.RadioButtonList)
                {
                    sb.Append("var opt" + opt.Bvin.Replace("-", "") + "=");
                    if (opt.OptionType == OptionTypes.RadioButtonList)
                    {
                        sb.Append("$('.radio" + opt.Bvin.Replace("-", "") + ":checked').val();" + System.Environment.NewLine);

                    }
                    else if (opt.OptionType == OptionTypes.CheckBoxes)
                    {
                        sb.Append("$('.check" + opt.Bvin.Replace("-", "") + ":checked').val();" + System.Environment.NewLine);
                    }
                    else
                    {
                        sb.Append("$('#opt" + opt.Bvin.Replace("-", "") + "').val();" + System.Environment.NewLine);
                    }
                    sb.Append("opt" + opt.Bvin.Replace("-", "") + "+='';" + System.Environment.NewLine);
                    //sb.Append("alert(opt" + opt.Bvin.Replace("-", "") + ");" + System.Environment.NewLine);                            
                }
            }
            sb.Append("$.post('products/validate'," + System.Environment.NewLine);
            sb.Append(" {\"productbvin\":\"" + model.LocalProduct.Bvin + "\"" + System.Environment.NewLine);
            foreach (Option opt in model.LocalProduct.Options)
            {
                if (opt.OptionType == OptionTypes.CheckBoxes | opt.OptionType == OptionTypes.DropDownList | opt.OptionType == OptionTypes.RadioButtonList)
                {
                    sb.Append(", \"opt" + opt.Bvin.Replace("-", "") + "\": opt" + opt.Bvin.Replace("-", ""));
                }
            }
            sb.Append("}, " + System.Environment.NewLine);
            sb.Append("  function(data) {" + System.Environment.NewLine);
            //sb.Append(" alert(data.Message);" + System.Environment.NewLine);
            sb.Append(" if (data.Message === null || data.Message.Length < 1) { $('#localmessage').html('');} else {");
            sb.Append("$('#localmessage').html('<label>&nbsp;</label><span class=\"choice\">' + data.Message + '</span>');");
            sb.Append("}" + System.Environment.NewLine);
            sb.Append(" $('#imgMain').attr('src',data.ImageUrl);" + System.Environment.NewLine);
            sb.Append(" $('#sku').html(data.Sku);" + System.Environment.NewLine);
            sb.Append(" $('.stockdisplay').html(data.StockMessage);" + System.Environment.NewLine);
            sb.Append(" $('#pricewrapper').html(data.Price);" + System.Environment.NewLine);
            //sb.Append(" alert(data.IsValid); "+ System.Environment.NewLine)
            sb.Append(" if (data.IsValid === false) { $('.buttons').hide();} else { $('.buttons').show();}" + System.Environment.NewLine);
            sb.Append("  }, 'json');" + System.Environment.NewLine);
            // end post function            
            sb.Append("}" + System.Environment.NewLine);
            // end evaluate function

            // Document Ready Function
            sb.Append("$(document).ready(function() {" + System.Environment.NewLine);
            sb.Append("$(\".isoption\").change(function() {" + System.Environment.NewLine);
            sb.Append(" EvaluateSelections();" + System.Environment.NewLine);
            sb.Append(" return true;" + System.Environment.NewLine);
            sb.Append("});" + System.Environment.NewLine);
            sb.Append(" EvaluateSelections(); " + System.Environment.NewLine);
            sb.Append("});" + System.Environment.NewLine + System.Environment.NewLine);
            // End of Document Ready

            sb.Append("</script>" + System.Environment.NewLine);
            model.JavaScripts += sb.ToString();
        }

        private void CheckForBackOrder(ProductPageViewModel model)
        {
            InventoryCheckData data = MTApp.CatalogServices.InventoryCheck(model.LocalProduct, string.Empty);
            model.StockMessage = data.InventoryMessage;
            model.IsAvailableForSale = data.IsAvailableForSale;
        }

        private void LoadLineItemValues(ProductPageViewModel model)
        {
            if (model.LineItemId.Trim().Length > 0)
            {
                long lineItemId = 0;
                long.TryParse(model.LineItemId, out lineItemId);

                Order o = SessionManager.CurrentShoppingCart(MTApp.OrderServices, MTApp.CurrentStore);
                if (o != null)
                {
                    var li = o.Items.Where(y => y.Id == lineItemId).SingleOrDefault();
                    if (li != null)
                    {
                        model.Quantity = li.Quantity;
                        model.Selections = li.SelectionData;
                    }
                }
            }
        }

        private void RenderPrices(ProductPageViewModel model)
        {
            string userId = SessionManager.GetCurrentUserId(MTApp.CurrentStore);
            StringBuilder sb = new StringBuilder();

            sb.Append("<div class=\"prices\">");

            UserSpecificPrice productDisplay = MTApp.PriceProduct(model.LocalProduct, MTApp.CurrentCustomer, null);
            if (productDisplay.ListPriceGreaterThanCurrentPrice)
            {
                sb.Append("<label>" + SiteTerms.GetTerm(SiteTermIds.ListPrice) + "</label>");
                sb.Append("<span class=\"choice\"><strike>");
                sb.Append(model.LocalProduct.ListPrice.ToString("C"));
                sb.Append("</strike></span>");
            }


            sb.Append("<label>" + SiteTerms.GetTerm(SiteTermIds.SitePrice) + "</label>");
            sb.Append("<span class=\"choice\">");
            sb.Append(productDisplay.DisplayPrice());
            sb.Append("</span>");

            if ((productDisplay.BasePrice < productDisplay.ListPrice) && (productDisplay.OverrideText.Trim().Length < 1))
            {
                sb.Append("<label>" + SiteTerms.GetTerm(SiteTermIds.YouSave) + "</label>");
                sb.Append("<span class=\"choice\">");
                sb.Append(productDisplay.Savings.ToString("c") + " - " + productDisplay.SavingsPercent + System.Threading.Thread.CurrentThread.CurrentUICulture.NumberFormat.PercentSymbol);
                sb.Append("</span>");
            }

            sb.Append("<div class=\"clear\"></div></div>");
            model.PreRenderedPrices = sb.ToString();
        }

        private void RenderAdditionalImages(ProductPageViewModel model)
        {
            if (model.LocalProduct.Images.Count < 1) return;

            StringBuilder sb = new StringBuilder();
            sb.Append("<div class=\"additionalimages\">");
            foreach (ProductImage img in model.LocalProduct.Images)
            {
                RenderSingleAdditionalImage(sb, img);
            }
            sb.Append("</div>");
            model.PreRenderedImages = sb.ToString();
        }

        private void RenderSingleAdditionalImage(StringBuilder sb, ProductImage img)
        {
            string mediumUrl = MerchantTribe.Commerce.Storage.DiskStorage.ProductAdditionalImageUrlMedium(MTApp.CurrentStore.Id,
                                                                                                       img.ProductId,
                                                                                                       img.Bvin,
                                                                                                       img.FileName,
                                                                                                       false);
            string largeUrl = MerchantTribe.Commerce.Storage.DiskStorage.ProductAdditionalImageUrlOriginal(MTApp.CurrentStore.Id,
                                                                                                       img.ProductId,
                                                                                                       img.Bvin,
                                                                                                       img.FileName,
                                                                                                       false);
            sb.Append("<a href=\"" + largeUrl + "\" alt=\"" + mediumUrl + "\" class=\"popover\">");
            sb.Append("<img src=\"");
            sb.Append(MerchantTribe.Commerce.Storage.DiskStorage.ProductAdditionalImageUrlTiny(MTApp.CurrentStore.Id,
                                                                                                      img.ProductId,
                                                                                                      img.Bvin,
                                                                                                      img.FileName,
                                                                                                      false));
            sb.Append("\" border=\"0\" alt=\"" + img.AlternateText + "\" />");
            sb.Append("</a>");
        }

        private void LoadRelatedItems(ProductPageViewModel model)
        {
            int MaxItemsToShow = 3;
            bool IncludeAutoSuggestions = true;
            List<ProductRelationship> relatedItems = MTApp.CatalogServices.ProductRelationships.FindForProduct(model.LocalProduct.Bvin);
            if (relatedItems == null) return;
            int maxItems = MaxItemsToShow;

            // we have fewer available than max to show
            if (relatedItems.Count < MaxItemsToShow)
            {
                if (IncludeAutoSuggestions)
                {
                    // try to fill in auto suggestions
                    int toAuto = MaxItemsToShow - relatedItems.Count;
                    List<ProductRelationship> autos = MTApp.GetAutoSuggestedRelatedItems(model.LocalProduct.Bvin, toAuto);
                    if (autos != null)
                    {
                        foreach (ProductRelationship r in autos)
                        {
                            relatedItems.Add(r);
                        }
                    }
                }
                maxItems = relatedItems.Count;
            }

            if (relatedItems.Count < 1) return;

            for (int i = 0; i < maxItems; i++)
            {
                string relatedBvin = relatedItems[i].RelatedProductId;
                MerchantTribe.Commerce.Catalog.Product related = MTApp.CatalogServices.Products.Find(relatedBvin);
                if (related != null)
                {
                    SingleProductViewModel item = new SingleProductViewModel(related, MTApp);
                    if (i == 0) item.IsFirstItem = true;
                    if (i == (maxItems - 1)) item.IsLastItem = true;
                    model.RelatedItems.Add(item);
                }
            }
        }

        private void ParseSelections(ProductPageViewModel model)
        {
            OptionSelectionList result = new OptionSelectionList();
            foreach (Option opt in model.LocalProduct.Options)
            {
                OptionSelection selected = opt.ParseFromForm(Request.Form);
                if (selected != null)
                {
                    result.Add(selected);
                }
            }
            model.Selections = result;
        }

        private void DetermineQuantityToAdd(ProductPageViewModel model)
        {
            int quantity = 0;
            string formQuantity = Request.Form["qty"];
            if (int.TryParse(formQuantity, out quantity))
            {
                if (model.LocalProduct.MinimumQty > 0)
                {
                    if (quantity < model.LocalProduct.MinimumQty)
                    {
                        //////////////////////////////////////////////////////////////////////
                        // TO DO
                        //////////////////////////////////////////////////////////////////////
                        //FlashWarning(SiteTerms.ReplaceTermVariable(SiteTerms.GetTerm(SiteTermIds.ProductPageMinimumQuantityError), "quantity", model.LocalProduct.MinimumQty.ToString()));
                        quantity = -1;
                    }
                }
            }
            else
            {
                if (model.LocalProduct.MinimumQty > 0)
                {
                    quantity = model.LocalProduct.MinimumQty;
                }
                else
                {
                    quantity = 1;
                }
            }

            model.Quantity = quantity;
        }

        private bool ValidateSelections(ProductPageViewModel model)
        {
            bool result = false;

            if ((model.LocalProduct.HasOptions()))
            {
                if ((model.LocalProduct.HasVariants()))
                {
                    Variant v = model.LocalProduct.Variants.FindBySelectionData(model.Selections, model.LocalProduct.Options);
                    if ((v != null))
                    {
                        result = true;
                    }
                    else
                    {
                        model.ValidationMessage = "<div class=\"flash-message-warning\">The options you've selected aren't available at the moment. Please select different options.</div>";
                    }
                }
                else
                {
                    result = true;
                }

                // Make sure no "labels" are selected
                if (model.Selections.HasLabelsSelected())
                {
                    result = false;
                    model.ValidationMessage = "<div class=\"flash-message-warning\">Please make all selections before adding to cart.</div>";
                }
            }
            else
            {
                result = true;
            }

            return result;
        }
    }
}
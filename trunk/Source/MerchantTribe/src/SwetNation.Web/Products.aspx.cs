using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MerchantTribe.Commerce.Catalog;
using MerchantTribe.Commerce.Content;
using MerchantTribe.Commerce.Utilities;

namespace SwetNation.Web
{
    public partial class Products : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                GetProducts();
                BindCategoryDropDown();
            }
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

            if (ddlCategories.SelectedValue != "")
                productSearchCriteria.CategoryId = ddlCategories.SelectedValue;

            List<MerchantTribe.Commerce.Catalog.Product> resultItems = new List<MerchantTribe.Commerce.Catalog.Product>();
            resultItems = MTApp.CatalogServices.Products.FindByCriteria(productSearchCriteria);
            rptProducts.DataSource = resultItems;
            rptProducts.DataBind();
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            GetProducts();
        }  
    }
}
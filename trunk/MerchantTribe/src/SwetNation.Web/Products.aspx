<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SwetNation.Web.Products" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .filter-bar 
        { 
            border-bottom-width: 1px;
            border-bottom-color: #242424;
            border-bottom-style: dotted;
            margin: 0px 0px; 
            padding: 5px; 
            width: 99%;
            color: Black;
            font-weight: 200;
        }
        .styled-select {
           background: transparent;
           width: 218px;
           padding: 2px;
           font-size: 12px;
           border: 1px solid #ccc;
           height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Products" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div class="filter-bar">
        <span>Filter by:&nbsp; </span>
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="true" CausesValidation="false" CssClass="styled-select" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
            <asp:ListItem Text="" Value=""></asp:ListItem>
            <asp:ListItem Text="Men" Value="Men"></asp:ListItem>
            <asp:ListItem Text="Women" Value="Women"></asp:ListItem>
            <asp:ListItem Text="Current Sale" Value="Current Sale"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br /><br />
    <asp:Repeater ID="rptProducts" EnableViewState="False" runat="server">
        <ItemTemplate>
            <div class="one">		        
		        <div class="one-fourth">
			        <div class="sidebar-image-holder">
				        <div class="slide-down-gallery">
					        <div class="text_slider">
						        <div class="innertext">
							        <strong><%# Eval("ProductName") %> - <%# String.Format("{0:C}", Eval("SitePrice"))%></strong>
						        </div>
					        </div>
					        <div class="image_slider">
						        <img src='https://swetnation.com/shop/Images/sites/1/products/<%# Eval("Bvin") %>/<%# Eval("ImageFileSmall") %>' width='207' height='140' alt='<%# Eval("ProductName") %>' />
					        </div>
				        </div>
			        </div>
		        </div>
		        <div class="inner-content last">
			        <h4><%# Eval("ProductName") %> - <%# String.Format("{0:C}", Eval("SitePrice"))%></h4>
			        <p>
				        <%# Eval("ShortDescription")%>
			        </p>
			        <a href='ProductDetail.aspx?bvin=<%# Eval("Bvin") %>' class="button cube grey small">View Product</a>
			        <a href="#" class="button cube green small">Buy This Item</a>
		        </div>
                <div class="horizontal-line">
		        </div>
	        </div>        
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SwetNation.Web.Products" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Products" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <asp:Repeater ID="rptProducts" EnableViewState="False" runat="server">
        <ItemTemplate>
            <div class="one">
		        <div class="horizontal-line">
		        </div>
		        <div class="one-fourth">
			        <div class="sidebar-image-holder">
				        <div class="slide-down-gallery">
					        <div class="text_slider">
						        <div class="innertext">
							        <strong><%# Eval("ProductName") %> - <%# String.Format("{0:C}", Eval("ListPrice")) %></strong>
						        </div>
					        </div>
					        <div class="image_slider">
						        <img src='https://swetnation.com/shop/Images/sites/1/products/<%# Eval("Bvin") %>/<%# Eval("ImageFileSmall") %>' width='207' height='140' alt='<%# Eval("ProductName") %>' />
					        </div>
				        </div>
			        </div>
		        </div>
		        <div class="inner-content last">
			        <h4><%# Eval("ProductName") %> - <%# String.Format("{0:C}", Eval("ListPrice"))%></h4>
			        <p>
				        <%# Eval("LongDescription")%>
			        </p>
			        <a href="#" class="button cube grey small">View Product</a>
			        <a href="#" class="button cube green small">Buy This Item</a>
		        </div>
	        </div>        
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
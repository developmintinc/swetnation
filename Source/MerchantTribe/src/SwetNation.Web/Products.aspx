<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SwetNation.Web.Products" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
	<uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Products" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div class="one">
        <asp:Panel ID="pnlStatus" runat="server" CssClass="fancy-error" EnableViewState="false" Visible="false">
            <asp:Literal ID="litStatus" runat="server" Mode="PassThrough"></asp:Literal>
        </asp:Panel>
    </div>
    <div class="one">
        <asp:Panel ID="pnlBrand" runat="server" CssClass="one product-intro" ClientIDMode="Static">
            <div class="one-third">
                <asp:Image ID="imgBrand" runat="server" />
		    </div>
            <div class="one-half last">
			    <div class="header-title white"><asp:Literal ID="litBrandName" runat="server" Mode="PassThrough"></asp:Literal></div>
                <asp:Literal ID="litBrandDescription" runat="server" Mode="PassThrough"></asp:Literal>
		    </div>
        </asp:Panel>        
    </div>
    <div class="one">
        <asp:ListView runat="server" ID="lstProducts" GroupItemCount="3" OnItemCommand="lstProducts_ItemCommand">
            <LayoutTemplate>
                <div style="width: 1000px;">
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder" />
                </div>
            </LayoutTemplate>
            <GroupTemplate>
                <div style="clear: both;">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div class="productItem">
                    <div><img src='https://swetnation.com/shop/Images/sites/1/products/<%# Eval("Bvin") %>/<%# Eval("ImageFileSmall") %>' width='270' height='270' alt='<%# Eval("ProductName") %>' /></div>
                    <div>
                        <br />
                        <a href='ProductDetail.aspx?bvin=<%# Eval("Bvin") %>' class="button cube deep-red small">View Product</a>					    
                    </div>
                    <div style="margin-top:5px;"><strong><%# Eval("ProductName") %></strong></div>
                    <div>
                        <strong style="text-decoration:line-through;">Retail: <%# String.Format("{0:C}", Eval("ListPrice"))%></strong> | 
                        <strong style="color:Red;">Members: <%# String.Format("{0:C}", Eval("SitePrice"))%></strong>
                    </div>
                </div>
            </ItemTemplate>
            <ItemSeparatorTemplate>
                <div class="itemSeparator">
                </div>
            </ItemSeparatorTemplate>
            <GroupSeparatorTemplate>
                <div class="groupSeparator">
                </div>
            </GroupSeparatorTemplate>
            <EmptyDataTemplate>
            </EmptyDataTemplate>
        </asp:ListView>
        <asp:DropDownList ID="ddlCategories" runat="server" Visible="false" AutoPostBack="true" CausesValidation="false" CssClass="styled-select" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
			<asp:ListItem Text="" Value=""></asp:ListItem>
			<asp:ListItem Text="Men" Value="Men"></asp:ListItem>
			<asp:ListItem Text="Women" Value="Women"></asp:ListItem>
			<asp:ListItem Text="Current Sale" Value="Current Sale"></asp:ListItem>
		</asp:DropDownList>
    </div>
    <script language="javascript" type="text/javascript">
        var gi, gd, gj = 1, gn = 20, gt = 40;
        function sli(ii, wd1, ht1, wd2, ht2) {
            gi = ii;
            gd = 1;
            swd = wd1;
            sht = ht1;
            lwd = wd2;
            lht = ht2; 
            rs(); 
        }
        function ssi(ii, wd1, ht1, wd2, ht2) {
            gd = -1;
            swd = wd1; 
            sht = ht1;
            lwd = wd2; lht = ht2; rs();
        } 
        function xy(x1, x2, gj) {
            return (x2 - x1) * gj / gn + x1;
        }
        function rs() {
            gi.style.width = xy(swd, lwd, gj) + "px";
            gi.style.height = xy(sht, lht, gj) + "px";
            if (gd > 0 && gn > gj) {
                gj++; setTimeout('rs()', gt);
            }
            else if (0 > gd && gj > 0) {
                gj--;
                setTimeout('rs()', gt);
            } 
        }
    </script>
</asp:Content>
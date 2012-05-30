<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="SwetNation.Web.ProductDetail" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .fullprice { text-decoration: line-through !important; font-weight: bold;}
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div class="one">
        <asp:Panel ID="pnlStatus" runat="server" CssClass="fancy-error" EnableViewState="false" Visible="false">
            <asp:Literal ID="litStatus" runat="server" Mode="PassThrough"></asp:Literal>
        </asp:Panel>
    </div>
    <div class="one">
		<div class="one-fourth">
			<div class="sidebar-image-holder">
				<div class="slide-down-gallery">
					<div class="text_slider">
						<div class="innertext">
							<strong><asp:Literal ID="litProductNameSlider" runat="server"></asp:Literal> - <asp:Literal ID="litListPriceSlider" runat="server"></asp:Literal></strong>
						</div>
					</div>
					<div class="image_slider">
                        <asp:Image ID="imgProductImageSmall" runat="server" Width="207" Height="140" AlternateText="" />
					</div>
				</div>
			</div>
		</div>
		<div class="inner-content last">
			<h4>
                <asp:Literal ID="litProductNameContent" runat="server"></asp:Literal> 
                <span style="color:#EE0000; font-weight: bold;">
                    <asp:Literal ID="litSitePriceContent" runat="server"></asp:Literal>
                </span>
            </h4>
			<p>
                Retail Price <span class="fullprice"><asp:Literal ID="litListPriceContent" runat="server"></asp:Literal></span>
            </p>
            <p>
				<asp:Literal ID="litLongDescription" runat="server"></asp:Literal>
			</p>
            <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="button cube deep-red small" OnClick="lnkAddToCart_Click">Add To Cart</asp:LinkButton>
		</div>
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

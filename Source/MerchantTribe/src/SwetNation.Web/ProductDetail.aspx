<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="SwetNation.Web.ProductDetail" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .fullprice { text-decoration: line-through !important; font-weight: bold;}
    </style>

    <!-- FaceBook OpenGraph Tags -->    <asp:Literal ID="litFBTitle" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBType" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBUrl" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBImage" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBSiteName" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBAdmins" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBAppId" runat="server" Mode="PassThrough"></asp:Literal>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div id="fb-root"></div>
    <script>
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        } (document, 'script', 'facebook-jssdk'));
    </script>
    <div class="one">
        <asp:Panel ID="pnlStatus" runat="server" CssClass="fancy-error" EnableViewState="false" Visible="false">
            <asp:Literal ID="litStatus" runat="server" Mode="PassThrough"></asp:Literal>
        </asp:Panel>
    </div>
    <div class="one">
		<div class="one-third">
			<asp:Image ID="imgProductImageSmall" runat="server" Width="300" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
		</div>
        <div class="one-half last">
            <h2>
                <asp:Literal ID="litProductNameContent" runat="server"></asp:Literal> 
                <span style="color:#EE0000; font-weight: bold;">
                    <asp:Literal ID="litSitePriceContent" runat="server"></asp:Literal>
                </span>
            </h2>
			<p>
                Retail Price <span class="fullprice"><asp:Literal ID="litListPriceContent" runat="server"></asp:Literal></span>
            </p>
            <p>
				<asp:Literal ID="litLongDescription" runat="server"></asp:Literal>
			</p>
            <div style="background-color: #eee; border-width: 1px; border-color: grey; border-style: solid; padding: 5px; margin: 5px 0px;">
                <table>
                    <tr>
                        <td><asp:HiddenField ID="hdfOptionBvin" runat="server" /></td>
                        <td><asp:DropDownList ID="ddlOptions" runat="server" Visible="false" Width="200px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><strong>Quantity</strong></td>
                        <td><asp:TextBox ID="txtQuantity" runat="server" Width="200px" Text="1"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="button cube deep-red small" OnClick="lnkAddToCart_Click">Add To Cart</asp:LinkButton></td>
                    </tr>
                </table>
            </div>
            
            <br /><br />
            
            <!-- FaceBook Like -->
            <asp:Literal ID="litFBLike" runat="server" Mode="PassThrough"></asp:Literal>                        <!-- Tweet Button -->                       <asp:Literal ID="litTweet" runat="server" Mode="PassThrough"></asp:Literal>            
            <!-- Google Plus One Button -->
            <asp:Literal ID="litGooglePlus" runat="server" Mode="PassThrough"></asp:Literal>
            
            <!-- FaceBook Like -->            <div class="fb-like" data-href="http://swetnation.com" data-send="true" data-layout="button_count" data-width="450" data-show-faces="false"></div>
            <!-- Tweet Button -->                       <script src="https://platform.twitter.com/widgets.js" type="text/javascript"></script>            <a href="https://twitter.com/share?url=http%3a%2f%2fswetnation.com&amp;via=swetnation&amp;text=Check This Out: Swet Nation &amp;related=&amp;count=horizontal&amp;lang=en&amp;counturl=http%3a%2f%2fswetnation.com" class="twitter-share-button">Tweet</a>
            <!-- Google Plus One Button -->                       <g:plusone href="http://swetnation.com" size="standard" annotation="inline"></g:plusone>
            <script type="text/javascript">
                window.___gcfg = {
                    lang: 'en-US'
                };

                (function () {
                    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                })();
            </script>
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

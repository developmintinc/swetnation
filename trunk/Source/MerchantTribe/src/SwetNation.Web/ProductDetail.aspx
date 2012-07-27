<%@ Page Title="" Language="C#" MasterPageFile="~/Product.master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="SwetNation.Web.ProductDetail" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/product.css" rel="stylesheet" type="text/css" />
    <script src="js/product.js" type="text/javascript"></script>

    <!-- FaceBook OpenGraph Tags -->    <asp:Literal ID="litFBTitle" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBType" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBUrl" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBImage" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBSiteName" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBAdmins" runat="server" Mode="PassThrough"></asp:Literal>    <asp:Literal ID="litFBAppId" runat="server" Mode="PassThrough"></asp:Literal>

    <style type="text/css">
        .thumbnail{
            position: relative;
            z-index: 0;
        }

        .thumbnail:hover{
            background-color: transparent;
            z-index: 50;
        }

        .thumbnail span{ /*CSS for enlarged image*/
            position: absolute;
            background-color: lightyellow;
            padding: 5px;
            left: -1000px;
            border: 1px dashed gray;
            visibility: hidden;
            color: black;
            text-decoration: none;
        }

        .thumbnail span img{ /*CSS for enlarged image*/
            border-width: 0;
            padding: 2px;
        }

        .thumbnail:hover span{ /*CSS for enlarged image on hover*/
            visibility: visible;
            top: 0;
            left: 60px; /*position where enlarged image should offset horizontally */
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div id="fb-root"></div>
    <script language="javascript" type="text/javascript">
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
            <asp:Panel ID="pnlAdditionalImages" runat="server" Visible="false" CssClass="imagecolumn">
                <asp:Literal ID="litAdditionalImages" runat="server" Mode="PassThrough"></asp:Literal>
            </asp:Panel>
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
            <div style="border-width: 0px; border-bottom: 1px solid #000; border-top: 1px solid #000; padding: 5px; margin: 5px 0px; background-color: #fff;">
                <style type="text/css">
                    table
                    {
                        border-collapse:collapse;
                    }
                    table,th, td
                    {
                        border: 1px solid white;
                    }
                </style>
                <table>
                    <tr>
                        <td><asp:HiddenField ID="hdfOptionBvin" runat="server" /></td>
                        <td><asp:DropDownList ID="ddlOptions" runat="server" Visible="false" Width="200px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td><strong>Quantity</strong></td>
                        <td>
                            <asp:DropDownList ID="ddlQuantity" runat="server" Width="200px">
                                <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                <asp:ListItem Value="5" Text="5"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="button cube deep-red small" OnClick="lnkAddToCart_Click">Add To Cart</asp:LinkButton></td>
                    </tr>
                </table>
            </div>
            <p>
				<asp:Literal ID="litLongDescription" runat="server"></asp:Literal>
			</p>
                        
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
    
    <div class="modal2">
        <div class="popoverframe2">
            <a id="dialogclose" href="#">Close</a><br />
            <iframe id="popoverpage2"></iframe>
            <br />
            <a id="dialogclose2" href="#">Close</a>
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

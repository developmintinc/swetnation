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
        <asp:Panel ID="pnlBurton" runat="server" CssClass="one product-intro" ClientIDMode="Static">
            <div class="one-third">
                <img src="images/products/intro/burton/burton01.jpg" alt="Burton Snowboards" width="300px" />
		    </div>
            <div class="one-half last">
			    <div class="header-title white">BURTON</div>
                <p>
                    Burton Snowboards is a manufacturer of snowboards.Founded by Jake Burton Carpenter in 1977, 
                    the company specializes in a product line aimed at snowboarders: snowboards, bindings, boots, 
                    outerwear, and accessories. The company's flagship store is in Burlington, Vermont.
                </p>
			    <p>
			        Burton built the world's first snowboard factory. It is the largest snowboard brand in the 
                    world. Burton products are marketed worldwide in over 4,348 stores; 1,536 of those stores are 
                    located in the United States. In 2003 Burton allowed several online companies to sell Burton 
                    products over the internet.
			    </p>
		    </div>
        </asp:Panel>
        <asp:Panel ID="pnlLululemon" runat="server" CssClass="one product-intro" ClientIDMode="Static">
            <div class="one-third">
                <img src="images/products/intro/lululemon/lululemon04.jpg" alt="lululemon athletica" width="300px" />
		    </div>
            <div class="one-half last">
			    <div class="header-title white">LULULEMON</div>
                <p>
                    Lululemon Athletica, styled as lululemon athletica, is a self-described yoga-inspired athletic 
                    apparel company, which produces a clothing line and runs international clothing stores from its 
                    company base in Vancouver, British Columbia, Canada.
                </p>
			    <p>
                    Dennis "Chip" Wilson founded Lululemon Athletica (usually referred to simply as "lululemon" or 
                    "lulu") in 1998 in response to increased female participation in sports and in accordance with 
                    his belief in yoga as the optimal way to maintain athletic excellence into an advanced age. 
                </p>
                <p>
                    Wilson had previously made a foray into the sportswear business by setting up Westbeach Sports in 1979. 
                    Wilson opened the first Lululemon store in the Vancouver neighbourhood of Kitsilano.
			    </p>
		    </div>
        </asp:Panel>
        <asp:Panel ID="pnlNike" runat="server" CssClass="one product-intro" ClientIDMode="Static">
            <div class="one-third">
                <img src="images/products/intro/nike/nike04.jpg" alt="Nike" width="300px" />
		    </div>
            <div class="one-half last">
			    <div class="header-title white">NIKE</div>
			    <p>
			        Nike is a major publicly traded clothing, footwear, sportswear, and equipment supplier based in the 
                    United States. The company is headquartered near Beaverton, Oregon, in the Portland metropolitan 
                    area. It is the world's leading supplier of athletic shoes and apparel and a major manufacturer of 
                    sports equipment.
			    </p>
                <p>
                    The company was founded on January 25, 1964 as Blue Ribbon Sports by Bill Bowerman and Philip Knight, and 
                    officially became Nike, Inc.
                </p>
		    </div>
        </asp:Panel>
        <asp:Panel ID="pnlSpecialized" runat="server" CssClass="one product-intro" ClientIDMode="Static">
            <div class="one-third">
                <img src="images/products/intro/specialized/specialized07.jpg" alt="Specialized" width="300px" />
		    </div>
            <div class="one-half last">
			    <div class="header-title white">SPECIALIZED</div>
			    <p>
			        Specialized was founded in 1974 by Mike Sinyard, a cycling enthusiast who sold his Volkswagen Bus 
                    for $1,500 to fund a cycle tour of Europe, where he bought handlebars and stems made by Campagnolo and 
                    Cinelli to take back to the US. 
                </p>
                <p>
                    Sinyard started out importing Italian bike components that were 
                    difficult to find in the United States, but the company began to produce its own bike parts by 1976, 
                    starting with the Specialized Touring Tire.
                </p>
                <p>
                    In 1979, the company started to produce the Allez, a road 
                    bike, in Japan. Specialized introduced the first major production mountain bike in the world, the 
                    Stumpjumper, in 1981. Specialized continue to produce the Stumpjumper, which, like mountain bikes 
                    in general, has evolved significantly since 1981 and now comes in full suspension.                     
			    </p>
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
					    <asp:LinkButton ID="lnkAddtoCart" runat="server" CssClass="button cube deep-red small" CommandName="AddToCart" CommandArgument='<%# Eval("Bvin") %>'>Add To Cart</asp:LinkButton>
                    </div>
                    <div><strong><%# Eval("ProductName") %></strong></div>
                    <div>
                        <strong style="text-decoration:line-through;">Retail Price: <%# String.Format("{0:C}", Eval("SitePrice"))%></strong> | 
                        <strong style="color:Red;">Members Price: <%# String.Format("{0:C}", Eval("SiteCost"))%></strong>                        
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





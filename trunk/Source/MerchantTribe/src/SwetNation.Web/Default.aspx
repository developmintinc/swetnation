<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SwetNation.Web.Index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHeadContent" runat="Server">
    <!--[if IE]>
        <link rel="stylesheet" type="text/css" href="css/ie.css" />
    <![endif]-->
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBodyContent" runat="Server">
    <div id="content">
        <div class="one">
            <div class="intro-pages">
                <h3>
                    Sports Brands | Members Prices | $7.98 Shipping
                </h3>
            </div>
        </div>
        <div class="featuredbrands">
            <br />
            <asp:ListView ID="lstFeaturedBrands" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <a href='Products.aspx?ManufacturerId=<%# Eval("Bvin") %>'>
                        <div class="image">
                            <img src='https://swetnation.com/shop/images/sites/1/manufacturers/<%# Eval("Bvin") %>/medium/<%# Eval("ImageFileSmall") %>' border="0" alt="<%# Eval("DisplayName") %>" />
                            <h2>
                                <span>
                                    <%# ConvertSaleEndDateToString(Eval("DisplayName").ToString().ToUpper(), Convert.ToDateTime(Eval("SaleEnds"))) %>
                                </span>
                            </h2>
                        </div>
                    </a>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <a href='Products.aspx?ManufacturerId=<%# Eval("Bvin") %>'>
                        <div class="image last">
                            <img src='https://swetnation.com/shop/images/sites/1/manufacturers/<%# Eval("Bvin") %>/medium/<%# Eval("ImageFileSmall") %>' border="0" alt="<%# Eval("DisplayName") %>" />
                            <h2>
                                <span>
                                    <!--<span class='spacer'></span><br /><span class='spacer'></span>-->
                                    <%# ConvertSaleEndDateToString(Eval("DisplayName").ToString().ToUpper(), Convert.ToDateTime(Eval("SaleEnds"))) %>
                                </span>
                            </h2>
                        </div>
                    </a>
                </AlternatingItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

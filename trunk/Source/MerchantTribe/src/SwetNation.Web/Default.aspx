<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SwetNation.Web.Index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHeadContent" runat="Server">
    <style type="text/css">
        /* Featured Brand */
        .featuredbrands {padding:0;}
        .featuredbrands .record {float:left;margin:10px 0 20px 6px;height:280px;background-color:#f4eeed;}
        
        /* Category Product Display Defaults */
        .record {width:220px;margin:0px 14px 20px 0;float:left;border:solid 1px #f5f0ef;border-width: 1px 3px 3px 1px;background:#f4eeed;}
        .record a {color:#7a271e;text-decoration:none;}
        .record a:hover {color:#7a271e;text-decoration:underline;}
        .firstrecord {clear:both;}
        .lastrecord {margin-right:0;}

        .recordimage {text-align: left;border-bottom:solid 3px #caa6a5;background:#fff;}
        .recordname {padding:0 0 0 10px;font-size: 16px;color:#7a271e;font-weight:bold;text-align:center;line-height:1.5em;}
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainBodyContent" runat="Server">
    <div id="content">
        <div class="one">
            <div class="intro-pages">
                <h3>
                    Welcome to <span class="colored">SwetNation</span>, We provide sports apparel at
                    discounts up to 70% from Burton to Nike.</h3>
            </div>
        </div>

        <div class="featuredbrands">
            <asp:ListView ID="lstFeaturedBrands" runat="server">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>

                    <div class="record">
                        <div class="recordimage">
                            <a href='Products.aspx?ManufacturerId=<%# Eval("Bvin") %>'>
                                <img src='https://swetnation.com/shop/images/sites/1/manufacturers/<%# Eval("Bvin") %>/small/<%# Eval("ImageFileSmall") %>' border="0" alt="<%# Eval("DisplayName") %>" />
                            </a>
                        </div>
                        <div class="recordname">
                            <a href='Products.aspx?Bvin=<%# Eval("Bvin") %>'><%# Eval("DisplayName") %></a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>

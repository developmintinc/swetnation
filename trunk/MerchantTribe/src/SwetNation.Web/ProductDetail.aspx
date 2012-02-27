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
			<h4><asp:Literal ID="litProductNameContent" runat="server"></asp:Literal> <span style="color:Maroon; font-weight: bold;;"><asp:Literal ID="litSalePriceContent" runat="server"></asp:Literal></span></h4>
			<p>
                Retail Price <span class="fullprice"><asp:Literal ID="litListPriceContent" runat="server"></asp:Literal></span>
            </p>
            <p>
				<asp:Literal ID="litLongDescription" runat="server"></asp:Literal>
			</p>
			<a href="#" class="button cube green small">Buy This Item</a>
		</div>
	</div>
    <div class="horizontal-line">
	</div>
	<div class="one">
		<div class="one-fourth">
			<ul class="round-list">
				<li>Site Redesign</li>
				<li>Custom CMS Developmet</li>
				<li>Custom Booking System</li>
				<li>SEO Optimization</li>
				<li>Our Web Hosting Solution</li>
			</ul>
		</div>
		<div class="one-fourth">
			<ul class="round-list">
				<li>Site Redesign</li>
				<li>Custom CMS Developmet</li>
				<li>Custom Booking System</li>
				<li>SEO Optimization</li>
				<li>Our Web Hosting Solution</li>
			</ul>
		</div>
		<div class="one-fourth">
			<ul class="round-list">
				<li>Site Redesign</li>
				<li>Custom CMS Developmet</li>
				<li>Custom Booking System</li>
				<li>SEO Optimization</li>
				<li>Our Web Hosting Solution</li>
			</ul>
		</div>
		<div class="one-fourth last">
			<ul class="round-list">
				<li>Site Redesign</li>
				<li>Custom CMS Developmet</li>
				<li>Custom Booking System</li>
				<li>SEO Optimization</li>
				<li>Our Web Hosting Solution</li>
			</ul>
		</div>
	</div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="SwetNation.Web.AboutUs" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/LeftSidebarNav.ascx" TagName="LeftSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="About Us" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" AboutUsSelected="current" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">    
	<div class="one-fourth">
		<!-- COLUMN STARTS-->
		<img src="images/icons/content/idea.png" alt=" " class="img-align-left" width="66" height="66"/>
		<h4>Our Vision</h4>
		<p>
		    Lorem ipsum dolor sit amet, tollite fit manibus individuationis omnibus civitas ad quia. Quaere allocutus ait regem ut sua etiam quantitas non solutionem invenisti.
		</p>
		<br/>
		<ul class="round-list">
			<li>Site Redesign</li>
			<li>Custom CMS Developmet</li>
			<li>Custom Booking System</li>
			<li>SEO Optimization</li>
			<li>Our Web Hosting Solution</li>
		</ul>
	</div>
	<!-- COLUMN ENDS-->
	<div class="one-fourth">
		<!-- COLUMN STARTS-->
		<img src="images/icons/content/check-box-big.png" alt=" " class="img-align-left" width="66" height="66"/>
		<h4>Our Team</h4>
		<p>
				Lorem ipsum dolor sit amet, tollite fit manibus individuationis omnibus civitas ad quia. Quaere allocutus ait regem ut sua etiam quantitas non solutionem invenisti.
		</p>
		<br/>
		<ul class="round-list">
			<li>Site Redesign</li>
			<li>Custom CMS Developmet</li>
			<li>Custom Booking System</li>
			<li>SEO Optimization</li>
			<li>Our Web Hosting Solution</li>
		</ul>
	</div>
	<!-- COLUMN ENDS-->
	<div class="one-fourth last">
		<!-- COLUMN STARTS-->
		<img src="images/icons/content/display.png" alt=" " class="img-align-left" width="66" height="66"/>
		<h4>How to Apply?</h4>
		<p>
				Lorem ipsum dolor sit amet, tollite fit manibus individuationis omnibus civitas ad quia. Quaere allocutus ait regem ut sua etiam quantitas non solutionem invenisti.
		</p>
		<br/>
		<ul class="round-list">
			<li>Site Redesign</li>
			<li>Custom CMS Developmet</li>
			<li>Custom Booking System</li>
			<li>SEO Optimization</li>
			<li>Our Web Hosting Solution</li>
		</ul>
	</div>
	<p>
		Iuraveras magnifice ex auxilium super color est cum. Ripae simul navigat est amet constanter approximavit te.Iuraveras magnifice ex auxilium super color est cum. Ripae simul navigat est amet constanter approximavit te.Iuraveras magnifice ex auxilium super color est cum. Ripae simul navigat est amet constanter approximavit te.Iuraveras magnifice ex auxilium super color est cum. Ripae simul navigat est amet constanter approximavit te.
	</p>
</asp:Content>

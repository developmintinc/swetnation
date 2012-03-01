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
		<h4>Who We Are</h4>
		<p>
			Swet Nation was created by sporting enthusiasts for sporting enthusiasts. 
        </p>
        <p>
            We understand the importance of staying healthy, fit and active while also realizing that doing 
            so can be extremely costly.
        </p>
        <p>
            Our mission is to offer the best solution for sports enthusiasts, athletes and the every day person to
            purchase high quality athletic products at the lowest possible prices.
		</p>
        <p>
            The bottom line: to provide a no SWET shopping experience.
        </p>
	</div>
	<!-- COLUMN ENDS-->
	<div class="one-fourth">
		<!-- COLUMN STARTS-->
		<img src="images/icons/content/check-box-big.png" alt=" " class="img-align-left" width="66" height="66"/>
		<h4>What We Do</h4>
		<p>
		    On a weekly basis, we host sales for exclusive sporting and outdoor brands offering discounts of up to
            70% below retail.  
		</p>
        <p>
            Sales are timed and will last from 72 hours up to 1 week long.
        </p>
        <p>
            Only our members will have exclusive access to these sales. Request your FREE membership today!
        </p>
        <p>
            Items are limited and sold on a first come first serve basis, so be sure to log on early before items are
            sold out.
        </p>
	</div>
	<!-- COLUMN ENDS-->
	<div class="one-fourth last">
		<!-- COLUMN STARTS-->
		<img src="images/icons/content/display.png" alt=" " class="img-align-left" width="66" height="66"/>
		<h4>Be A Member</h4>
		<p>
            Becoming a Swet Nation member is easy. Join today for FREE by filling out the online form: Name,
            Email, Gender and Password.
        </p>
        <p>
            You can also invite friends by clicking the invite button and sending out e-invites or through posting your
            personal URL link on Facebook, Twitter, etc. 
        </p>
        <p>
            Once your referral’s first order has shipped we will thank you with a $10 credit – there is NO LIMIT to 
            the amount of credits you can receive!
        </p>
	</div>
</asp:Content>

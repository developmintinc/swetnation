<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimaryNav.ascx.cs" Inherits="SwetNation.Web.controls.PrimaryNav" %>
<div id="main_navigation" class="main-menu ">
    <!--  MAIN  NAVIGATION STARTS HERE-->
    <ul>
	    <li><a href="Default.aspx" title="Home">Home<span>Your Homepage</span></a></li>
	    <li><a href="#">About Us<span>Learn Something Kid</span></a></li>
	    <li>
            <a href="#">Products<span>Browse By Category</span></a>
            <asp:Literal ID="litProductNavigation" runat="server" Mode="PassThrough"></asp:Literal>	        
	    </li>
	    <li><a href="ContactUs.aspx">Contact Us<span>We Work 24/7 Son</span></a></li>		    
	    <li><a href="OurServices.aspx">Our Services<span>Read Our Services Dude</span></a></li>
	    <li><a href="InviteFriend.aspx">Invite A Friend<span>Tell Everyone You Know</span></a></li>
    </ul>
</div>
<!-- MAIN NAVIGATION ENDS-->
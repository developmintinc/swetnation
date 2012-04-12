<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimaryNav.ascx.cs" Inherits="SwetNation.Web.controls.PrimaryNav" %>
<div id="main_navigation" class="main-menu">
	<!--  MAIN  NAVIGATION STARTS HERE-->
	<ul>
		<li><a href="Default.aspx" title="Home">BRANDS<span>Current</span></a></li>
        <asp:Literal ID="litNavigation" runat="server" Mode="PassThrough"></asp:Literal>        
        <li class="no-right-border" style="border-right: 0px solid black !important;">
            <asp:HyperLink ID="hypCart" runat="server" NavigateUrl="~/Cart.aspx">
                <img src="images/icons/shopping-carts/03-shopping-cart.png" width="40px" />
            </asp:HyperLink>
        </li>
	</ul>
</div>
<!-- MAIN NAVIGATION ENDS-->
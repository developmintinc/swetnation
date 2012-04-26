<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyAccountNav.ascx.cs" Inherits="SwetNation.Web.controls.MyAccountNav" %>
<ul class="simple-nav">
	<li class="<%= this.MyAccountSelected %>"><a href="MyAccount.aspx" class="<%= this.MyAccountSelected %>">My Profile</a></li>
	<li class="<%= this.PastOrdersSelected %>"><a href="PastOrders.aspx" class="<%= this.PastOrdersSelected %>">Past Orders</a></li>
	<li class="<%= this.SavedItemsSelected %>"><a href="SavedItems.aspx" class="<%= this.SavedItemsSelected %>">Saved Items</a></li>
	<li class="<%= this.ChangePasswordSelected %>"><a href="ChangePassword.aspx" class="<%= this.ChangePasswordSelected %>">Change Password</a></li>
	<li class="<%= this.ChangeEmailSelected %>"><a href="ChangeEmail.aspx" class="<%= this.ChangeEmailSelected %>">Change Email</a></li>
	<li class="<%= this.SignOutSelected %>"><a href="SignOut.aspx" class="<%= this.SignOutSelected %>">Sign Out</a></li>
</ul>
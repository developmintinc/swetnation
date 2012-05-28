<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyAccountNav.ascx.cs" Inherits="SwetNation.Web.controls.MyAccountNav" %>
<ul class="simple-nav">
	<li class="<%= this.MyProfileSelected %>"><a href="MyProfile.aspx" class="<%= this.MyProfileSelected %>">My Profile</a></li>
	<li class="<%= this.PastOrdersSelected %>"><a href="PastOrders.aspx" class="<%= this.PastOrdersSelected %>">My Orders</a></li>
	<li class="<%= this.InviteFriendSelected %>"><a href="InviteFriend.aspx" class="<%= this.InviteFriendSelected %>">Invite Friend</a></li>
	<li class="<%= this.ChangePasswordSelected %>"><a href="ChangePassword.aspx" class="<%= this.ChangePasswordSelected %>">Change Password</a></li>
</ul>
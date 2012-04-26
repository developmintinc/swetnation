<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RightSidebarNav.ascx.cs" Inherits="SwetNation.Web.controls.RightSidebarNav" %>
<ul class="simple-nav">
	<li class="<%= this.InviteFriendSelected %>"><a href="InviteFriend.aspx" class="<%= this.InviteFriendSelected %>">Invite Friend</a></li>
	<li class="<%= this.ReturnPolicySelected %>"><a href="ReturnPolicy.aspx" class="<%= this.ReturnPolicySelected %>">Return Policy</a></li>
	<li class="<%= this.CustomerServiceSelected %>"><a href="CustomerService.aspx" class="<%= this.CustomerServiceSelected %>">Customer Service</a></li>
	<li class="<%= this.PrivacyPolicySelected %>"><a href="PrivacyPolicy.aspx" class="<%= this.PrivacyPolicySelected %>">Privacy Policy</a></li>
	<li class="<%= this.TermsOfUseSelected %>"><a href="TermsOfUse.aspx" class="<%= this.TermsOfUseSelected %>">Terms of Use</a></li>
	<li class="<%= this.GiftCardSelected %>"><a href="GiftCard.aspx" class="<%= this.GiftCardSelected %>">Gift Card</a></li>
</ul>
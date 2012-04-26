<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalProfileLinks.ascx.cs" Inherits="SwetNation.Web.controls.PersonalProfileLinks" %>
<fieldset class="header-search">
    <div>
        <span class="search-input-header-placeholder white"><asp:Literal ID="litMemberName" runat="server" Mode="PassThrough"></asp:Literal></span> - 
        <a href="MyAccount.aspx"><span class="search-input-header-placeholder white">My Account</span></a> - 
        <a href="InviteFriend.aspx"><span class="search-input-header-placeholder white">Invite a Friend, Get $10</span></a>
    </div>    
</fieldset>
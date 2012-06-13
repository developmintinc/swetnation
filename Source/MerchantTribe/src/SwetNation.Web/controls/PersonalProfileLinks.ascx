<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalProfileLinks.ascx.cs" Inherits="SwetNation.Web.controls.PersonalProfileLinks" %>
<fieldset class="header-search">
    <div style="padding: 5px;">
        <asp:Literal ID="litMemberName" runat="server" Mode="PassThrough"></asp:Literal> - 
        <a href="MyProfile.aspx" class="white">My Profile</a>
        <!--
            -
            <a href="InviteFriend.aspx" class="white">Invite a Friend, Get $10</a>
        -->
    </div>    
</fieldset>
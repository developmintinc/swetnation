<%@ Page Title="Swet Nation - Change Password" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SwetNation.Web.ChangePassword" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Change Password" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">Change Password</div>
        <fieldset>
            <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtNewPassword">New Password <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtNewPassword" runat="server" ValidationGroup="vgChangePassword" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ErrorMessage="Required" ControlToValidate="txtNewPassword" Display="Dynamic" ValidationGroup="vgChangePassword" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblCurrentPassword" runat="server" AssociatedControlID="txtCurrentPassword">Current Password <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtCurrentPassword" runat="server" ValidationGroup="vgChangePassword" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server" ErrorMessage="Required" ControlToValidate="txtCurrentPassword" Display="Dynamic" ValidationGroup="vgChangePassword" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <br/>
		<fieldset>
            <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="lnkUpdate_Click" Text="Update" ValidationGroup="vgChangePassword" CssClass="button round big black"></asp:LinkButton>            
		</fieldset>
        <fieldset>
            <br />
            <%= Session["messages"] %>
        </fieldset>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" ChangePasswordSelected="current"></uc:MyAccountNav>
</asp:Content>

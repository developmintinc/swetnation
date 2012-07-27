<%@ Page Title="Swet Nation - Change Email" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="ChangeEmail.aspx.cs" Inherits="SwetNation.Web.ChangeEmail" %>
<%@ OutputCache Duration="3600" VaryByParam="None" Location="Client" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Change Email" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">Change Email</div>
        <fieldset>
            <asp:Label ID="lblNewEmail" runat="server" AssociatedControlID="txtNewEmail">New Email <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtNewEmail" runat="server" ValidationGroup="vgChangeEmail" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNewEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtNewEmail" Display="Dynamic" ValidationGroup="vgChangeEmail" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblCurrentPassword" runat="server" AssociatedControlID="txtCurrentPassword">Current Password <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtCurrentPassword" runat="server" ValidationGroup="vgChangeEmail" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server" ErrorMessage="Required" ControlToValidate="txtCurrentPassword" Display="Dynamic" ValidationGroup="vgChangeEmail" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <br/>
		<fieldset>
            <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="lnkUpdate_Click" Text="Update" ValidationGroup="vgChangeEmail" CssClass="button round big black"></asp:LinkButton>
		</fieldset>
        <fieldset>
            <br />
            <%= Session["messages"] %>
        </fieldset>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" ChangeEmailSelected="current"></uc:MyAccountNav>
</asp:Content>

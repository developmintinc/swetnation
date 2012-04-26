<%@ Page Title="Swet Nation - My Account" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="SwetNation.Web.MyAccount" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="My Account" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">My Account</div>
        <fieldset>
            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName">First Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Required" ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName">Last Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Required" ControlToValidate="txtLastName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblAddress1" runat="server" AssociatedControlID="txtAddress1">Address <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtAddress1" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ErrorMessage="Required" ControlToValidate="txtAddress1" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblAddress2" runat="server" AssociatedControlID="txtAddress2">Address 2</asp:Label>
            <asp:TextBox ID="txtAddress2" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblCity" runat="server" AssociatedControlID="txtCity">City <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Required" ControlToValidate="txtCity" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblState" runat="server" AssociatedControlID="txtState">State <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtState" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="Required" ControlToValidate="txtState" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblPostalCode" runat="server" AssociatedControlID="txtPostalCode">Postal Code <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtPostalCode" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ErrorMessage="Required" ControlToValidate="txtCity" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone">Phone <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="Required" ControlToValidate="txtPhone" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<br/>
		<fieldset>
            <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="lnkUpdate_Click" Text="Update" ValidationGroup="vgMyAccount" CssClass="button round big black"></asp:LinkButton>
            <asp:HiddenField ID="hfdAddressBvin" runat="server" />
		</fieldset>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" MyAccountSelected="current"></uc:MyAccountNav>
</asp:Content>
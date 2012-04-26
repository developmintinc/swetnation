<%@ Page Title="Swet Nation - Sign Out" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="SignOut.aspx.cs" Inherits="SwetNation.Web.SignOut" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Sign Out" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">Sign Out</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" SignOutSelected="current"></uc:MyAccountNav>
</asp:Content>

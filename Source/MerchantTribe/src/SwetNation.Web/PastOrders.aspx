<%@ Page Title="Swet Nation - Past Orders" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="PastOrders.aspx.cs" Inherits="SwetNation.Web.PastOrders" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="My Orders" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">My Orders</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" PastOrdersSelected="current"></uc:MyAccountNav>
</asp:Content>

<%@ Page Title="Swet Nation Return Policy" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="ReturnPolicy.aspx.cs" Inherits="SwetNation.Web.ReturnPolicy" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/RightSidebarNav.ascx" TagName="RightSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Return Policy" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div class="header-title-medium">RETURNS:</div>
    <p>
        We at Swet Nation take the time to research and offer amazing sports products to our members.  We always want to be sure that our members are satisfied with their purchases.  In the event that you are not 100% satisfied, we will happily accept returns on eligible items.  Approved returns will be credited in the form of a <u>merchandise credit</u> which will be applied to your account.  PLEASE NOTE: Items must be unused, unworn, in original packaging and will all original product tags attached.
    </p>
    <p>
        To initiate a return, please email <a href="mailto:support@swetnation.com">support@swetnation.com</a> with the order number, item in which you wish to return, reason for return and we will process the return in the timely manner.
    </p>

    <div class="header-title-medium">EXCHANGES:</div>
    <p>
        Swet Nation offers superior sports brands at members-only pricing.  Our sale events only last for a limited time, therefore, once an event ends, merchandise is no longer available and we are unable to process exchanges.  If you are not satisfied with your purchase, please feel free to initiate a return.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:RightSidebarNav ID="ucLeftSidebarNav" runat="server" ReturnPolicySelected="current" />
</asp:Content>

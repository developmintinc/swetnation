<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="JobOpportunities.aspx.cs" Inherits="SwetNation.Web.JobOpportunities" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/LeftSidebarNav.ascx" TagName="LeftSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Job Opportunities" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" JobOpportunitiesSelected="current" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <div class="header-title-medium">JOB OPPORTUNITIES</div>
    <p>
        Swet Nation was created for athletes by athletes.  We are always looking to expand our team with 
        individuals who are passionate about fitness, health, wellness, athletics, the outdoors and any 
        or all of the above.
    </p>
    <p>
        For information on career opportunities or internships at Swet Nation, please email your resume 
        to us: <a href="mailto:careers@swetnation.com">careers@swetnation.com</a>
    </p>
</asp:Content>

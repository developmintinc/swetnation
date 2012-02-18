<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="OurServices.aspx.cs" Inherits="SwetNation.Web.OurServices" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/LeftSidebarNav.ascx" TagName="LeftSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" Runat="Server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Our Services" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" Runat="Server">
    <uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" OurServicesSelected="current" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" Runat="Server">
    <h3>SWET NATION SERVICE LIST</h3>
    <ul id="accordion-menu">
		<li>
		    <div>How To Install This Template</div>
		    <ul>
			    <li>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			    </li>
		    </ul>
		</li>
		<li>
		    <div>How To Change Color Style</div>
		    <ul>
			    <li>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			    </li>
		    </ul>
		</li>
		<li>
		    <div>Using Contact From</div>
		    <ul>
			    <li>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			    </li>
		    </ul>
		</li>
        <li>
		    <div>Using Contact From</div>
		    <ul>
			    <li>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			        <p>
				        Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt Lorem ipsum dolor sit amet, consectetur adipisicing consectetur incididunt.
			        </p>
			    </li>
		    </ul>
		</li>
	</ul>
</asp:Content>
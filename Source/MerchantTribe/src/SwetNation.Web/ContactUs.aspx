<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SwetNation.Web.ContactUs" %>
<%@ OutputCache Duration="3600" VaryByParam="None" Location="Client" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="LeftSidebarNav" Src="~/controls/LeftSidebarNav.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Contact Us" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" ContactUsSelected="current" />
    <br />
    <h4>CONTACT US</h4>
	<p>
        Swet Nation LLC<br />
        49 Lincoln Bvld PMB#121<br />
        Abington, MA 02351<br />
        Email: <a href="mailto:support@swetnation.com">support@swetnation.com</a><br />
        Phone: 888.850.SWET (7938)<br />
	</p>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <div class="header-title-medium">CONTACT US</div>
	<p>
		Questions? Comments? Suggestions? Want to request a brand?
	</p>
    <p>
        <%= Session["messages"] %>
    </p>
	<div id="contact-form">
		<div class="one-third-big">
			<fieldset>
				<label>Name <span class="required">*</span></label>
                <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Required" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
			</fieldset>
		</div>
		<div class="one-third-big last">
			<fieldset>
				<label>Email <span class="required">*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
			</fieldset>
		</div>
		<div class="inner-content">
		    <fieldset>
			    <label>Your Message <span class="required">*</span></label>
                <asp:TextBox ID="txtMessage" runat="server" Width="620" Height="200" TextMode="MultiLine"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Required" ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
		    </fieldset>
		</div>
		<div class="inner-content">
		    <fieldset>
                <asp:Button ID="btnContactUs" runat="server" Text="Send Message" CssClass="button round big deep-red" OnClick="btnContactUs_Click" />
		    </fieldset>
		</div>
	</div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SwetNation.Web.ContactUs" %>
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
        49 Lincoln Blvd.<br />
        Abington, MA 02351<br />
        support@swetnation.com<br />
        888-888-8888<br />
	</p>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
	<p>
		Questions? Comments? Suggestions? Want to request a brand?
	</p>
	<div id="contact-form">
		<div class="one-third-big">
			<fieldset>
				<label>Name <span class="required">*</span></label>
				<input type="text" name="name" id="Myname" value="" class="text requiredField"/>
			</fieldset>
		</div>
		<div class="one-third-big last">
			<fieldset>
				<label>Email <span class="required">*</span></label>
				<input type="text" name="email" id="myemail" value="" class="text requiredField email"/>
			</fieldset>
		</div>
		<div class="one-third-big">
			<fieldset>
				<label>Subject <span class="required">*</span></label>
				<input type="text" name="subject" id="mySubject" value="" class="text requiredField subject"/>
			</fieldset>
		</div>
		<div class="one-third-big last">
			<fieldset>
				<label>Budget <span class="required">*</span></label>
				<input type="text" name="budget" id="myBudget" value="" class="text requiredField subject"/>
			</fieldset>
		</div>
		<div class="inner-content">
		<fieldset>
			<label>Your Message <span class="required">*</span></label>
			<textarea name="message" id="Mymessage" rows="20" cols="30" class="text requiredField"></textarea>
		</fieldset>
		</div>
		<div class="inner-content">
		<fieldset>
			<input name="Mysubmitted" id="Mysubmitted" value="Send Message" class="button cube small blue" type="submit"/>
		</fieldset>
		</div>
	</div>
</asp:Content>

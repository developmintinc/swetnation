<%@ Page Title="" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SwetNation.Web.ContactUs" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="LeftSidebarNav" Src="~/controls/LeftSidebarNav.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Contact Us" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <span class="colored">SIMPLE CREATIVE TEMPLATE</span>
	<p>
		Arripuit plorabis filiam vel regio hinc indica enim materiam. Crede respiciens forsitan Apollonius ut libertatem accipies. Addicitur quid populi civitatis ne videret famis perisse naufrago in lucem in modo genito in lucem exitum atque album Apolloni sed.
	</p>
	<h4>Category</h4>
	<uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" ContactUsSelected="current" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
	<div class="contact-map-holder">
		<iframe width="700" height="165" src="http://maps.google.com/maps?f=d&amp;hl=en&amp;geocode=&amp;saddr=Perth&amp;daddr=-12.554564,130.869141+to:Bishop+Dr+%40-27.371780,+153.185980+to:Wanganderry+Rd+%40-34.310430,+150.262350+to:Unknown+road+%40-37.993930,+144.580460+to:Fremantle&amp;mrcr=0,1&amp;mrsp=1&amp;sz=4&amp;mra=dme&amp;sll=-24.20689,136.582031&amp;sspn=47.972215,66.708984&amp;ie=UTF8&amp;om=1&amp;s=AARTsJrOrTNCi3R5hglWCxsahY3qKUX7Ig&amp;ll=-24.20689,136.582031&amp;spn=46.989399,52.734375&amp;z=3&amp;output=embed">
		</iframe>
	</div>
	<p>
			Arripuit plorabis filiam vel regio hinc indica enim materiam. Crede respiciens forsitan Apollonius ut libertatem accipies. Addicitur quid populi civitatis ne videret famis perisse naufrago.
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

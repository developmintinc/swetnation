<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftSidebarNav.ascx.cs" Inherits="SwetNation.Web.controls.LeftSidebarNav" %>
<ul class="simple-nav">
	<li class="<%= this.AboutUsSelected %>"><a href="AboutUs.aspx" class="<%= this.AboutUsSelected %>">About Us</a></li>
	<li class="<%= this.ContactUsSelected %>"><a href="ContactUs.aspx" class="<%= this.ContactUsSelected %>">Contact Us</a></li>
	<li class="<%= this.JobOpportunitiesSelected %>"><a href="JobOpportunities.aspx" class="<%= this.JobOpportunitiesSelected %>">Job Opportunities</a></li>
	<li class="<%= this.FAQSelected %>"><a href="FAQ.aspx" class="<%= this.FAQSelected %>">F.A.Q</a></li>
</ul>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftSidebarNav.ascx.cs" Inherits="SwetNation.Web.controls.LeftSidebarNav" %>
<ul class="simple-nav">
	<li><a href="AboutUs.aspx" class="<%= this.AboutUsSelected %>">About Us</a></li>
	<li><a href="ContactUs.aspx" class="<%= this.ContactUsSelected %>">Contact Us</a></li>
	<li><a href="OurServices.aspx" class="<%= this.OurServicesSelected %>">Our Services</a></li>
	<li><a href="OurTeam.aspx" class="<%= this.OurTeamSelected %>">Our Team</a></li>
	<li><a href="ClientTestimonials.aspx" class="<%= this.ClientTestimonialsSelected %>">Clients Testimonials</a></li>
	<li><a href="JobOpportunities.aspx" class="<%= this.JobOpportunitiesSelected %>">Job Opportunities</a></li>
	<li><a href="FAQ.aspx" class="<%= this.FAQSelected %>">F.A.Q</a></li>
</ul>
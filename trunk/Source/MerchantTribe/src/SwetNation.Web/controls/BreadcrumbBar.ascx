 <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BreadcrumbBar.ascx.cs" Inherits="SwetNation.Web.controls.Breadcrumbs" %>
<!-- INTRO STARTS -->
<div class="inner-pages">
	<div class="page-title">
		<div class="header-title white"><%= this.PageName %></div>
	</div>
	<fieldset class="search-place">
        <span class="search-input-placeholder">&nbsp;</span>
		<!-- <input class="search-input" type="text" onblur="if(this.value=='')this.value='Type and hit enter';" onfocus="if(this.value=='Type and hit enter')this.value='';" value="Type and hit enter"/> -->
	</fieldset>
</div>
<!-- INTRO ENDS -->

<!-- BREADCRUMBS STARTS -->
<ul id="breadcrumbs">
	<li><a href="Default.aspx" title="Home">Home </a>&nbsp;
	<li>
	<li> &raquo;&nbsp; <%= this.PageName %></li>
</ul>
<!-- BREADCRUMBS ENDS -->
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BreadcrumbBar.ascx.cs" Inherits="SwetNation.Web.controls.Breadcrumbs" %>
<!-- INTRO STARTS -->
<div class="inner-pages">
	<div class="page-title">
		<h3><%= this.PageName %></h3>
	</div>
	<fieldset class="search-place">
		<input class="search-input" type="text" onblur="if(this.value=='')this.value='Type and hit enter';" onfocus="if(this.value=='Type and hit enter')this.value='';" value="Type and hit enter"/>
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
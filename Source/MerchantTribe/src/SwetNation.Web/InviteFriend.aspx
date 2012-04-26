<%@ Page Title="Swet Nation Invite A Friend" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="InviteFriend.aspx.cs" Inherits="SwetNation.Web.InviteFriend" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/RightSidebarNav.ascx" TagName="RightSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Invite A Friend" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <div class="one">
		<div class="one-third">
			<code>TO:</code>
			<p>
				<asp:TextBox ID="txtTo" runat="server" Width="295px" Height="200px" TextMode="MultiLine" BorderColor="Gray" BorderWidth="2"></asp:TextBox>
			</p>
		</div>
		<div class="one-third last">
			<code>POST INVITES ON FACEBOOK</code>
			<p style=" text-align: center;">
                <br />
				<asp:LinkButton ID="lnkFacebook" runat="server" Text="INVITE FRIENDS" CssClass="button round big deep-red"></asp:LinkButton>
                <br /><br />
                Use this link however you like - on Facebook, Twitter, or anywhere else - and watch your Credits grow<br />
                http://swetnation.com/web/invite/alicia-mccabe
			</p>
		</div>
    </div>
    <div class="one">
		<div class="one-third last">
			<code>MESSAGE</code>
			<p>
				<asp:TextBox ID="txtMessage" runat="server" Width="295px" Height="200px" TextMode="MultiLine" BorderColor="Gray" BorderWidth="2"></asp:TextBox>
			</p>
		</div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <div class="one-fourth last">
        <uc:RightSidebarNav ID="ucLeftSidebarNav" runat="server" InviteFriendSelected="current" />
    </div>
</asp:Content>

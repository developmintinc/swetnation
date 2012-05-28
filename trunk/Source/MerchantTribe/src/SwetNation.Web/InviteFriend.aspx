<%@ Page Title="Swet Nation Invite A Friend" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="InviteFriend.aspx.cs" Inherits="SwetNation.Web.InviteFriend" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="Invite A Friend" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <div class="header-title-medium">INVITE A FRIEND</div>
    <strong>
        Invite your friends! You will receive a $10 credit in your Swet Nation account when their order ships.  Credits expire after one year.
    </strong>
    <p>
        <%= Session["messages"] %>
    </p>
    <div id="contact-form">
        <div class="inner-content">
		    <fieldset>
			    <label>Your Friends Email <span class="required">*</span> (seperate email addresses by semi colon)</label>
                <asp:TextBox ID="txtFriendsEmail" runat="server" Width="700" Height="100" TextMode="MultiLine"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvFriendsEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtFriendsEmail" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
		    </fieldset>
		</div>
		<div class="inner-content">
		    <fieldset>
			    <label>Your Message <span class="required">*</span></label>
                <asp:TextBox ID="txtMessage" runat="server" Width="700" Height="200" TextMode="MultiLine"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Required" ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
		    </fieldset>
		</div>
		<div class="inner-content">
		    <fieldset>
                <asp:Button ID="btnSubmit" runat="server" Text="Send Invite" CssClass="button round big deep-red" OnClick="btnSubmit_Click" />
		    </fieldset>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <div class="one-fourth last">
        <uc:MyAccountNav ID="ucMyAccountNav" runat="server" InviteFriendSelected="current" />
    </div>
</asp:Content>

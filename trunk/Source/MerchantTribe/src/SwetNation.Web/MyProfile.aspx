<%@ Page Title="Swet Nation - My Profile" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="SwetNation.Web.MyProfile" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="My Profile" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">My Profile</div>
        <fieldset>
            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName">First Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Required" ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName">Last Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Required" ControlToValidate="txtLastName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblEmailAddress" runat="server" AssociatedControlID="txtEmailAddress">Email Address</asp:Label>
            <asp:TextBox ID="txtEmailAddress" runat="server" ValidationGroup="vgMyAccount" Width="100%" ReadOnly="true"></asp:TextBox>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone">Phone</asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblDOB" runat="server" AssociatedControlID="txtDOB">Date Of Birth</asp:Label>
            <asp:TextBox ID="txtDOB" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblGender" runat="server" AssociatedControlID="ddlGender">Gender <span class="required">*</span></asp:Label>
            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="vgMyAccount" Width="100%">
                <asp:ListItem Text="-- SELECT --" Value=""></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Required" ControlToValidate="ddlGender" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <br /><br/>

        <div class="header-title-medium">Billing Address</div>        
        <fieldset>
            <asp:Label ID="lblBillingFirstName" runat="server" AssociatedControlID="txtBillingFirstName">First Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtBillingFirstName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingFirstName" runat="server" ErrorMessage="Required" ControlToValidate="txtBillingFirstName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblBillingLastName" runat="server" AssociatedControlID="txtBillingLastName">Last Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtBillingLastName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingLastName" runat="server" ErrorMessage="Required" ControlToValidate="txtBillingLastName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblBillingAddress1" runat="server" AssociatedControlID="txtBillingAddress1">Address <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtBillingAddress1" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingAddress1" runat="server" ErrorMessage="Required" ControlToValidate="txtBillingAddress1" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblBillingAddress2" runat="server" AssociatedControlID="txtBillingAddress2">Address 2</asp:Label>
            <asp:TextBox ID="txtBillingAddress2" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblBillingCity" runat="server" AssociatedControlID="txtBillingCity">City <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtBillingCity" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingCity" runat="server" ErrorMessage="Required" ControlToValidate="txtBillingCity" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblBillingState" runat="server" AssociatedControlID="ddlBillingState">State <span class="required">*</span></asp:Label>
            <asp:DropDownList ID="ddlBillingState" runat="server" ValidationGroup="vgMyAccount" Width="100%">
	            <asp:ListItem Value="AL">Alabama</asp:ListItem>
	            <asp:ListItem Value="AK">Alaska</asp:ListItem>
	            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	            <asp:ListItem Value="CA">California</asp:ListItem>
	            <asp:ListItem Value="CO">Colorado</asp:ListItem>
	            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	            <asp:ListItem Value="DE">Delaware</asp:ListItem>
	            <asp:ListItem Value="FL">Florida</asp:ListItem>
	            <asp:ListItem Value="GA">Georgia</asp:ListItem>
	            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	            <asp:ListItem Value="ID">Idaho</asp:ListItem>
	            <asp:ListItem Value="IL">Illinois</asp:ListItem>
	            <asp:ListItem Value="IN">Indiana</asp:ListItem>
	            <asp:ListItem Value="IA">Iowa</asp:ListItem>
	            <asp:ListItem Value="KS">Kansas</asp:ListItem>
	            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	            <asp:ListItem Value="ME">Maine</asp:ListItem>
	            <asp:ListItem Value="MD">Maryland</asp:ListItem>
	            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	            <asp:ListItem Value="MI">Michigan</asp:ListItem>
	            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	            <asp:ListItem Value="MO">Missouri</asp:ListItem>
	            <asp:ListItem Value="MT">Montana</asp:ListItem>
	            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	            <asp:ListItem Value="NV">Nevada</asp:ListItem>
	            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	            <asp:ListItem Value="NY">New York</asp:ListItem>
	            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	            <asp:ListItem Value="OH">Ohio</asp:ListItem>
	            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	            <asp:ListItem Value="OR">Oregon</asp:ListItem>
	            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	            <asp:ListItem Value="TX">Texas</asp:ListItem>
	            <asp:ListItem Value="UT">Utah</asp:ListItem>
	            <asp:ListItem Value="VT">Vermont</asp:ListItem>
	            <asp:ListItem Value="VA">Virginia</asp:ListItem>
	            <asp:ListItem Value="WA">Washington</asp:ListItem>
	            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBillingState" runat="server" ErrorMessage="Required" ControlToValidate="ddlBillingState" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblBillingPostalCode" runat="server" AssociatedControlID="txtBillingPostalCode">Zip Code <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtBillingPostalCode" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingPostalCode" runat="server" ErrorMessage="Required" ControlToValidate="txtBillingPostalCode" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <br/><br/>

        <div class="header-title-medium">Shipping Address</div>
		<asp:CheckBox ID="chkShippingSame" runat="server" TabIndex="400" OnCheckedChanged="chkShippingSame_CheckedChanged" AutoPostBack="true" Checked="true" /> 
		My shipping address is the same as my billing address
        <fieldset>
            <asp:Label ID="lblShippingFirstName" runat="server" AssociatedControlID="txtShippingFirstName">First Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtShippingFirstName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingFirstName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblShippingLastName" runat="server" AssociatedControlID="txtShippingLastName">Last Name <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtShippingLastName" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingLastName" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblShippingAddress1" runat="server" AssociatedControlID="txtShippingAddress1">Address <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtShippingAddress1" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingAddress1" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblShippingAddress2" runat="server" AssociatedControlID="txtShippingAddress2">Address 2</asp:Label>
            <asp:TextBox ID="txtShippingAddress2" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
		</fieldset>
		<fieldset>
            <asp:Label ID="lblShippingCity" runat="server" AssociatedControlID="txtShippingCity">City <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtShippingCity" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingCity" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblShippingState" runat="server" AssociatedControlID="ddlShippingState">State <span class="required">*</span></asp:Label>
            <asp:DropDownList ID="ddlShippingState" runat="server" ValidationGroup="vgMyAccount" Width="100%">
	            <asp:ListItem Value="AL">Alabama</asp:ListItem>
	            <asp:ListItem Value="AK">Alaska</asp:ListItem>
	            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
	            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
	            <asp:ListItem Value="CA">California</asp:ListItem>
	            <asp:ListItem Value="CO">Colorado</asp:ListItem>
	            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
	            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
	            <asp:ListItem Value="DE">Delaware</asp:ListItem>
	            <asp:ListItem Value="FL">Florida</asp:ListItem>
	            <asp:ListItem Value="GA">Georgia</asp:ListItem>
	            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
	            <asp:ListItem Value="ID">Idaho</asp:ListItem>
	            <asp:ListItem Value="IL">Illinois</asp:ListItem>
	            <asp:ListItem Value="IN">Indiana</asp:ListItem>
	            <asp:ListItem Value="IA">Iowa</asp:ListItem>
	            <asp:ListItem Value="KS">Kansas</asp:ListItem>
	            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
	            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
	            <asp:ListItem Value="ME">Maine</asp:ListItem>
	            <asp:ListItem Value="MD">Maryland</asp:ListItem>
	            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
	            <asp:ListItem Value="MI">Michigan</asp:ListItem>
	            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
	            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
	            <asp:ListItem Value="MO">Missouri</asp:ListItem>
	            <asp:ListItem Value="MT">Montana</asp:ListItem>
	            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
	            <asp:ListItem Value="NV">Nevada</asp:ListItem>
	            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
	            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
	            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
	            <asp:ListItem Value="NY">New York</asp:ListItem>
	            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
	            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
	            <asp:ListItem Value="OH">Ohio</asp:ListItem>
	            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
	            <asp:ListItem Value="OR">Oregon</asp:ListItem>
	            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
	            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
	            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
	            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
	            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
	            <asp:ListItem Value="TX">Texas</asp:ListItem>
	            <asp:ListItem Value="UT">Utah</asp:ListItem>
	            <asp:ListItem Value="VT">Vermont</asp:ListItem>
	            <asp:ListItem Value="VA">Virginia</asp:ListItem>
	            <asp:ListItem Value="WA">Washington</asp:ListItem>
	            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
	            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
	            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvShippingState" runat="server" ErrorMessage="Required" ControlToValidate="ddlShippingState" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <fieldset>
            <asp:Label ID="lblShippingPostalCode" runat="server" AssociatedControlID="txtShippingPostalCode">Zip Code <span class="required">*</span></asp:Label>
            <asp:TextBox ID="txtShippingPostalCode" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingPostalCode" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingCity" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
		</fieldset>
        <br/><br/>
        
		<fieldset>
            <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="lnkUpdate_Click" Text="Update" ValidationGroup="vgMyAccount" CssClass="button round big deep-red"></asp:LinkButton>
            <asp:HiddenField ID="hdfShippingAddressBvin" runat="server" />
            <asp:HiddenField ID="hdfBillingAddressBvin" runat="server" />
		</fieldset>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" MyProfileSelected="current"></uc:MyAccountNav>
</asp:Content>
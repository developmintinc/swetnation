<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SwetNation.Web.Checkout" %>
<%@ Register Src="~/controls/CheckoutAddress.ascx" TagName="CheckoutAddress" TagPrefix="uc" %>
<%@ Register Src="~/controls/DisplayPaymentMethods.ascx" TagName="DisplayPaymentMethods" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
<div class="checkout">
	<div id="content">
		<div class="one">
			<asp:Label ID="lblMessage" runat="server"></asp:Label>
			<div class="header-title">Checkout</div>
			<div class="section-sidebar">
				&nbsp;
			</div>
			<div class="sections">
				<div class="section-email">
                    <br />
                    <div class="header-title-medium">Email Address</div>
					<asp:TextBox ID="txtCustomerEmail" runat="server" Width="650" TabIndex="100"></asp:TextBox>
                    <span class="requiredfield">*</span><br />
                    <asp:RequiredFieldValidator ID="rfvCustomerEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtCustomerEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:Panel ID="pnlLoginForm" runat="server" Visible="false">
                        <asp:Panel ID="pnlLoggedIn" runat="server" Visible="false">
							<p>You are logged into your account. Thank You.</p>
						</asp:Panel>
						<asp:Panel ID="pnlNotLoggedIn" runat="server">
							<div id="login-changing" style="display: none;">
								<img src="../images/ajax-loader-small.gif" border="0" alt="Loading..." /> Please Wait...
							</div>
							<p id="loginmessage">It looks like you have an account already. Please login:</p>                    
							<table id="loginformtable" cellspacing="0" cellpadding="3">
								<tr>
									<td class="formlabel">Password:</td>
									<td class="formfield"><asp:TextBox ID="txtCustomerPassword" runat="server" TextMode="Password" ToolTip="Enter Your Password" TabIndex="151" Width="220"></asp:TextBox></td>
								</tr>
								<tr>
									<td class="formlabel">&nbsp;</td>
									<td class="formfield"><asp:HyperLink ID="hypLoginButton" runat="server" TabIndex="152" NavigateUrl="#"><asp:Image ID="imgLogin" runat="server" /></asp:HyperLink></td>
								</tr>
								<tr>
									<td class="formlabel"></td>
									<td><asp:HyperLink ID="hypForgotPassword" runat="server" TabIndex="153" CssClass="BVSmallText forgot">Forgot Your Password? Click Here.</asp:HyperLink></td>
								</tr>
							</table>
						</asp:Panel>
                    </asp:Panel>
				</div>
				<div class="section-shipping">
					<div class="header-title-medium">Shipping Address</div>
			        <uc:CheckoutAddress ID="ucCheckoutAddressShipping" runat="server" ShowForm="true" />
				</div>
				<div class="section-billing">
					<div class="header-title-medium">Billing Address</div>
					<asp:CheckBox ID="chkBillSame" runat="server" TabIndex="400" OnCheckedChanged="chkBillSame_CheckedChanged" AutoPostBack="true" /> 
					My billing address is the same as my shipping address
					<div id="billingwrapper">
				        <uc:CheckoutAddress ID="CheckoutAddressBilling" runat="server" />
					</div>
				</div>
				<div class="section-payment">
					<div class="header-title-medium">Payment Method</div>
                    <uc:DisplayPaymentMethods ID="ucDisplayPaymentMethods" runat="server" />
				</div>
				<div class="section-extras">
					<div class="header-title-medium">Special Instructions</div>
					<asp:TextBox ID="txtSpecialInstructions" runat="server" Columns="80" Rows="4" TextMode="MultiLine" TabIndex="600"></asp:TextBox>
				</div>
				<div class="section-actions">
					<asp:Panel ID="pnlShowAgreeToTerms" runat="server">
						<asp:CheckBox ID="chkAgreed" runat="server" />
						<asp:Literal ID="litAgreedToTermsDescription" runat="server" Mode="PassThrough"></asp:Literal>
						<p><asp:HyperLink ID="hypSiteTerms" runat="server" CssClass="viewSiteTerms"></asp:HyperLink></p>
					</asp:Panel>
					<asp:Image ID="imgPlaceOrder" runat="server" AlternateText="Place Order" TabIndex="3001" />
				</div>
				<div class="section-totals">
					<div class="header-title-medium">Order Summary</div>
					<div id="totalsastable">
						<asp:Literal ID="litTotalsAsTable" runat="server" Mode="PassThrough"></asp:Literal>
					</div>
				</div>
				<div class="section-cart">
					<!--
					@Html.Partial("_ViewOrderItems", Model.CurrentOrder.Items)
					-->
				</div>       
			</div>
			<div class="clear">&nbsp;</div>
		</div>
	</div>
</div>
</asp:Content>

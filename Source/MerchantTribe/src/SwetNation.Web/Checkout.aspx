<%@ Page Title="Swet Nation - Checkout" Language="C#" MasterPageFile="~/Main.master" CodeBehind="Checkout.aspx.cs" Inherits="SwetNation.Web.Checkout" MaintainScrollPositionOnPostback="true" %>
<%@ Register Src="~/controls/ViewOrderItems.ascx" TagName="ViewOrderItems" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
<div class="checkout">
	<div id="content">
		<div class="one">
			<asp:Label ID="lblMessage" runat="server"><%= Session["messages"] %></asp:Label>
			<div class="sections">
                <!---------------------------------------------------------------------------------->
                <!-- SHIPPING ADDRESS -->
                <!---------------------------------------------------------------------------------->
                <div class="section-billing">
                    <div class="header-title-medium">Shipping Address</div>
                    <asp:HiddenField ID="hdfShippingAddressBvin" runat="server" />
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
                        <asp:Label ID="lblShippingPhoneNumber" runat="server" AssociatedControlID="txtShippingPhoneNumber">Phone Number <span class="required">*</span></asp:Label>
                        <asp:TextBox ID="txtShippingPhoneNumber" runat="server" ValidationGroup="vgMyAccount" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvShippingPhoneNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtShippingPhoneNumber" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
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
				</div>
                <!---------------------------------------------------------------------------------->
                <!-- BILLING ADDRESS -->                
                <!---------------------------------------------------------------------------------->
                <div class="section-shipping">
                    <div class="header-title-medium">Billing Address</div>
                    <asp:HiddenField ID="hdfBillingAddressBvin" runat="server" />
                    <asp:CheckBox ID="chkBillingSame" runat="server" OnCheckedChanged="chkBillingSame_CheckedChanged" AutoPostBack="true" Checked="true" /> 
					My billing address is the same as my shipping address
                    <asp:Panel ID="pnlBillingSection" runat="server" Visible="false">
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
                    </asp:Panel>
				</div>
                <!---------------------------------------------------------------------------------->
                <!-- REWARD POINTS -->
                <!---------------------------------------------------------------------------------->
                <asp:Panel ID="pnlShowRewards" runat="server" Visible="false">
                    <div id="pnlRewardsPoints">
                        <div class="section-payment">                
                            <div class="header-title-medium"><asp:Literal ID="litRewardPoints" runat="server" Mode="PassThrough"></asp:Literal></div>
                            <asp:Literal ID="litRewardPointsAvailable" runat="server" Mode="PassThrough"></asp:Literal><br />
                            <asp:RadioButton ID="radDoNotUseRewardsPoints" runat="server" GroupName="ShowRewards" Checked="true" /> Do Not Use Credits<br />
                            <asp:RadioButton ID="radUseRewardsPoints" runat="server" GroupName="ShowRewards" OnCheckedChanged="radUseRewardsPoints_CheckedChanged" AutoPostBack="true"  /> <asp:Literal ID="litLabelRewardsUse" runat="server" Mode="PassThrough"></asp:Literal><br />
                        </div>
                    </div>    
                </asp:Panel>
                <!---------------------------------------------------------------------------------->
                <!-- PAYMENT METHOD -->
                <!---------------------------------------------------------------------------------->
				<div class="section-payment">
					<div class="header-title-medium">Payment Method</div>
                    <asp:HiddenField ID="hfdPayMethod" runat="server" Value="creditcard" />
                    <div class="creditcardinput">
                        <fieldset>
                            <asp:Label ID="lblCCVisa" runat="server" CssClass="cc-visa"></asp:Label>
                            <asp:Label ID="lblCCMastercard" runat="server" CssClass="cc-mastercard"></asp:Label>
                            <asp:Label ID="lblCCAmex" runat="server" CssClass="cc-amex"></asp:Label>
                            <asp:Label ID="lblCCDiscover" runat="server" CssClass="cc-discover"></asp:Label>
                        </fieldset>
                        <fieldset>
                            <asp:Label ID="lblCCNumber" runat="server" AssociatedControlID="txtCCNumber">Card Number <span class="required">*</span></asp:Label>
                            <asp:TextBox ID="txtCCNumber" runat="server" MaxLength="20" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCCNumber" runat="server" ErrorMessage="Required" ControlToValidate="txtCCNumber" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
                        </fieldset>
                        <fieldset>
                            <asp:Label ID="lblExpDate" runat="server" AssociatedControlID="ddlCCExpMonth">Exp. Date <span class="required">*</span></asp:Label>
                            <asp:DropDownList ID="ddlCCExpMonth" runat="server" Font-Size="Small" CssClass="small">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;/&nbsp;
                            <asp:DropDownList ID="ddlCCExpYear" runat="server" Font-Size="Small" CssClass="small">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                                <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                                <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                                <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                                <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                                <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                                <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                                <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                                <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                                <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                                <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCCExpMonth" runat="server" ErrorMessage="Required" ControlToValidate="ddlCCExpMonth" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCCExpYear" runat="server" ErrorMessage="Required" ControlToValidate="ddlCCExpYear" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
                        </fieldset>
                        <fieldset>
                            <asp:Label ID="lblSecurityCode" runat="server" AssociatedControlID="txtCCSecurityCode">Security Code <span class="required">*</span></asp:Label>
                            <asp:TextBox ID="txtCCSecurityCode" runat="server" MaxLength="4" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSecurityCode" runat="server" ErrorMessage="Required" ControlToValidate="txtCCSecurityCode" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
                        </fieldset>
                        <fieldset>
                            <asp:Label ID="lblCCCardHolder" runat="server" AssociatedControlID="txtCCCardHolder">Name On Card <span class="required">*</span></asp:Label>
                            <asp:TextBox ID="txtCCCardHolder" runat="server" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCCCardHolder" runat="server" ErrorMessage="Required" ControlToValidate="txtCCCardHolder" Display="Dynamic" ValidationGroup="vgMyAccount" CssClass="required"></asp:RequiredFieldValidator>
                        </fieldset>
                    </div>
				</div>
                <!---------------------------------------------------------------------------------->
                <!-- SPECIAL INSTRUCTIONS -->
                <!---------------------------------------------------------------------------------->
				<div class="section-extras">
					<div class="header-title-medium">Special Instructions</div>
					<asp:TextBox ID="txtSpecialInstructions" runat="server" Columns="80" Rows="3" TextMode="MultiLine"></asp:TextBox>
				</div>
                <!---------------------------------------------------------------------------------->
                <!-- ORDER SUMMARY -->
                <!---------------------------------------------------------------------------------->
				<div class="section-totals">
					<div class="header-title-medium">Order Summary</div>
					<div id="totalsastable">
						<asp:Literal ID="litTotalsAsTable" runat="server" Mode="PassThrough"></asp:Literal>
					</div>
				</div>
				<div class="section-cart">
                    <div class="header-title-medium">Order Items</div>
                    <uc:ViewOrderItems ID="ucViewOrderItems" runat="server"></uc:ViewOrderItems>
				</div>
                <!---------------------------------------------------------------------------------->
                <!-- TERMS -->
                <!---------------------------------------------------------------------------------->
                <div style="padding: 5px 0px;text-align:center;">
                    <asp:Panel ID="pnlShowAgreeToTerms" runat="server">
						<asp:CheckBox ID="chkAgreed" runat="server" />
						<asp:Literal ID="litAgreedToTermsDescription" runat="server" Mode="PassThrough"></asp:Literal>
						<p><asp:HyperLink ID="hypSiteTerms" runat="server" CssClass="viewSiteTerms" Target="_blank" ForeColor="Red"></asp:HyperLink></p>
					</asp:Panel>
                    <asp:LinkButton ID="lnkPlaceOrder" runat="server" Text="Place Order" CssClass="button cube deep-red small" ToolTip="Place Order" OnClick="lnkPlaceOrder_Click" ValidationGroup="vgMyAccount"></asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkCancelOrder" runat="server" Text="Cancel Order" CssClass="button cube deep-red small" ToolTip="Cancel Order" OnClick="lnkCancelOrder_Click"></asp:LinkButton>
                </div>
			</div>
			<div class="clear">&nbsp;</div>
		</div>
	</div>
</div>
</asp:Content>

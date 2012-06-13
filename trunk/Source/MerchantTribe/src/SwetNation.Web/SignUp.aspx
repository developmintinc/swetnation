<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="SwetNation.Web.SignUp" %>
<%@ Register Src="~/controls/HeaderFonts.ascx" TagName="HeaderFonts" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SwetNation.com :: Sign Up</title>
	<link rel="shortcut icon" type="image/gif" href="images/favicon.gif"/>
    <uc:HeaderFonts ID="ucHeaderFonts" runat="server" />
    <link href="css/Signup.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="page-wrap-logo">
        <table width="100%">
            <tr>
                <td><img src="images/logo/SNLogoNav.png" alt="Swet Nation" /></td>
                <td class="tagline">
                    SPORTS BRANDS<br />
                    MEMBERS PRICES
                </td>
            </tr>
        </table>
    </div>

    <div id="page-wrap-signup" class="bottom">
        <%= Session["messages"] %>
        <asp:ValidationSummary ID="vsSignUp" runat="server" DisplayMode="BulletList" ShowSummary="false" ShowMessageBox="true" />
        <table width="100%">
            <tr>
                <td>
                    <label>FIRST NAME</label>
                    <asp:TextBox ID="txtFirstName" runat="server" Width="95%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name is required" ControlToValidate="txtFirstName" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>LAST NAME</label>
                    <asp:TextBox ID="txtLastName" runat="server" Width="96%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="First name is required" ControlToValidate="txtLastName" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>EMAIL ADDRESS</label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email address is required" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>CITY</label>
                    <asp:TextBox ID="txtCity" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required" ControlToValidate="txtCity" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>STATE</label>
                    <asp:DropDownList ID="ddlState" runat="server" Width="100%">
                        <asp:ListItem Value="">-- SELECT --</asp:ListItem>
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
                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State is required" ControlToValidate="ddlState" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>ZIP CODE</label>
                    <asp:TextBox ID="txtPostalCode" runat="server" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ErrorMessage="Zip code is required" ControlToValidate="txtPostalCode" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>CREATE PASSWORD</label>
                    <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>CONFIRM PASSWORD</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ErrorMessage="Confirm password is required" ControlToValidate="txtConfirmPassword" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>GENDER</label>
                    <asp:DropDownList ID="ddlGender" runat="server" Width="100%">
                        <asp:ListItem Text="-- SELECT --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Gender is required" ControlToValidate="ddlGender" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:CheckBox ID="chkAgreed" runat="server" CssClass="AcceptedAgreement" />
					<asp:Label ID="litAgreedToTermsDescription" runat="server" CssClass="small"></asp:Label>
					<p><asp:HyperLink ID="hypSiteTerms" runat="server" CssClass="viewSiteTerms small" Target="_blank" ForeColor="Red"></asp:HyperLink></p>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:LinkButton ID="btnSignUp" runat="server" Text="SIGN UP" CssClass="button round big deep-red" OnClick="btnSignUp_Click" CausesValidation="true"></asp:LinkButton>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr style=" border-bottom: 1px solid white;" />
                    <br />
                    <span class="tagline">ALREADY A MEMBER?</span>
                    <br /><br />
                    <asp:LinkButton ID="lnkSignIn" runat="server" Text="SIGN IN" CssClass="button round big deep-red" PostBackUrl="~/SignIn.aspx" CausesValidation="false"></asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

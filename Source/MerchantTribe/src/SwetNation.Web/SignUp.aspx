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
					<asp:Label ID="litAgreedToTermsDescription" runat="server" CssClass="small"></asp:Label> <asp:HyperLink ID="hypSiteTerms" runat="server" CssClass="viewSiteTerms small" Target="_blank" ForeColor="Red"></asp:HyperLink>
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

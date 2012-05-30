<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SwetNation.Web.SignIn" %>
<%@ Register Src="~/controls/HeaderFonts.ascx" TagName="HeaderFonts" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SwetNation.com :: Sign In</title>
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

    <div id="page-wrap" class="bottom">
        <table width="100%">
            <tr>
                <td colspan="3">
                    <label>EMAIL ADDRESS</label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <label>PASSWORD</label>
                    <asp:TextBox ID="txtPassword" runat="server" Width="100%" TextMode="Password"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                    <asp:LinkButton ID="btnSignIn" runat="server" Text="SIGN IN" CssClass="button round big deep-red" OnClick="btnSignIn_Click" TabIndex="101"></asp:LinkButton>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br /><%= Session["messages"] %>
                </td>
            </tr>
            <tr>
                <td width="5%"><asp:CheckBox ID="chkRememberMe" runat="server" /></td>
                <td width="45%"><label>REMEMBER ME</label></td>
                <td width="5    0%"><a href="ForgotPassword.aspx" style="font-size:12px; font-weight:bold; color:White;">FORGOT PASSWORD?</a></td>
            </tr>            
            <tr>
                <td colspan="3">
                    <br />
                    <hr style=" border-bottom: 1px solid white;" />
                    <br />
                    <span class="tagline">NOT A MEMBER?</span>
                    <br /><br />
                    <asp:LinkButton ID="lnkSignUp" runat="server" Text="SIGN UP" CssClass="button round big deep-red" PostBackUrl="~/SignUp.aspx" TabIndex="201"></asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

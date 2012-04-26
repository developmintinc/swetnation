<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="SwetNation.Web.SignUp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SwetNation.com | Sign Up</title>
	<link href="css/Signup.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="page-wrap-logo">
        <table width="100%">
            <tr>
                <td><img src="/images/logo/SNLogoNav.png" alt="Swet Nation" /></td>
                <td style="font-size: 20px; font-weight: bold;">
                    SPORTS BRANDS<br />
                    MEMBERS PRICES
                </td>
            </tr>
        </table>
    </div>

    <div id="page-wrap">
        <table width="100%">
            <tr>
                <td>
                    <label>EMAIL ADDRESS</label>
                    <asp:TextBox ID="txtEmail" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>PASSWORD</label>
                    <asp:TextBox ID="txtPassword" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:LinkButton ID="btnSignUp" runat="server" Text="SIGN UP" CssClass="button round big deep-red" OnClick="btnSignUp_Click"></asp:LinkButton>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br /><%= Session["messages"] %>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                    <hr style=" border-bottom: 1px solid white;" />
                    <br />
                    <span style="font-size:24px; font-weight:bold;">ALREADY MEMBER?</span>
                    <br /><br />
                    <asp:LinkButton ID="lnkSignIn" runat="server" Text="SIGN IN" CssClass="button round big deep-red" PostBackUrl="~/SignIn.aspx"></asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

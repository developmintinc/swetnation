<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="SwetNation.Web.ForgotPassword" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SwetNation.com | Forgot Password</title>
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
        <asp:Panel ID="pnlPasswordReset" runat="server" Visible="false">
            <p>This form will generate a new random password for your account. You will receive an email with your new password.</p>
        </asp:Panel>
        <asp:Panel ID="pnlForgotPassword" runat="server">
            <table width="100%">
                <tr>
                    <td width="75%">
                        <label>EMAIL ADDRESS</label>
                        <asp:TextBox ID="txtEmail" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:LinkButton ID="btnSendReminder" runat="server" Text="SEND" CssClass="button round big deep-red" OnClick="btnSendReminder_Click"></asp:LinkButton>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <br /><%= Session["messages"] %>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="bottom">
                        <br />
                        <hr style=" border-bottom: 1px solid white;" />
                        <br />
                        
                        <span class="tagline">ALREADY A MEMBER</span>
                        <br />
                        <asp:LinkButton ID="lnkSignIn" runat="server" Text="SIGN IN" CssClass="button round big deep-red" PostBackUrl="~/SignIn.aspx"></asp:LinkButton>
                        <br /><br /><br />

                        <span class="tagline">BECOME A MEMBER</span><br />
                        <asp:LinkButton ID="lnkSignUp" runat="server" Text="SIGN UP" CssClass="button round big deep-red" PostBackUrl="~/SignUp.aspx"></asp:LinkButton>
                        <br /><br />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    </form>
</body>
</html>

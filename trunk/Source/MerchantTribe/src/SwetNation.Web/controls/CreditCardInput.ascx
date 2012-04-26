<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditCardInput.ascx.cs" Inherits="SwetNation.Web.controls.CreditCardInput" %>
<div class="creditcardinput">
    <table border="0" cellspacing="0" cellpadding="2">
        <tr>
            <td>&nbsp;</td>
            <td class="formfield">
                <asp:Label ID="lblCCVisa" runat="server" CssClass="cc-visa"></asp:Label>
                <asp:Label ID="lblCCMastercard" runat="server" CssClass="cc-mastercard"></asp:Label>
                <asp:Label ID="lblCCAmex" runat="server" CssClass="cc-amex"></asp:Label>
                <asp:Label ID="lblCCDiscover" runat="server" CssClass="cc-discover"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Card Number</td>
            <td class="formfield">
                <span class="creditcardnumber">
                    <asp:TextBox ID="txtCCNumber" runat="server" MaxLength="20"></asp:TextBox>
                </span>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Exp. Date</td>
            <td class="formfield">
                <asp:DropDownList ID="ddlCCExpMonth" runat="server" CssClass="small">
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
                <asp:DropDownList ID="ddlCCExpYear" runat="server" CssClass="small">
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
            </td>
        </tr>        
        <tr>
            <td class="formlabel">Security Code</td>
            <td class="formfield">
                <asp:TextBox ID="txtCCSecurityCode" runat="server" MaxLength="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Name On Card</td>
            <td class="formfield">
                <asp:TextBox ID="txtCCCardHolder" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
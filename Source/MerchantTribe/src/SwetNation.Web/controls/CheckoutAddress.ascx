<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CheckoutAddress.ascx.cs" Inherits="SwetNation.Web.controls.CheckoutAddress" %>
<asp:Panel ID="pnlAddressForm" runat="server" Visible="false">
    <table border="0" cellspacing="0" cellpadding="3" class="address-table">
        <tr>
            <td class="formlabel">&nbsp;</td>
            <td class="formfield">
                <asp:DropDownList ID="ddlCountries" runat="server" Width="220">
                    <asp:ListItem Text="-- select country --" Value=""></asp:ListItem>
                    <asp:ListItem Text="United States" Value="usa"></asp:ListItem>
                    <asp:ListItem Text="Canada" Value="can"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="formlabel">First Name:</td>
            <td class="formfield">
                <asp:TextBox ID="txtFirstName" runat="server" TabIndex="102" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Last Name:</td>
            <td class="formfield">
                <asp:TextBox ID="txtLastName" runat="server" TabIndex="103" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Company:</td>
            <td class="formfield">
                <asp:TextBox ID="txtCompany" runat="server" TabIndex="104" Width="220"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Address:</td>
            <td class="formfield">
                <asp:TextBox ID="txtAddress" runat="server" TabIndex="105" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">City:</td>
            <td class="formfield">
                <asp:TextBox ID="txtCity" runat="server" TabIndex="106" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">State:</td>
            <td class="formfield">
                <asp:DropDownList ID="ddlState" runat="server" TabIndex="107" Width="220"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlState" ErrorMessage="State is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Postal Code:</td>
            <td class="formfield">
                <asp:TextBox ID="txtPostalCode" runat="server" TabIndex="108" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="formlabel">Phone:</td>
            <td class="formfield">
                <asp:TextBox ID="txtPhone" runat="server" TabIndex="109" Width="220"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:HiddenField ID="hdfAddressBvin" runat="server" />
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrderItems.ascx.cs" Inherits="SwetNation.Web.controls.ViewOrderItems" %>
<asp:Repeater ID="rptOrderItems" runat="server">
    <HeaderTemplate>
        <table style="margin:20px 0; border-bottom: solid 1px #666; color: #000;" width="100%" border="0">
            <tr>
                <th>Item</th>
                <th>Shipping</th>
                <th>Price</th>
                <th>Qty</th>
                <th>Line Total</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
            <tr style="background: #eee;">
                <td>
                    <%# Eval("ProductSku") %><br />
                    <%# Eval("ProductName") %><br />
                    <%# Convert.ToString(Eval("LineTotal")) != Convert.ToString(Eval("LineTotalWithoutDiscounts")) ? "<div class='discounts'>" + Eval("DiscountDetails") + "</div>" : "" %>
                    &nbsp;
                </td>
                <td>
                    <%# Eval("ShippingStatusDescription")%>
                </td>
                <td align="right">
                    <%# string.Format("{0:c}", Eval("BasePricePerItem")) %>
                </td>
                <td align="center"><%# Eval("Quantity")%></td>
                <td align="right">
                    <%# Convert.ToString(Eval("LineTotal")) != Convert.ToString(Eval("LineTotalWithoutDiscounts")) ? "<strike>" +  string.Format("{0:c}", Eval("LineTotalWithoutDiscounts")) + "</strike><br />" : "" %>
                    <%# string.Format("{0:c}", Eval("LineTotal")) %>
                </td>
            </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
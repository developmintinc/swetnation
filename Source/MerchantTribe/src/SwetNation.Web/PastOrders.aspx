<%@ Page Title="Swet Nation - Past Orders" Language="C#" MasterPageFile="~/RightSidebar.master" AutoEventWireup="true" CodeBehind="PastOrders.aspx.cs" Inherits="SwetNation.Web.PastOrders" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/MyAccountNav.ascx" TagName="MyAccountNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="My Orders" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
	<div id="login-form">
	    <div class="header-title-medium">My Orders</div>
        <asp:ListView ID="lstOrderHistory" runat="server" DataKeyNames="bvin" OnItemCommand="lstOrderHistory_OnItemCommand">
            <LayoutTemplate>
                <table width="100%" border="0" cellpadding="1">
                    <tr style="background-color:#E5E5FE">
                        <th align="left" width="25%">Order Number</th>
                        <th align="left" width="25%">Amount</th>
                        <th align="left" width="25%">Time of Order</th>
                        <th width="25%">&nbsp;</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Label runat="server" ID="lblId"><%# Eval("OrderNumber") %></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblName"><%# DataBinder.Eval(Container.DataItem, "TotalGrand", "{0:c}") %></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblType"><%# Convert.ToDateTime(Eval("TimeOfOrderUtc")).ToLocalTime() %></asp:Label></td>
                    <td align="right"><asp:LinkButton ID="lnkGetDetails" runat="server" CommandName="GetDetails" CommandArgument='<%# Eval("bvin") %>' Text="VIEW" CssClass="button round big deep-red"></asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr style="background-color:#EFEFEF">
                    <td><asp:Label runat="server" ID="lblId"><%# Eval("OrderNumber") %></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblName"><%# DataBinder.Eval(Container.DataItem, "TotalGrand", "{0:c}") %></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblType"><%# Convert.ToDateTime(Eval("TimeOfOrderUtc")).ToLocalTime() %></asp:Label></td>
                    <td align="right"><asp:LinkButton ID="lnkGetDetails" runat="server" CommandName="GetDetails" CommandArgument='<%# Eval("bvin") %>' Text="VIEW" CssClass="button round big deep-red"></asp:LinkButton></td>
                </tr>
            </AlternatingItemTemplate>
        </asp:ListView>
    </div>
    <br /><br />
    <asp:Panel ID="pnlDetails" runat="server" Visible="false">
        <div class="login-form">
	        <div class="header-title-medium">Order Details</div>
            <table cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td width="67%" colspan="2">
                        <h1>Order <asp:Literal ID="litOrderNumber" runat="server" Mode="PassThrough"></asp:Literal></h1>
                    </td>
                    <td width="33%" valign="top" align="right">
                        <asp:Literal ID="litFullOrderStatusDescription" runat="server" Mode="PassThrough"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <span class="lightlabel">Bill To:</span><br />
                        <asp:Literal ID="litBillingAddress" runat="server" Mode="Transform"></asp:Literal>
                    </td>
                    <td valign="top">            
                        <span class="lightlabel">Ship To:</span><br />
                        <asp:Literal ID="litShippingAddress" runat="server" Mode="Transform"></asp:Literal>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ListView ID="lstItems" runat="server">
                            <LayoutTemplate>
                                <table width="100%" border="0" cellpadding="1">
                                    <tr style="background-color:#E5E5FE">
                                        <th align="left" width="45%">Item</th>
                                        <th align="left" width="17%">Shipping</th>
                                        <th align="left" width="14%">Price</th>
                                        <th align="left" width="10%">Qty</th>
                                        <th align="left" width="14%">Total</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server"></tr>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("ShippingStatusDescription")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "BasePricePerItem", "{0:c}") %></td>
                                    <td><%# Eval("Quantity")%></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "LineTotal", "{0:c}") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Panel ID="pnlInstructions" runat="server" Visible="false">
                            <em>Customer's Instructions:</em><br />
                            <asp:Literal ID="litInstructions" runat="server" Mode="PassThrough"></asp:Literal>
                        </asp:Panel>                        
                    </td>
                    <td valign="top">
                        <asp:Panel ID="pnlCoupon" runat="server" Visible="false">
                            <em>Codes Used:</em><br />
                            <asp:BulletedList ID="blCoupons" runat="server">
                            </asp:BulletedList>
                        </asp:Panel>
                    </td>
                    <td valign="top" align="right">
                        <asp:Literal ID="litTotalsAsTable" runat="server" Mode="PassThrough"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div style="height: 20px;">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <div id="packagesdiv" runat="server">
                            <asp:Panel ID="pnlPackages" runat="server" Visible="false">
                                <asp:ListView ID="lstPackages" runat="server">
                                    <LayoutTemplate>
                                        <table width="100%" border="0" cellpadding="1">
                                            <tr style="background-color:#E5E5FE">
                                                <th align="left" width="25%">Shipped</th>
                                                <th align="left" width="40%">Date</th>
                                                <th align="left" width="35%">Tracking</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server"></tr>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Convert.ToString(Eval("HasShipped")) %></td>
                                            <td><%# Convert.ToDateTime(Eval("ShipDateUtc")).ToLocalTime() %></td>
                                            <td><%# Eval("TrackingNumber") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                            </asp:Panel>
                        </div>                        
                    </td>
                    <td align="left" valign="top">
                        <table class="controlarea1" style="margin-top: 8px; color: #666; font-size: 11px;" border="0" cellspacing="0" cellpadding="3" width="100%">
                            <tr>
                                <td colspan="2" class="formfield" style="border-bottom: solid 1px #999;">
                                    <asp:Literal ID="litPaymentsSummary" runat="server" Mode="PassThrough"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="formfield">
                                    Payment Received:
                                </td>
                                <td class="formlabel">
                                    <asp:Literal ID="litAmountCharged" runat="server" Mode="PassThrough"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="formfield">
                                    Gift Card Total:
                                </td>
                                <td class="formlabel">
                                    <asp:Literal ID="litGiftCardAmount" runat="server" Mode="PassThrough"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="formfield">
                                    Total:
                                </td>
                                <td class="formlabel">
                                    <asp:Literal ID="litTotalCredit" runat="server" Mode="PassThrough"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="formfield" style="border-bottom: solid 1px #999; padding-bottom: 3px;">
                                    Refunded:
                                </td>
                                <td class="formlabel" style="border-bottom: solid 1px #999; padding-bottom: 3px;">
                                    <asp:Literal ID="litAmountRefunded" runat="server" Mode="PassThrough"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td class="formfield">
                                    Amount Due:
                                </td>
                                <td class="formlabel" style="color: #333;">
                                    <strong><asp:Literal ID="litAmountDue" runat="server" Mode="PassThrough"></asp:Literal></strong>
                                </td>
                            </tr>
                        </table>
                        &nbsp;<br />            
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <uc:MyAccountNav ID="ucMyAccountNav" runat="server" PastOrdersSelected="current"></uc:MyAccountNav>
</asp:Content>

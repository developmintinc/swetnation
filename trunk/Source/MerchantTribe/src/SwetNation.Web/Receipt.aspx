<%@ Page Title="Swet Nation -  Receipt" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="SwetNation.Web.Receipt" %>
<%@ Register Src="~/controls/ViewOrderItems.ascx" TagName="ViewOrderItems" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
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
                <asp:Literal ID="litBillingAddress" runat="server" Mode="PassThrough"></asp:Literal>
            </td>
            <td valign="top">            
                <span class="lightlabel">Ship To:</span><br />
                <asp:Literal ID="litShippingAddress" runat="server" Mode="PassThrough"></asp:Literal>
            </td>
            <td valign="top">
                <asp:Literal ID="litTotalsAsTable" runat="server" Mode="PassThrough"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <uc:ViewOrderItems ID="ucViewOrderItems" runat="server"></uc:ViewOrderItems>
            </td>
        </tr>
        <!--
        <tr>
            <td valign="top">
                <asp:Panel ID="pnlSpecialInstructions" runat="server" Visible="false">
                    <em>Customer's Instructions:</em><br />
                    <asp:Literal ID="litInstructions" runat="server" Mode="PassThrough"></asp:Literal>
                </asp:Panel>
                <asp:Panel ID="pnlCoupons" runat="server" Visible="false">
                    <em>Codes Used:</em><br />
                    <asp:Literal ID="litCoupons" runat="server" Mode="PassThrough"></asp:Literal>
                </asp:Panel>
            </td>
            <td valign="top" colspan="2" align="right">
                
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div style="height: 20px;">
                </div>
            </td>
        </tr>
        <tr runat="Server" id="trNotes">
            <td valign="top" class="controlarea2">
                <div id="packagesdiv" runat="server">
                    <em>Packages:</em>
                    <asp:Panel ID="pnlPackages" runat="server" Visible="false">
                        <table>
                            <tr>
                                <th>Shipped Date</th>
                                <th>Tracking Number</th>
                            </tr>
                            <tr>
                                <td><asp:Literal ID="litShipped" runat="server" Mode="PassThrough"></asp:Literal></td>
                                <td><asp:Literal ID="litTrackingNumber" runat="server" Mode="PassThrough"></asp:Literal></td>
                            </tr>
                        </table>
                    </asp:Panel>                    
                </div>                
            </td>
            <td valign="top" class="controlarea2">
                &nbsp;
            </td>
            <td class="controlarea2" align="left" valign="top">
                <em>Payment Information:</em>
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
            </td>
        </tr>
        -->
    </table>
</asp:Content>

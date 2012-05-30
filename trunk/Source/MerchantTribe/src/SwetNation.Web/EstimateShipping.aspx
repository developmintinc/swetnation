<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EstimateShipping.aspx.cs" Inherits="SwetNation.Web.EstimateShipping" %>
<!DOCTYPE html>
<html>
<head>
    <title>@ViewBag.Title</title> 
    <style type="text/css">
        #popup-wrapper #main-content {background:#fff;color:#666;padding:10px;}
    </style>

    <script type="text/javascript">
        function LoadRegionsWithSelection(regionlist, countryid, selectedregion) {
            $.post('@Url.Content("~/estimateshipping/getregions/")' + countryid, {
                "regionid": selectedregion
            },
            function (data) {
                regionlist.html(data.Regions);
                $('#TempRegionId').val('');
            },
            "json"
            );
        }

        $(document).ready(function () {
            $('#CountryId').change(function () {
                LoadRegionsWithSelection(
                        $('#RegionId'),
                        $('#CountryId option:selected').val(),
                        $('#TempRegionId').val());
            });

            $('#CountryId').change();
        });
    </script>
</head>
<body id="pagebody">
    <form id="form2" runat="server">
    <div id="popup-wrapper">
        <div id="main-content">
            <h1>Estimate Shipping</h1>
            <table border="0" cellspacing="0" cellpadding="3">
                <tr>
                    <td class="formlabel">Country:</td>
                    <td class="formfield">
                        <asp:DropDownList ID="CountryId" runat="server" ClientIDMode="Static"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="formlabel">State:</td>
                    <td class="formfield">
                        <asp:Literal ID="State" runat="server" Mode="PassThrough" ClientIDMode="Predictable"></asp:Literal>
                        <input type="hidden" runat="server" id="RegionId" name="RegionId" />
                    </td>
                </tr>
                <tr>
                    <td class="formlabel">Postal Code:</td>
                    <td class="formfield">
                        <asp:Literal ID="PostalCode" runat="server" Mode="PassThrough" ClientIDMode="Predictable"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td class="formlabel">City</td>
                    <td class="formfield">
                        <asp:Literal ID="City" runat="server" Mode="PassThrough" ClientIDMode="Predictable"></asp:Literal>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="TempRegionId" runat="server" ClientIDMode="Static" />
            <asp:BulletedList ID="blRates" runat="server" BulletStyle="Square" DisplayMode="Text"></asp:BulletedList>
            <br /><br />
            <%= Session["message"] %>
            <br /><br />
            <div class="popupcontrols">
                <a href="javascript:window.close();">Close Window</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
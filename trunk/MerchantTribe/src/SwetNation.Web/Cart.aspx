<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs" Inherits="SwetNation.Web.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainHeadContent" runat="server">
    <style type="text/css">
        /* Cart Page */
        .cartitemimage
        {
            float: left;
            margin: 0 0 0 0;
        }
        .cartitemimage img
        {
            width: 110px;
        }
        .cartitemdescription
        {
            margin: 5px;
        }
        #cartcontainer tr td
        {
            border-bottom: solid 1px #666;
            padding: 6px;
            vertical-align: top;
        }
        #cartcontainer, #cartactions, #cartcoupons
        {
            margin: 0;
        }
        td.productquantitycolumn
        {
            text-align: center;
            width: 10%;
        }
        td.producttotalcolumn, td.productpricecolumn
        {
            text-align: center;
            width: 10%;
        }
        td.producttotalcolumn
        {
            background-color: #f3ebea;
        }
        td.producttotalcolumn .lineitemnodiscounts
        {
            display: block;
            color: #999;
            text-decoration: line-through;
        }
        td.producttotalcolumn .totallabel
        {
            display: block;
            font-weight: bold;
        }
        #cartfooter
        {
            margin: 10px 0px 0 0px;
        }
        #carttotals
        {
            width: 400px;
            float: right;
            margin-bottom: 10px;
            text-align: right;
        }
        #carttotals table
        {
            float: right;
        }
        #carttotals .formlabel, #carttotals .formfield
        {
            font-size: 110%;
            font-weight: bold;
            color: #ac211b;
        }
        #cartupdates
        {
            width: 350px;
            margin-bottom: 10px;
            text-align: right;
            float: right;
        }
        #cartactions
        {
            clear: both;
            text-align: right;
            padding-bottom: 12px;
            margin-top: 20px;
        }
        #cartactioncontinue
        {
            float: left;
            width: 120px;
            text-align: left;
        }
        #cartactioncheckout
        {
            display: inline;
        }
        #cartcoupons
        {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background: #eee;
            padding: 10px;
            margin: 0px 0;
        }
        .cartsku
        {
            font-size: 90%;
        }
        .cartproductname
        {
            font-size: 110%;
            font-weight: bold;
        }
        .productdetailscolumn
        {
            vertical-align: top;
        }
        .productdetailscolumncenter
        {
            vertical-align: top;
            text-align: center;
        }
        ul.lineitemoptions
        {
            margin: 0 0 0 20px;
        }
        .textbox
        {
            background:#FFFFFF url(images/search.png) no-repeat 4px 4px;
	        padding:4px 4px 4px 22px;
	        border:1px solid #000;
	        width:230px;
	        height:28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainBodyContent" runat="server">
    <div id="content">
        <div class="one">
            <table class="cartproductgrid" id="ItemGridView" width="100%" border="1">
                <tr>
                    <th style="text-align: left;">
                        Product
                    </th>
                    <th>
                        &nbsp;
                    </th>
                    <th>
                        Price
                    </th>
                    <th>
                        Quantity
                    </th>
                    <th>
                        Total
                    </th>
                    <th>
                        &nbsp;
                    </th>
                </tr>
                <tr>
                    <td class="productimagecolumn">
                        <div class="cartitemimage">
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=3"
                                title="Stadium AW 77 Full-Zip Hoodie">
                                <img src="https://swetnation.com/shop/images/sites/1/products/fa2a2ff8-2a69-418e-9572-ae33e8bc6528/medium/Nike-AW77-Stadium-Full-Zip-Womens-Hoodie-434506_005_A.jpg"
                                    alt="Stadium AW 77 Full-Zip Hoodie" height="100px" />
                            </a>
                        </div>
                    </td>
                    <td class="productdetailscolumn">
                        <div runat="server" class="cartitemdescription">
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=3"
                                title="Stadium AW 77 Full-Zip Hoodie">
                                <div class="cartsku">
                                    123456</div>
                                <div class="cartproductname">
                                    Stadium AW 77 Full-Zip Hoodie</div>
                            </a>
                        </div>
                    </td>
                    <td class="productdetailscolumncenter">
                        <span class="cartproductprice">$40.00</span>
                    </td>
                    <td class="productdetailscolumncenter">
                        <div>
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=3">
                                1</a>
                        </div>
                    </td>
                    <td class="productdetailscolumncenter">
                        <span class="totallabel">$40.00</span>
                    </td>
                    <td class="productdetailscolumncenter">
                        <form action="/cart/removelineitem" method="post">
                        <input type="image" src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/x.png"
                            alt="Remove This Item" />
                        <input type="hidden" name="lineitemid" value="3" />
                        <input type="hidden" name="orderbvin" value="0879d3e7-af06-4c2a-9d8a-e207a69aaca5" />
                        </form>
                    </td>
                </tr>
                <tr>
                    <td class="productimagecolumn">
                        <div class="cartitemimage">
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=6"
                                title="Stadium AW 77 Full-Zip Hoodie">
                                <img src="https://swetnation.com/shop/images/sites/1/products/fa2a2ff8-2a69-418e-9572-ae33e8bc6528/medium/Nike-AW77-Stadium-Full-Zip-Womens-Hoodie-434506_005_A.jpg"
                                    alt="Stadium AW 77 Full-Zip Hoodie" height="100px" />
                            </a>
                        </div>
                    </td>
                    <td class="productdetailscolumn">
                        <div runat="server" class="cartitemdescription">
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=6"
                                title="Stadium AW 77 Full-Zip Hoodie">
                                <div class="cartsku">
                                    123456</div>
                                <div class="cartproductname">
                                    Stadium AW 77 Full-Zip Hoodie</div>
                            </a>
                        </div>
                    </td>
                    <td class="productdetailscolumncenter">
                        <span class="cartproductprice">$40.00</span>
                    </td>
                    <td class="productdetailscolumncenter">
                        <div>
                            <a href="/Stadium-AW-77-Full-Zip-Hoodie?OrderBvin=0879d3e7-af06-4c2a-9d8a-e207a69aaca5&amp;LineItemId=6">
                                1</a>
                        </div>
                    </td>
                    <td class="productdetailscolumncenter">
                        <span class="totallabel">$40.00</span>
                    </td>
                    <td class="productdetailscolumncenter">
                        <form action="/cart/removelineitem" method="post">
                        <input type="image" src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/x.png"
                            alt="Remove This Item" />
                        <input type="hidden" name="lineitemid" value="6" />
                        <input type="hidden" name="orderbvin" value="0879d3e7-af06-4c2a-9d8a-e207a69aaca5" />
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div class="one">
            <div id="cartfooter">
                <div id="carttotals">
                    <table border="0" cellspacing="0" cellpadding="3">
                        <tr>
                            <td class="formlabel">
                                Sub Total:
                            </td>
                            <td class="formfield">
                                $80.00
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="EstimateShipping">
                    <a id="GetRatesLink" onclick="JavaScript:window.open('/EstimateShipping','Images','width=400, height=500, menubar=no, scrollbars=yes, resizable=yes, status=no, toolbar=no');"
                        style="cursor: pointer;">
                        <img src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/estimateshipping.png"
                            alt="Estimate Shipping" />
                    </a>
                </div>
            </div>
        </div>
        <div class="one">
            <div id="cartactions">
                <div id="cartactioncontinue">
                    <a href="/" alt="Keep Shopping">
                        <img src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/keepshopping.png"
                            alt="Keep Shopping" /></a>
                </div>
                <div id="cartactioncheckout" runat="server">
                    <form action="/cart" method="post">
                    <input type="image" src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/securecheckout.png"
                        alt="Secure Checkout" />
                    </form>
                    <div class="paypalbuffer">
                        - OR -
                    </div>
                    <form action="/cart" method="post" class="paypalexpresscheckoutform">
                    <input type="image" src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif"
                        alt="PayPal Express Checkout" />
                    <input type="hidden" name="paypalexpress" value="true" />
                    </form>
                </div>
            </div>
            <div id="cartcoupons">
                Add a Promotional Code:
                <form action="/cart/addcoupon" method="post">
                <input type="text" name="couponcode" class="textbox" />
                <input type="image" id="btnAddCoupon" src="https://swetnation.com/shop/images/sites/1/themes/theme-bv-jewelryred/buttons/new.png" alt="Add Coupon To Cart" />
                </form>
                <table>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

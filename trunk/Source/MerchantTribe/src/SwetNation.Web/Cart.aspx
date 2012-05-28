<%@ Page Title="Swet Nation - Shopping Cart" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SwetNation.Web.Cart" %>
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
			<asp:Label ID="lblMessage" runat="server"></asp:Label>
		</div>
		<div class="one">
			<asp:Repeater ID="rptCartItems" runat="server" ClientIDMode="Static" OnItemCommand="rptCartItems_ItemCommand">
				<HeaderTemplate>
					<table class="cartproductgrid" id="ItemGridView" width="100%" border="1">
						<tr>
							<th style="text-align: left;">Product</th>
							<th>&nbsp;</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>&nbsp;</th>
						</tr>
				</HeaderTemplate>
				<ItemTemplate>
						<tr>
							<td class="productimagecolumn">
								<div class="cartitemimage">
									<a href='<%# Eval("LinkUrl") %>' title="Product">
										<img src='https://swetnation.com<%# Eval("ImageUrl") %>' height="100px" />
									</a>
								</div>
							</td>
							<td class="productdetailscolumn">
								<div id="divCartItemDescription" runat="server" class="cartitemdescription">
									<a href='<%# Eval("LinkUrl") %>'>
										<div class="cartproductname"><%# Eval("Item.ProductName") %></div>
									</a>
								</div>
							</td>
							<td class="productdetailscolumncenter">
								<span class="cartproductprice"><%# string.Format("{0:C}", Eval("Item.BasePricePerItem"))%></span>
							</td>
							<td class="productdetailscolumncenter">
								<div>
									<a href='<%# Eval("LinkUrl") %>'><%# string.Format("{0:#}", Eval("Item.Quantity")) %></a>
								</div>
							</td>
							<td class="productdetailscolumncenter">
								<span class="totallabel"><%# string.Format("{0:C}", Eval("Item.LineTotal"))%></span>
							</td>
							<td class="productdetailscolumncenter">
								<asp:LinkButton ID="lnkAddtoCart" runat="server" CssClass="button cube deep-red small" CommandName="RemoveItemFromCart">Remove</asp:LinkButton>
								<asp:HiddenField ID="hfdLineItemId" runat="server" Value='<%# Eval("Item.Id") %>' />
								<asp:HiddenField ID="hfdOrderBvin" runat="server" Value='<%# Eval("Item.OrderBvin") %>' />
							</td>
						</tr>
				</ItemTemplate>
				<FooterTemplate>
					</table>
				</FooterTemplate>
			</asp:Repeater>
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
								<asp:Literal ID="litSubTotal" runat="server" Mode="PassThrough"></asp:Literal>
							</td>
						</tr>
                        <tr>
							<td class="formlabel">
								Tax:
							</td>
							<td class="formfield">
								<asp:Literal ID="litTax" runat="server" Mode="PassThrough"></asp:Literal>
							</td>
						</tr>
                        <tr>
							<td class="formlabel">
								Shipping:
							</td>
							<td class="formfield">
								<asp:Literal ID="litShipping" runat="server" Mode="PassThrough"></asp:Literal>
							</td>
						</tr>
                        <tr>
							<td class="formlabel">
								Grand Total:
							</td>
							<td class="formfield">
								<asp:Literal ID="litGrandTotal" runat="server" Mode="PassThrough"></asp:Literal>
							</td>
						</tr>
					</table>
				</div>         
			</div>
		</div>
		<div class="one">
			<div id="cartactions">
				<div id="cartactioncontinue">
					<a href="/" alt="Keep Shopping">
						<asp:LinkButton ID="lnkKeepShopping" runat="server" CssClass="button cube deep-red small" PostBackUrl="~/Products.aspx">Keep Shopping</asp:LinkButton>
					</a>
				</div>
				<div id="cartactioncheckout" runat="server">
    				<asp:LinkButton ID="lnkSecureShopping" runat="server" CssClass="button cube deep-red small" OnClick="lnkSecureShopping_Click">Secure Checkout</asp:LinkButton>
                    <input type="hidden" runat="server" name="shippingrate" id="shippingrate" />
				</div>
			</div>
            <!--
			<div id="cartcoupons">
				Add a Promotional Code:
				<form action="/cart/addcoupon" method="post">
					<input type="text" name="couponcode" class="textbox" />
					<asp:LinkButton ID="LinkButton3" runat="server" CssClass="button cube deep-red small">Add Coupon To Cart</asp:LinkButton>
				</form>
				<table>
				</table>
			</div>
            -->
		</div>
	</div>
</asp:Content>

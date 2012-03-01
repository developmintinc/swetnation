<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile="~/BVAdmin/BVAdminNav.master" CodeBehind="~/TestImageUpload.aspx.cs" Inherits="MerchantTribeStore.TestImageUpload" Title="Test Upload Image" %>
<%@ Register TagPrefix="uc3" TagName="MessageBox" Src="~/BVAdmin/Controls/MessageBox.ascx" %>
<%@ Register TagPrefix="uc5" TagName="ProductEditMenu" Src="~/BVAdmin/Controls/ProductEditMenu.ascx" %>

<asp:Content ID="nav" ContentPlaceHolderID="NavContent" runat="server">
    <uc5:ProductEditMenu ID="ProductEditMenu1" runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:FileUpload id="FileUploadControl" runat="server" />
        <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
        <br /><br />
        <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
    </div>
    <br/><br/>
    <div>
        <uc3:MessageBox ID="MessageBox1" runat="server" />
    </div>
</asp:Content>

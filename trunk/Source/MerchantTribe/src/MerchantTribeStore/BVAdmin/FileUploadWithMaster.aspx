<%@ Page Title="" Language="C#" MasterPageFile="~/BVAdmin/BVAdminPopup.master" AutoEventWireup="true" CodeBehind="FileUploadWithMaster.aspx.cs" Inherits="MerchantTribeStore.BVAdmin.FileUploadWithMaster" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BvcAdminPopupConent" runat="server">
    <asp:FileUpload id="FileUploadControl" runat="server" />
    <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
</asp:Content>

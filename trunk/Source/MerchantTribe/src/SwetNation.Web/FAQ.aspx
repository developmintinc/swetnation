<%@ Page Title="Swet Nation FAQ" Language="C#" MasterPageFile="~/LeftSidebar.master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="SwetNation.Web.FAQ" %>
<%@ OutputCache Duration="3600" VaryByParam="None" Location="Client" %>
<%@ Register Src="~/controls/BreadcrumbBar.ascx" TagName="BreadcrumbBar" TagPrefix="uc" %>
<%@ Register Src="~/controls/LeftSidebarNav.ascx" TagName="LeftSidebarNav" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TopBodyContent" runat="server">
    <uc:BreadcrumbBar ID="ucBreadcrumbBar" runat="server" PageName="FAQ" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftBodyContent" runat="server">
    <uc:LeftSidebarNav ID="ucLeftSidebarNav" runat="server" FAQSelected="current" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightBodyContent" runat="server">
    <div class="header-title-medium">FREQUENTLY ASKED QUESTIONS</div>

	<strong>How does Swet Nation work?</strong>

    <p>
        Swet Nation provides it's members with access to superior sports brands at special members-only discounted prices.  Brand sales last anywhere from 72 hours to 7 days long.  Members will be notified via email based on their preferred email settings the day the sale event begins.  Members sign into swetnation.com to then participate in our exclusive sales events.
    </p>

    <strong>Does membership cost anything?</strong>

    <p>
        NO WAY!  We offer our fellow athletes FREE membership. Sign up today!
    </p>

    <strong>Why does Swet Nation need my email address?</strong>

    <p>
        Swet Nation is members-only community.  Our agreement with brand partners require that we only offer our members the opportunity to participate in the sales which feature their products.  We need this information so we can ensure only our members have access to these sales events.  Don't worry, your information is kept private.  Please refer to our Privacy Policy for additional information.
    </p>

    <strong>How do I unsubscribe from Swet Nation emails?</strong>

    <p>
        Remember that Swet Nation only sends emails to inform you when amazing sales commence.  If you still wish to unsubscribe from Swet Nation emails, there is a link at the bottom of the email, that says unsubscribe - click this link to unsubscribe from our notification emails.  Please remember to check swetnation.com regularly as we are always hosting new sales events!
    </p>

    <strong>How does the Invite a Friend feature work?</strong>

    <p>
        When you invite a friend, you have the opportunity to earn Swet Nation credits!  Click on INVITE A FRIEND, GET $10 at the top of the site.  You can email friends, post your special link, or post directly to Facebook and Twitter.  Once a friend signs up through your link, they will be eligible to participate in sales events.  You earn a $10 Swet Nation credit as soon as their first purchase ships!
    </p>

    <strong>What forms of payment do you accept?</strong>

    <p>
        We accept MasterCard, Visa, American Express, Discover, and PayPal.
    </p>

    <strong>What is a CVV?</strong>

    <p>
        CVV is a security feature that is used to help protect your identity.  The CVV code helps to verify that you are in possession of your card. For MasterCard/Visa, the CVV is a 3-digit number printed on the back of your card next to the signature panel.  For American Express, the CVV is a 4-digit number printed on the front of the card, above the cards account number.
    </p>

    <strong>When will my order ship?</strong>

    <p>
        Shipping times vary with each sale.  For questions about shipping please contact <a href="mailto:support@swetnation.com">support@swetnation.com</a>
    </p>

    <strong>Does Swet Nation offer international shipping?</strong>

    <p>
        Not yet, but hopefully soon!  Our site is still in its Beta Phase which means we are concentrating on making sure our local members in the US have the best experience possible.  Stay tuned - we will let you know when we start shipping internationally.
    </p>

    <strong>What is your return policy?</strong>

    <p>
        We hope that you love your purchase.  Swet Nation is dedicated to ensuring that members are 100% satisfied.  Please check out our Return Policy page for details.
    </p>

    <strong>For all other inquiries, please contact us at <a href="mailto:support@swetnation.com">support@swetnation.com</a></strong>
</asp:Content>

<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:Meta runat="server" Name="viewport" Content="width=device-width,initial-scale=1" />
<dnn:DnnCssInclude runat="server" FilePath="css/Tidy.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/tidy.js" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="css/flexslider.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.flexslider-min.js" PathNameAlias="SkinPath" />

<%--<fortyfingers:STYLEHELPER ID="STYLEHELPER1" RemoveCssFile="default.css;module.css"  runat="server" />
--%>
<div id="tidySkin">
	<div class="pageWidth">
		<div class="buttonDiv clearfix">
		    <div class="socialButton">
		            <a href="http://www.facebook.com/summerfestivalguide" target="_blank"><img src="/Portals/_default/Skins/Tidy/images/facebook-button.png" width="32px" alt="http://www.facebook.com/summerfestivalguide"/></a>
		            <a href="http://www.twitter.com/ukfestivalguide" target="_blank"><img src="/Portals/_default/Skins/Tidy/images/twitter-button.png" width="32px" alt="http://www.twitter.com/ukfestivalguide"/></a>
		            <a href="http://plus.google.com/113524402586185730024" target="_blank"><img src="/Portals/_default/Skins/Tidy/images/google-plus-button.png" width="32px" alt="http://plus.google.com/113524402586185730024"/></a>
		    </div>
			<div class="mobileButtons">
				<ul>
					<li><a id="mobileMenuBtn" class="button">Menu</a></li>
					<li>
						<dnn:LOGIN ID="mobileLoginBtn" CssClass="button" runat="server" LegacyMode="true" />
					</li>
				</ul>
			</div>
			<div class="loginLinks">
				<dnn:USER ID="dnnUser" runat="server" LegacyMode="false" />
				<dnn:LOGIN ID="dnnLogin" CssClass="LoginLink" runat="server" LegacyMode="false" />
                <dnn:SEARCH runat="server" ID="dnnSearch" PlaceHolderText="Search here..." ShowWeb="False" ShowSite="False"  SiteIconURL="../images/sfg_search_icon.gif" />
			</div>
		</div>
        <div class="headerImage">
		    <div class="headerDiv clearfix">
			    <div class="logoDiv">
				    <dnn:LOGO ID="dnnLogo" runat="server" />
			    </div>
		    </div>
        </div>
        <div class="navDiv clearfix">
		    <dnn:MENU ID="menuTop" MenuStyle="tidyMenu" runat="server" />
	    </div>
	</div>
	<div class="contentDiv clearfix">
		<div class="pageWidth">
			<div class="breadcrumbDiv clearfix">
				<dnn:BREADCRUMB runat="server" id="dnnBreadcrumb" RootLevel="-1" Separator="" CssClass="breadCrumb" />
			</div>
			<div id="ContentPane" runat="server"></div>
		</div>
		<div class="pageWidth clearfix mainContent">
			<div id="LeftPane" class="leftPane" runat="server"></div>
			<div id="RightPane" class="rightPane" runat="server"></div>
		</div>
	</div>
	<div class="pageWidth mainContent">
		<div class="footerDiv clearfix">
            <%--<ul class="footerList">
                <li>Useful Links</li>
                <li><asp:HyperLink ID="HyperLink1" NavigateUrl="~/Event_Calendar.aspx" Text="Event Calendar" runat="server"></asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink5" NavigateUrl="~/Festival_News.aspx" Text="Latest Festival News" runat="server"></asp:HyperLink></li>                    
                <li><asp:HyperLink ID="HyperLink3" NavigateUrl="~/Competitions.aspx" Text="Competitions" runat="server"></asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink2" NavigateUrl="~/Tickets.aspx" Text="Tickets" runat="server"></asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink4" NavigateUrl="~/Jobs_at_Summer_Festival_Guide.aspx" Text="Jobs / Vacancies" runat="server"></asp:HyperLink></li>                    
            </ul>
            <ul class="footerList">
                <li>Good Reading</li>
                <li><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Reviews.aspx">Reviews</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/Interviews.aspx">Interviews</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Photos.aspx">Photos</asp:HyperLink></li>
            </ul>
            <ul class="footerList">
                <li>Popular Festivals</li>
                <li><asp:HyperLink runat="server" NavigateUrl="~/Festivals/Bestival.aspx">Bestival</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Festivals/Creamfields.aspx">Creamfields</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Festivals/Download.aspx">Download</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Festivals/Glastonbury.aspx">Glastonbury</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Festivals/Reading-and-Leeds.aspx">Reading & Leeds</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Festivals/T-In-the-Park.aspx">T in the Park</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/Festivals/V Festival.aspx">V Festival</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/Festivals/Wireless.aspx">Wireless</asp:HyperLink></li>
            </ul>
            <ul class="footerList">
                <li>Help</li>
                <li><asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/Contact_Us.aspx">Contact Us</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/Survival_Guide.aspx">Survival Guide</asp:HyperLink></li>
                <li>Follow Us</li>
                <li><asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="http://www.facebook.com/summerfestivalguide">Facebook</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="http://www.twitter.com/ukfestivalguide">Twitter</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="http://www.flickr.com/summerfestivalguide">Flickr</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="http://www.instagram.com/summerfestivalguide">Instagram</asp:HyperLink></li>
                <li><asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="http://www.youtube.com/channel/UCTTUctLwk4Ekn463OI-xvOA">Youtube</asp:HyperLink></li>

            </ul>--%>

            <div style="clear:both;" />     
            <div id="copy_style" class="footer">
                <dnn:COPYRIGHT runat="server" ID="COPYRIGHT1" CssClass="footer" />
            </div>
            <br />
            The Summer Festival Guide<br />
            Your online portal to the world of UK and Europe Summer Festivals
            <br />
            <br />
            <div class="bot_pad">
                <div id="terms_style" class="footer">
                    <dnn:PRIVACY runat="server" ID="PRIVACY1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<dnn:TERMS runat="server" ID="TERMS1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" NavigateUrl="~/Cookies.aspx" Text="Cookie Info" runat="server" CssClass="footer"></asp:HyperLink>
                </div>
            </div>
            <!--END footer -->
        </div>
	</div>
</div>
<script type="text/javascript" charset="utf-8">
    $(window).load(function () {
        $('.flexslider').flexslider(
            {
                controlNav:false,
                slideshowSpeed: 5000
            });

    });
</script>
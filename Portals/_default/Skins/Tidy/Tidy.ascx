<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LEFTMENU" Src="~/Admin/Skins/LeftMenu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Meta" Src="~/Admin/Skins/Meta.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="fortyfingers" TagName="STYLEHELPER" Src="~/DesktopModules/40Fingers/SkinObjects/StyleHelper/StyleHelper.ascx" %> 

<dnn:Meta runat="server" Name="viewport" Content="width=device-width,initial-scale=1" />
<dnn:DnnCssInclude runat="server" FilePath="css/Tidy.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/tidy.js" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="css/flexslider.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="js/jquery.flexslider-min.js" PathNameAlias="SkinPath" />

<fortyfingers:STYLEHELPER ID="STYLEHELPER1" RemoveCssFile="default.css;module.css"  runat="server" />

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
	<div class="pageWidth">
		<div class="footerDiv clearfix">
			<dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT" CssClass="copyrightCopy" />
            <div class="attribDiv"><a href="http://tidy.codeplex.com/" title="Tidy - A Free Responsive DotNetNuke Skin">Tidy - A Free Responsive DotNetNuke Skin</a></div>
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
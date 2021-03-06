<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.DDRMenu.TemplateEngine" Assembly="DotNetNuke.Web.DDRMenu" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/Admin/Skins/controlpanel.ascx" %>

<div id="DNN6">
    <div id="ContentBG">
        <div id="ControlPanelWrapper">
            <dnn:CONTROLPANEL runat="server" id="cp"  IsDockable="True" Visible="true" />
	    </div>
    </div>
    <div id="Header">
         <div id="LogoRow">
		    <dnn:LOGO id="dnnLogo" runat="server" />
	    </div> 
	    <div id="AdSlot">
	        <!--/* Advantage Media 3.6.1d - summerfestivalguide.co.uk - summerfestivalguide_728x90 - 728x90 */-->
            <script type='text/javascript' src='http://delivery.simplytechnology.net/adserver/tag.php?_t=1358&amp;_i=5153&amp;_c=INSERT_CLICK_MACRO&amp;_r=INSERT_RANDOM_NUMBER'>
            </script>
            <noscript>
                <iframe id='b76345' name='b76345' src='http://delivery.simplytechnology.net/adserver/tag.php?_t=2355&amp;_i=5153&amp;_c=INSERT_CLICK_MACRO&amp;_r=INSERT_RANDOM_NUMBER' frameborder='0' scrolling='no' width='728' height='90'>
                    <a href='http://delivery.simplytechnology.net/adserver/tag.php?_t=3356&amp;_n=b76345&amp;_i=5153&amp;_c=INSERT_CLICK_MACRO&amp;_r=INSERT_RANDOM_NUMBER' target='_blank'>
                        <img src='http://delivery.simplytechnology.net/adserver/tag.php?_t=4353&amp;_n=b76345&amp;_i=5153&amp;_c=INSERT_CLICK_MACRO&amp;_r=INSERT_RANDOM_NUMBER' border='0' alt='' />
                    </a>
                </iframe>
            </noscript>	        
	    </div>
	</div>
	<div id="MenuBar">
	    <div id="SearchPanel">
	        <dnn:SEARCH ID="dnnSearch" runat="server" UseDropDownList="true" EnableTheming="true" SiteText="Search SFG" WebText="Search Google" ShowSite="true" ShowWeb="false" SiteIconURL="~/Portals/_default/Skins/SFG.2012/images/sfg_search_icon.gif" Submit="<img src='images/SearchButton.png' alt='Search' />" />
	    </div>
	    <div id="Nav">
	        <dnn:MENU ID="MENU2" MenuStyle="Mega2DNN" runat="server" Visible="true" >
	        </dnn:MENU>	        
	    </div>  
	</div>
    <div id="Content">
        <div id="Panes">
            <div id="Breadcrumb"><dnn:TEXT runat="server" id="dnnTEXT"  CssClass="Intro" Text="You are here:" ResourceKey="Breadcrumb" /><dnn:BREADCRUMB ID="dnnBreadcrumb" runat="server" RootLevel="0" Separator="<span class='Sep'>></span>" /></div>
            <div id="Login"><dnn:LOGIN ID="LOGIN1" CssClass="LoginLink" runat="server" />&nbsp;|&nbsp;<dnn:USER ID="USER1" runat="server" /></div>
            
            <div id="ContentLeft">
                <div id="PromoPane" runat="server"></div>
                <div id="TopLeftPane" runat="server"></div>
                <div id="TopRightPane" runat="server"></div>
                <div id="ContentPane" runat="server"></div>
            </div>
            <div id="ContentRight">
		        <div id="RightContentPane" runat="server"></div>
            </div>
        </div>
    </div>
    <div id="Footer" class="footerback">
        <div id="FooterText">
            <ul>
                <li><asp:HyperLink ID="HyperLink1" NavigateUrl="~/Event_Calendar.aspx" Text="Event Calendar" runat="server"></asp:HyperLink>&nbsp;|</li>
                <li><asp:HyperLink ID="HyperLink2" NavigateUrl="~/Forum.aspx" Text="Forum" runat="server"></asp:HyperLink>&nbsp;|</li>
                <li><asp:HyperLink ID="HyperLink3" NavigateUrl="~/Competitions.aspx" Text="Competitions" runat="server"></asp:HyperLink>&nbsp;|</li>
                <li><asp:HyperLink ID="HyperLink4" NavigateUrl="~/Jobs_at_Summer_Festival_Guide.aspx" Text="Jobs / Vacancies" runat="server"></asp:HyperLink>&nbsp;|</li>                    
                <li><asp:HyperLink ID="HyperLink5" NavigateUrl="~/Festival_News.aspx" Text="Latest Festival News" runat="server"></asp:HyperLink></li>                    
            </ul>
            <div style="clear:both;" />     
            <div id="copy_style" class="footer">
                <dnn:COPYRIGHT runat="server" ID="COPYRIGHT1" CssClass="footer" />
            </div>
            <br />
            Your online portal to the world of UK and Europe Summer Festivals
            <br />
            <br />
            <div class="bot_pad">
                <div id="terms_style" class="footer">
                    <dnn:PRIVACY runat="server" ID="PRIVACY1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<dnn:TERMS runat="server" ID="TERMS1" CssClass="footer" />
                    &nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink NavigateUrl="~/Cookies.aspx" Text="Cookie Info" runat="server" CssClass="footer"></asp:HyperLink>
                </div>
            </div>
            This site was designed by Sydney based designer Liz Laughton - portfolio at <a href="http://www.pixelchicken.com"
                class="green" target="_blank">pixelchicken design</a>
        </div>
        <!--  END footer -->
    </div>    
</div>

<script type="text/javascript" src="<%=SkinPath%>s3Slider.js"></script>
<script type="text/javascript" src="<%=SkinPath %>cookiecontrol.js"></script>
<script src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
    $('#s3slider').s3Slider({ 
          timeOut: 3000
       });
   });
    cookieControl({
        introText: '<p>This site uses some unobtrusive cookies to store information on your computer.</p>',
        fullText: '<p>Some cookies on this site are essential, and the site won\'t work as expected without them. To view the cookies we store click <a href="http://www.summerfestivalguide.co.uk/cookies.aspx">here</a></p><p>By using our site you accept the terms of our <a href="http://www.summerfestivalguide.co.uk/Home/ctl/privacy.aspx">Privacy Policy</a>.</p>',
        position: 'right', // left or right
        shape: 'triangle', // triangle or diamond
        theme: 'dark', // light or dark
        startOpen: true,
        autoHide: 10000,
        subdomains: true,
        protectedCookies: [], //list the cookies you do not want deleted ['analytics', 'twitter']
        consentModel: 'information_only',
        onAccept: function() { },
        onReady: function() { },
        onCookiesAllowed: function() { },
        onCookiesNotAllowed: function() { },
        countries: 'United Kingdom, Austria, Belgium, Bulgaria, Cyprus, Czech Republic, Denmark, Estonia, Finland, France, Germany, Greece, Hungary, Ireland, Italy, Latvia, Lithuanua, Luxembourg, Malta, Netherlands, Poland, Portugal, Romania, Slovakia, Solvenia, Spain, Sweden' // Or supply a list [United Kingdom', 'Greece']
    });
</script>
<script runat="server">
  'for mega menu we need to register hoverIntent plugin, but avoid duplicate registrations
  Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    Page.ClientScript.RegisterClientScriptInclude("hoverintent", ResolveUrl("~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js"))
  End Sub
</script>

<dnn:STYLES runat="server" ID="StylesIE6" Name="IE6Minus" StyleSheet="css/ie6skin.css"
    Condition="LT IE 7" UseSkinPath="true" />

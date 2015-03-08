<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TEXT" Src="~/Admin/Skins/Text.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CONTROLPANEL" Src="~/admin/Skins/controlpanel.ascx" %>

<div id="DNN6">
    
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
	        <dnn:SEARCH ID="dnnSearch" runat="server" UseDropDownList="true" EnableTheming="true" SiteText="Search SFG" WebText="Search Google" ShowSite="true" ShowWeb="false" SiteIconURL="/Portals/_default/Skins/SFG.2012/images/sfg_search_icon.gif" Submit="<img src='images/SearchButton.png' alt='Search' />" />
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
            
            <div id="ContentFullWidth">
                <div id="ContentPane" runat="server"></div>
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
                    &nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" NavigateUrl="~/Cookies.aspx" Text="Cookie Info" runat="server" CssClass="footer"></asp:HyperLink>
                </div>
            </div>
            This site was designed by Sydney based designer Liz Laughton - portfolio at <a href="http://www.pixelchicken.com"
                class="green" target="_blank">pixelchicken design</a>
        </div>
        <!--  END footer -->
    </div>    
</div>
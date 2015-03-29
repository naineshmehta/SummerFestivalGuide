<%@ Control Language="C#" Inherits="DotNetNuke.Modules.SocialScapes.ViewSideBar" AutoEventWireup="True" CodeBehind="ViewSideBar.ascx.cs" EnableViewState="true"  %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>

<script id="tweetTemplate" type="text/html">
<li class="ssTweet">
    <div class="ssUser" id="tw<#= user.id #>" rel="<#= user.screen_name #>">
        <img class="ssUserImage" src="<#= user.profile_image_url #>" alt="<#= user.screen_name #>" />
        <img class="ssOverlay" src="<#= spacer #>" alt="" />
    </div>
    <div class="ssText"><#= text #></div>
    <div class="ssFooter">
        <span class="ssDate"><#= created_at #></span>
        <span class="ssAuthor" ><#= user.screen_name #></span>        
    </div>
</li>    
</script>

<script id="searchTemplate" type="text/html">
<li class="ssTweet">
    <div class="ssUser" id="tw<#= to_user_id #>" rel="<#= from_user #>">
        <img class="ssUserImage" src="<#= profile_image_url #>" alt="<#= from_user #>" />
        <img class="ssOverlay" src="<#= spacer #>" alt="" />
    </div>
    <div class="ssText"><#= text #></div>
    <div class="ssFooter">
        <span class="ssDate"><#= created_at #></span>
        <span class="ssAuthor" ><#= from_user #></span>        
    </div>
</li>    
</script>

<div id="panelTab" rel="sidePanel"></div>
<div id="sidePanel">
    <div id="ssLogo"></div>
    <div id="ssFollow"></div>
    <div id="ssContent">
        <% if (Model.Settings.ShowTweetbox)
           { %>
        <div id="ssTweetbox"></div>
        <% } %>
        <ul id="ssTweetlist"></ul>    
    </div>
</div>

<% if (Model.IsEditable)
   { %>
<div id="ssConfigure">
    <a href="#" >
        <span>Configure SocialScapes</span>
    </a>
</div>

<% DotNetNuke.Modules.SocialScapes.Components.DataLayer.SocialScapesSearch search = Model.Settings.SocialScapesSearches[0]; %>
<div id="ssPopupSettings">
    <div class="close"></div>
    <fieldset class="rounded">
        <h3>Configure SocialScapes</h3>
        <p>
            <label class="ssAbove">Sidebar Location</label>
            <select class="ssControl" id="ddlLocation" name="ddlLocation">
		        <option value="l" <% if (Model.Settings.Location=="l") { %>selected="selected" <% } %>>Left</option>
		        <option value="r" <% if (Model.Settings.Location=="r") { %>selected="selected" <% } %>>Right</option>
	        </select>

<%--            <!-- For some reason ViewState is not working -->
            <asp:DropDownList ID="ddlLocation" runat="server" CssClass="ssControl">
                <asp:ListItem Selected="True" Value="l">Left</asp:ListItem>
                <asp:ListItem Value="r">Right</asp:ListItem>
            </asp:DropDownList>
--%>
        </p>
        
        <p>
            <label class="ssAbove">@Anywhere AppKey</label>
            <input type="text" class="ssControl" id="txtAppkey" name="txtAppkey" value="<%= Model.Settings.AppKey %>" />
            <%--<asp:TextBox ID="txtAppkey" runat="server" CssClass="ssControl"></asp:TextBox>--%>
        </p>
        <p>
            <label class="ssAbove">Search Type</label>
            <select class="ssControl" id="ddlSearchtype" name="ddlSearchtype">
		        <option value="from" <% if (search.SearchType=="from") { %>selected="selected" <% } %>>From</option>
		        <option value="to" <% if (search.SearchType=="to") { %>selected="selected" <% } %>>To</option>
		        <option value="search" <% if (search.SearchType=="search") { %>selected="selected" <% } %>>Search</option>
	        </select>
            <%--<asp:DropDownList ID="ddlSearchtype" runat="server" CssClass="ssControl">
                <asp:ListItem Selected="True" Value="from">From</asp:ListItem>
                <asp:ListItem Value="to">To</asp:ListItem>
                <asp:ListItem Value="search">Search</asp:ListItem>
            </asp:DropDownList>--%>
        </p>
        <p>
            <label class="ssAbove">Search String</label>
            <input type="text" class="ssControl" id="txtSearch" name="txtSearch" value="<%= search.SearchString %>" />
            <%--<asp:TextBox ID="txtSearch" runat="server" CssClass="ssControl"></asp:TextBox>--%>
        </p>
        <p>
            <label class="ssAbove">Count</label>
            <input type="text" class="ssControl" id="txtCount" name="txtCount" value="<%= search.Count %>" />
            <%--<asp:TextBox ID="txtCount" runat="server" CssClass="ssControl"></asp:TextBox>--%>
        </p>
        <p>
            <label class="ssAbove">Refresh (seconds)</label>
            <input type="text" class="ssControl" id="txtRefresh" name="txtRefresh" value="<%= search.Refresh %>" />
            <%--<asp:TextBox ID="txtRefresh" runat="server" CssClass="ssControl"></asp:TextBox>--%>
        </p>
        <p>
            <%--<asp:CheckBox ID="chkTweetbox" runat="server" />--%>
            <input type="checkbox" name="chkTweetbox" id="chkTweetbox" <% if (Model.Settings.ShowTweetbox) { %>checked="checked" <% } %>><label>Show Tweetbox</label>
        </p>
        <p style="display:none">
            <%--<asp:CheckBox ID="chkTabs" runat="server" />--%>
            <input type="checkbox" name="chkTabs" id="chkTabs" <% if (Model.Settings.ShowSearchTabs) { %>checked="checked" <% } %>><label>Show Search Tabs</label>
        </p>
        <p>
            <%--<asp:CheckBox ID="chkTooltips" runat="server" />--%>
            <input type="checkbox" name="chkTooltips" id="chkTooltips" <% if (Model.Settings.ShowToolTips) { %>checked="checked" <% } %>><label>Show ToolTips</label>
        </p>
        <p class="rounded buttonbar">
            <span>
                <img <%= "src='" + ResolveUrl("~/images/save.gif") + "'" %> title="Update" alt="Update" />
                <asp:linkbutton cssclass="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" 
                            runat="server" borderstyle="none" text="Update" OnClick="cmdUpdate_Click"></asp:linkbutton>
            </span>
            <span>
                <img <%= "src='" + ResolveUrl("~/images/cancel.gif") + "'" %> title="Cancel" alt="Cancel" />
                <a href="#" class="CommandButton close" id="ssCancel"><%= Localization.GetString("cmdCancel")%></a>
            </span>
        </p>
    </fieldset>
</div>

<% } %>

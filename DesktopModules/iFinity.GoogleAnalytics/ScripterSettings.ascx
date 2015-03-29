<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ScripterSettings.ascx.cs" Inherits="iFinity.DNN.Modules.GoogleAnalytics.ScripterSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<div class="GoogleAnalyticsSettings">
    <table class="Normal">
        <tr>
            <td><dnn:Label ID="lblAnalyticsTrackingId" Text="Google Analytics Tracking ID" ResourceKey="lblAnalyticsTrackingId" runat="server" /></td>
            <td><asp:TextBox ID="txtAnalyticsTrackingId" runat="server" /></td>
        </tr>
        <tr>
            <td><dnn:Label id="lblHideScriptForGroup" Text="Hide Script for Members of Security Group" ResourceKey="lblHideScriptForGroup" runat="server" /></td>
            <td><asp:DropDownList ID="ddlSecurityGroups" runat="server" /></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblLocalHostName" Text="Don't show script for local host name" ResourceKey="lblLocalHostName" runat="server" /></td>
            <td><asp:TextBox ID="txtLocalHostName" runat="server" /></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTrackExternals" runat="server" Text="Track downloadable files and external links?" /></td>
            <td><asp:CheckBox ID="chkTrackExternals" runat="server" /></td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTimeout" runat="server" Text="Visitor Timeout Value(in minutes, whole numbers only)"/></td>
            <td><asp:TextBox ID="txtTimeout" runat="server" />
            </td>
        </tr>
        <tr>
            <td><dnn:Label ID="lblTrackRegisteredUsers" runat="server" Text="Track registered users as separate Analytics segment?" /></td>
            <td><asp:CheckBox ID="chkTrackRegisteredUsers" runat="server" /></td>
        </tr>
    </table>
</div>
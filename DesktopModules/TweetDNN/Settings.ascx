<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Settings.ascx.vb"  Inherits="Modules.TweetDNN.Settings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="100%">
<tr>
<td class="SubHead">
<dnn:label id="plScreenName" controlname="txtScreenName" runat="server" text="Screen Name:" HelpText="Entry the Twitter screen name you want to display"/>
</td>
<td>
<asp:TextBox runat="server" ID="txtScreenName"></asp:TextBox>
</td>
</tr>
<tr>
<td class="SubHead">
<dnn:label id="plCount" controlname="txtCount" runat="server" Text="Count:" HelpText="How many Twitter entries do you want to display"/>
</td>
<td>
<asp:TextBox runat="server" ID="txtCount"></asp:TextBox>
</td>
</tr>
<tr>
<td class="SubHead">
<dnn:label id="plCSS" controlname="txtCSS" runat="server" Text="CSS:" HelpText="Style until your hearts content :)"/>
</td>
<td>
<asp:TextBox runat="server" ID="txtCSS" TextMode="multiLine" Rows="20" Columns="40"></asp:TextBox>
</td>
</tr>
</table>
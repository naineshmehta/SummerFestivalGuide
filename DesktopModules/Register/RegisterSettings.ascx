<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegisterSettings.ascx.cs" Inherits="iwebs.Modules.Register.RegisterSettings" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="700" cellspacing="0" cellpadding="0" border="0">
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblAPI" runat="server" controlname="ddlAPI" suffix=""></dnn:label>
    </td>
    <td>
        <asp:DropDownList ID="ddlAPI" runat="server">
        <asp:ListItem Value="v2" Text="v2"></asp:ListItem>
        <asp:ListItem Value="v1" Text="v1"></asp:ListItem>
        </asp:DropDownList>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblPublicKey2" runat="server" controlname="txtSiteKey" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtSiteKey" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblPrivateKey2" runat="server" controlname="txtSecretKey" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtSecretKey" runat="server" width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblOptions" runat="server" controlname="txtOptions" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtOptions" runat="server" width="300"></asp:TextBox>
    </td>
  </tr>

  <tr valign="top" style="display:none;">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblWidth" runat="server" controlname="txtWidth" suffix="" ></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtWidth" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top"  style="display:none;">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblHeight" runat="server" controlname="txtHeight" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtHeight" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblCSS" runat="server" controlname="txtCSS" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtCSS" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblLanguage" runat="server" controlname="txtLanguage" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtLanguage" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblCustomTranslations" runat="server" controlname="txtCustomTranslations" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtCustomTranslations" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblTabIndex" runat="server" controlname="txtTabIndex" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtTabIndex" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblTheme" runat="server" controlname="ddlTheme" suffix=""></dnn:label>
    </td>
    <td>
        <asp:DropDownList ID="ddlTheme" runat="server">
        <asp:ListItem Value="" Text=""></asp:ListItem>
        <asp:ListItem Value="red" Text="red"></asp:ListItem>
        <asp:ListItem Value="white" Text="white"></asp:ListItem>
        <asp:ListItem Value="blackglass" Text="blackglass"></asp:ListItem>
        <asp:ListItem Value="clean" Text="clean"></asp:ListItem>
        <asp:ListItem Value="custom" Text="custom"></asp:ListItem>
        </asp:DropDownList>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblCustomThemeWidget" runat="server" controlname="txtCustomThemeWidget" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtCustomThemeWidget" runat="server"  width="300"></asp:TextBox>
    </td>
  </tr>
  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblWidgetHTML" runat="server" controlname="txtWidgetHTML" suffix=""></dnn:label>
    </td>
    <td>
        <asp:TextBox ID="txtWidgetHTML" runat="server"  width="300" TextMode="MultiLine" Rows="10"></asp:TextBox>
    </td>
  </tr>

  <tr valign="top">
    <td class="SubHead" width="200" style="white-space: nowrap">
      <dnn:label id="lblLatestRelease" runat="server" suffix=""></dnn:label>
    </td>
    <td>
        <a href="https://www.interactivewebs.com/DotNetNukeModules/ModuleDownloads.aspx" target="_blank">
        https://www.interactivewebs.com/DotNetNukeModules/ModuleDownloads.aspx
        </a>
    </td>
  </tr>
  <tr valign="top" >
    <td class="SubHead" style="white-space: nowrap;text-align:center;" colspan="2" >
       <asp:LinkButton id="btnInstall" runat="server" CssClass="dnnPrimaryAction" 
            resourcekey="btnInstall" onclick="btnInstall_Click" style="margin-top:5px;" /> &nbsp;&nbsp;&nbsp;
       <asp:LinkButton id="btnRestore" runat="server" CssClass="dnnPrimaryAction" 
            resourcekey="btnRestore" onclick="btnRestore_Click" style="margin-top:5px;"/>

        <iframe src="<%=ModulePath%>paypal.html" width="99" height="49" frameborder="0" scrolling="no" style="margin-top:5px;margin-left:10px;">

        </iframe>
    </td>
  </tr>
</table>
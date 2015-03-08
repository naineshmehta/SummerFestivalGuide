<%@ Control Language="c#" AutoEventWireup="True" Codebehind="CKEditorOptions.ascx.cs" Inherits="WatchersNET.CKEditor.CKEditorOptions" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls"  %>

<div id="SettingsBox">
  <h1>CKEditor Provider <asp:Label id="lblSettings" runat="server">Settings</asp:Label></h1>
  <hr />
  <table style="width:100%;">
    <tr>
      <td>
        <asp:Label id="lblSetFor" runat="server">Modify Settings for...</asp:Label>
      </td>
      <td>
        <asp:RadioButtonList id="rBlSetMode" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
          <asp:ListItem Text="Portal" Value="portal" Selected="True"></asp:ListItem>
          <asp:ListItem Text="Page" Value="page"></asp:ListItem>
          <asp:ListItem Text="Module Instance" Value="minstance"></asp:ListItem>
        </asp:RadioButtonList>
      </td>
      <td style="text-align:right">
         <asp:LinkButton id="lnkRemove" runat="server" Text="Delete Settings"></asp:LinkButton>
      </td>
    </tr>
    <tr>
      <td>
        <em><asp:Label id="lblImExport" runat="server" Text="Import/Export Current Settings..."></asp:Label></em>
      </td>
      <td>
        <a onclick="showDialog('ImportDialog');" id="ckeditoroptions_lnkImport" href="#"><asp:Label id="lblImport" runat="server" Text="Import"></asp:Label></a>
        &nbsp;|&nbsp;
        <a onclick="showDialog('ExportDialog');" id="ckeditoroptions_Export" href="#"><asp:Label id="lblExport" runat="server" Text="Export"></asp:Label></a>
      </td>
      <td></td>
    </tr>
  </table>
  <div id="ExportDialog" title='<%= DotNetNuke.Services.Localization.Localization.GetString("SettingsExportTitle.Text", this.SResXFile, this.SLang) %>' style="display:none">
  <asp:UpdatePanel ID="ExportDialogUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
            <ContentTemplate>
                <div><asp:DropDownList id="ExportDir" runat="server" Width="300"></asp:DropDownList></div>
                <div style="margin-top:6px"><asp:TextBox id="ExportFileName" runat="server" Width="294"></asp:TextBox></div>
                <asp:LinkButton id="ExportNow" runat="server" OnClick="Export_Click" Text="Export Now" Visible="true" CssClass="Hidden"></asp:LinkButton>
                <asp:HiddenField id="HiddenMessage" runat="server" Value=""/>
            </ContentTemplate>
            </asp:UpdatePanel>
  </div>
  <div id="ImportDialog" title='<%= DotNetNuke.Services.Localization.Localization.GetString("SettingsImportTitle.Text", this.SResXFile, this.SLang) %>' style="display:none">
  <asp:UpdatePanel ID="upNewUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
            <ContentTemplate>
                <dnn:url id="ctlImportFile" runat="server" width="300" showtabs="False" Required="False" filefilter="xml" showfiles="True" showUrls="False"
					urltype="F" showlog="False" shownewwindow="False" showtrack="False"></dnn:url>
    <asp:LinkButton id="lnkImportNow" runat="server" OnClick="Import_Click" Text="Import Now" Visible="true" CssClass="Hidden"></asp:LinkButton>
            </ContentTemplate>
            </asp:UpdatePanel>
  </div>
  
  <asp:UpdatePanel ID="upOptions" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
  <table style="width:100%;">
    <tr>
      <td>
        <asp:HiddenField id="LastTabId" runat="server" Value="1"/>
        <div id="SettingsTabs" class="SettingBox">
          <ul>
            <li><a href="#InfoTab"><asp:Label id="lblHeader" runat="server">Informations</asp:Label></a></li>
            <li><a href="#MainSetTab"><asp:label id="lblMainSet" runat="server">Main Settings</asp:label></a></li>
            <li><a href="#BrowserSetTab"><asp:label id="lblBrowsSec" runat="server">File Browser Settings</asp:label></a></li>
            <li><a href="#StylesSetTab"><asp:label id="lblStyles" runat="server">Style List</asp:label></a></li>
            <li><a href="#TemplatesSetTab"><asp:label id="lblTemplates" runat="server">Editor Templates</asp:label></a></li>
            <li><a href="#ToolbarsSetTab"><asp:label id="lblCustomToolbars" runat="server">Custom Toolbars</asp:label></a></li>
          </ul>
          <!-- Info Tab -->
          <div id="InfoTab">
            <ul>
              <li><asp:Label id="ProviderVersion" runat="server">Editor Provider Version:</asp:Label></li>
              <li><asp:Label id="lblPortal" runat="server">Portal:</asp:Label></li>
              <li><asp:Label id="lblPage" runat="server">Page:</asp:Label></li>
              <li><asp:Label id="lblModType" runat="server">Module type:</asp:Label></li>
              <li><asp:Label id="lblModName" runat="server">Module Name:</asp:Label></li>
              <li><asp:Label id="lblModInst" runat="server">Module Instance:</asp:Label></li>
              <li><asp:Label id="lblUName" runat="server">User Name:</asp:Label></li>
            </ul>
          </div>
          <!-- /Info Tab -->
    <div id="MainSetTab">
    <table id="tblMainSet">
      <tr>
	    <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblBlanktext" runat="server">Blank Text:</asp:label></td>
	    <td style="vertical-align:top;"><dnn:DnnTextBox runat="server" id="txtBlanktext" Width="395px" /></td>
      </tr>
      <tr>
	    <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblSkin" runat="server">Skin:</asp:label></td>
	    <td style="vertical-align:top;"><asp:dropdownlist id="ddlSkin" runat="server" CssClass="DefaultDropDown"></asp:dropdownlist></td>
      </tr>
      <tr>
	    <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblToolbars" runat="server">Toolbars:</asp:label></td>
	    <td style="vertical-align:top;">
	      <asp:GridView id="gvToolbars" runat="server" AutoGenerateColumns="False" Width="400px" GridLines="None" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false" HeaderStyle-Font-Italic="true">
            <Columns>
              <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                <HeaderTemplate>
                  <asp:Label id="lblRole" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemStyle Width="200"></ItemStyle>
                <ItemTemplate>
                  <asp:Label ID="lblRoleName" runat="server" Text="<%# Container.DataItem.ToString()%>"></asp:Label>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>                  
                <HeaderTemplate>
                  <asp:Label id="lblSelToolb" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                  <asp:dropdownlist id="ddlToolbars" runat="server" Width="200">
	              </asp:dropdownlist>
                </ItemTemplate>
              </asp:TemplateField>
            </Columns>
          </asp:GridView>
        </td>
      </tr>
       <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblCustomConfig" runat="server">Custom Config File</asp:label></td>
        <td style="vertical-align:top;"><dnn:url id="ctlConfigUrl" runat="server" width="400" showtabs="False" Required="False" filefilter="js" showfiles="True" showUrls="True"
					urltype="F" showlog="False" shownewwindow="False" showtrack="False"></dnn:url></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;">
          <asp:label id="lblWidth" runat="server">Editor Width:</asp:label>
        </td>
        <td style="vertical-align:top;">
          <dnn:DnnTextBox runat="server" id="txtWidth" Width="395px" />
        </td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;">
          <asp:label id="lblHeight" runat="server">Editor Height:</asp:label>
        </td>
        <td style="vertical-align:top;">
          <dnn:DnnTextBox runat="server" id="txtHeight" Width="395px" />
        </td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblUseJquery" runat="server">Use jQuery Adapter?</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="cbUseJquery" runat="server"></asp:CheckBox></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblInjectSyntaxJs" runat="server">Inject Syntax Highlighter Js Code?</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="InjectSyntaxJs" runat="server" Checked="true"></asp:CheckBox></td>
      </tr>
	</table>
  
        </div>
        <div id="BrowserSetTab">



    <table>
    <tr>
	    <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblBrowser" runat="server">File Browser:</asp:label></td>
	    <td style="vertical-align:top;">
	      <asp:dropdownlist id="ddlBrowser" runat="server" CssClass="DefaultDropDown">
	        <asp:ListItem Text="None" Value="none" Enabled="true"></asp:ListItem>
	        <asp:ListItem Text="Standard" Value="standard" ></asp:ListItem>
	        <asp:ListItem Text="CKFinder" Value="ckfinder"></asp:ListItem>
	      </asp:dropdownlist></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblBrowAllow" runat="server">File Browser Security</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBoxList ID="chblBrowsGr" runat="server"></asp:CheckBoxList></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="BrowserRootFolder" runat="server">Browser Root Folder</asp:label></td>
        <td style="vertical-align:top;"><asp:DropDownList ID="BrowserRootDir" runat="server" CssClass="DefaultDropDown"></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblBrowserDirs" runat="server">Use Subdirs for non Admins?</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="cbBrowserDirs" runat="server"></asp:CheckBox></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="UploadFolderLabel" runat="server">Default Upload Folder</asp:label></td>
        <td style="vertical-align:top;"><asp:DropDownList ID="UploadDir" runat="server" CssClass="DefaultDropDown"></asp:DropDownList></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblResizeWidth" runat="server">Default Image Resize Width:</asp:label></td>
        <td style="vertical-align:top;"><dnn:DnnTextBox ID="txtResizeWidth" runat="server" style="width:395px" />px</td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblResizeHeight" runat="server">Default Image Resize Height:</asp:label></td>
        <td style="vertical-align:top;"><dnn:DnnTextBox ID="txtResizeHeight" runat="server" />px</td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblAutoCreateFileThumbNails" runat="server">Auto Create File ThumbNails</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="AutoCreateFileThumbNails" runat="server"></asp:CheckBox></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblUseAnchorSelector" runat="server">Use Anchor Selector</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="UseAnchorSelector" runat="server" Checked="True"></asp:CheckBox></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblShowPageLinksTabFirst" runat="server">Show Page Links Tab First</asp:label></td>
        <td style="vertical-align:top;"><asp:CheckBox ID="ShowPageLinksTabFirst" runat="server"></asp:CheckBox></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="FileListViewModeLabel" runat="server">File List View Mode</asp:label></td>
        <td style="vertical-align:top;"><asp:dropdownlist id="FileListViewMode" runat="server" CssClass="DefaultDropDown">
	        <asp:ListItem Text="DetailView" Value="DetailView" Enabled="true"></asp:ListItem>
	        <asp:ListItem Text="ListView" Value="ListView" ></asp:ListItem>
	        <asp:ListItem Text="IconsView" Value="IconsView"></asp:ListItem>
	      </asp:dropdownlist>
        </td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="FileListPageSizeLabel" runat="server">File List Page Size</asp:label></td>
        <td style="vertical-align:top;"><asp:TextBox ID="FileListPageSize" runat="server"></asp:TextBox></td>
      </tr>
    </table>
 
        </div>
        <div id="StylesSetTab">



    <table>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblStylesURL" runat="server">List of available styles for the editor</asp:label></td>
        <td style="vertical-align:top;"><dnn:url id="ctlStylesURL" runat="server" width="400" showtabs="False" Required="False" filefilter="js" showfiles="True" showUrls="True"
					urltype="F" showlog="False" shownewwindow="False" showtrack="False"></dnn:url></td>
      </tr>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblCssurl" runat="server">Editor area CSS</asp:label></td>
        <td style="vertical-align:top;"><dnn:url id="ctlCssurl" runat="server" width="400" showtabs="False" Required="False" filefilter="css" showfiles="True" showUrls="True"
					urltype="F" showlog="False" shownewwindow="False" showtrack="False"></dnn:url></td>
      </tr>
    </table>
  
        </div>
        <div id="TemplatesSetTab">



    <table>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;"><asp:label id="lblTemplFiles" runat="server">Editor Templates File</asp:label></td>
        <td style="vertical-align:top;"><dnn:url id="ctlTemplUrl" runat="server" width="400" showtabs="False" Required="False" filefilter="js" showfiles="True" showUrls="True"
					urltype="F" showlog="False" shownewwindow="False" showtrack="False"></dnn:url></td>
      </tr>
    </table>
  
        </div>
        <div id="ToolbarsSetTab">



    <table>
      <tr>
        <td style="width:250px; vertical-align:top;font-weight:bold;">
          <asp:label id="lblToolbarList" runat="server">Custom Toolbars List</asp:label>
        </td>
        <td style="vertical-align:top;">
          <asp:DropDownList id="dDlCustomToolbars" runat="server" Width="362"></asp:DropDownList>&nbsp;
          <asp:ImageButton id="iBEdit" runat="server" ImageUrl="~/images/edit.gif" />
          <asp:ImageButton id="iBDelete" runat="server" ImageUrl="~/images/delete.gif" />
        </td>
      </tr>
      <tr>
        <td>
           <asp:label id="lblToolbName" runat="server">Add/Edit Toolbar Name</asp:label>
        </td>
        <td>
          <dnn:DnnTextBox id="dnnTxtToolBName" runat="server" Width="372"  />&nbsp;
          <asp:ImageButton id="iBAdd" runat="server" ImageUrl="~/images/add.gif" />
          <asp:ImageButton id="iBCancel" runat="server" ImageUrl="~/images/cancel.gif" Visible="false" />
        </td>
      </tr>
      <tr>
       <td style="vertical-align:top;">
           <asp:label id="lblToolbSet" runat="server">Add/Edit Toolbar Set</asp:label><br />
            <a onclick="showDialog('ToolbarGuide');" id="lnkToolbarGuide" href="#"><asp:Label id="lblToolbarGuideLnk" runat="server" Text="Description"></asp:Label></a>
        </td>
        <td>
          <dnn:DnnTextBox id="dnnTxtToolbars" runat="server" TextMode="MultiLine" Width="400" Height="250" />
          
          <div id="ToolbarGuide" title="Toolbar Guide" style="display:none">
            <asp:Label id="lblToolbarGuide" runat="server"></asp:Label>
          </div>
        </td>
      </tr>
      <tr>
       <td style="vertical-align:top;">
           <asp:label id="lblToolbarPriority" runat="server">Toolbar Set Priority</asp:label>
        </td>
        <td>
          <asp:DropDownList id="dDlToolbarPrio" runat="server">
                      <asp:ListItem Text="01" Value="01"></asp:ListItem>
            <asp:ListItem Text="02" Value="02"></asp:ListItem>
            <asp:ListItem Text="03" Value="03"></asp:ListItem>
            <asp:ListItem Text="04" Value="04"></asp:ListItem>
            <asp:ListItem Text="05" Value="05"></asp:ListItem>
            <asp:ListItem Text="06" Value="06"></asp:ListItem>
            <asp:ListItem Text="07" Value="07"></asp:ListItem>
            <asp:ListItem Text="08" Value="08"></asp:ListItem>
            <asp:ListItem Text="09" Value="09"></asp:ListItem>
            <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="11" Value="11"></asp:ListItem>
            <asp:ListItem Text="12" Value="12"></asp:ListItem>
            <asp:ListItem Text="13" Value="13"></asp:ListItem>
            <asp:ListItem Text="14" Value="14"></asp:ListItem>
            <asp:ListItem Text="15" Value="15"></asp:ListItem>
            <asp:ListItem Text="16" Value="16"></asp:ListItem>
            <asp:ListItem Text="17" Value="17"></asp:ListItem>
            <asp:ListItem Text="18" Value="18"></asp:ListItem>
            <asp:ListItem Text="19" Value="19"></asp:ListItem>
            <asp:ListItem Text="20" Value="20"></asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
    </table>
          </div>
          <!-- / Toolbars Set Tab -->
        </div>
      </td>
    </tr>
  </table>
</div>

<div>
  <p style="text-align:center;font-weight:bold;"><asp:Label id="lblInfo" runat="server"></asp:Label></p>
  </ContentTemplate>
        </asp:UpdatePanel>
  <asp:Button id="btnOk" CssClass="DefaultButton" runat="server" Text="OK" />&nbsp;<asp:Button id="btnCancel" runat="server" Text="Close" />
</div>


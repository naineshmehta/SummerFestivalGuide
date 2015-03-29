<%@ Control Language="C#" Inherits="ITM.Modules.UserDirectory.ViewUserDirectory"
    AutoEventWireup="true" CodeBehind="ViewUserDirectory.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link rel="Stylesheet" href="DesktopModules/UserDirectory/module.css"/>
<div>
    <!-- Content Start -->
    <telerik:RadAjaxManager ID="radAjaxManager" runat="server" OnAjaxRequest="radAjaxManager_OnAjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="panelListView">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panelListView" />
                    <telerik:AjaxUpdatedControl ControlID="listviewUsers" />
                    <telerik:AjaxUpdatedControl ControlID="radWindowDetailedInfo" />
                    <telerik:AjaxUpdatedControl ControlID="lvDetailedInfoWindow" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="panelTableView">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panelTableView" LoadingPanelID="ajaxLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="gridViewUsers" />
                    <telerik:AjaxUpdatedControl ControlID="gridTable" />
                    <telerik:AjaxUpdatedControl ControlID="tableDetailedInfo" />
                    <telerik:AjaxUpdatedControl ControlID="tableDetailedInfoWindow" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="comboboxUsersSearch">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="panelListView" />
                    <telerik:AjaxUpdatedControl ControlID="panelTableView" LoadingPanelID="ajaxLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="gridTable" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridTable">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridTable" LoadingPanelID="ajaxLoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="ajaxLoadingPanel" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <div>
        <asp:Panel runat="server" ID="panelHintMessage" CssClass="msg_box red" Visible="false">
            <asp:Literal ID="literalHintMessage" runat="server" />
        </asp:Panel>
    </div>
    <!-- Start Search User -->
    <div>
        <table border="0" cellpadding="0" cellspacing="3">
            <tr>
                <td>
                    <telerik:RadComboBox ID="comboboxUsersSearch" runat="server" AllowCustomText="true"
                        Width="320px" DropDownWidth="375px" Height="155px" ShowToggleImage="false" EmptyMessage="Search user"
                        HighlightTemplatedItems="true" OnItemDataBound="comboboxUserSearch_OnItemDataBound"
                        OnClientDropDownOpening="comboboxUsersSearch_OnClientDropDownOpening">
                        <HeaderTemplate>
                            <table style="width: 360px; text-align: left;" cellpadding="0" cellspacing="1">
                                <tr>
                                    <td style="width: 120px;">
                                        Username
                                    </td>
                                    <td style="width: 120px;">
                                        FirstName
                                    </td>
                                    <td style="width: 120px;">
                                        LastName
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table style="width: 360px; text-align: left;" cellpadding="0" cellspacing="1">
                                <tr>
                                    <td style="width: 120px;">
                                        <%#DataBinder.Eval(Container.DataItem, "UserName") %>
                                    </td>
                                    <td style="width: 120px;">
                                        <%#DataBinder.Eval(Container.DataItem, "UserFirstName") %>
                                    </td>
                                    <td style="width: 120px;">
                                        <%#DataBinder.Eval(Container.DataItem, "UserLastName") %>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadComboBox>
                </td>
            </tr>
        </table>
    </div>
    <!-- End Search User -->
    <div class="divCardView">
        <!-- Card View -->
        <asp:Panel ID="panelListView" runat="server" Width="100%" Visible="false">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="70%">
                        <table border="0" cellpadding="0" cellspacing="0" width="620px">
                            <tr>
                                <td width="620px">
                                    <telerik:RadListView ID="listviewUsers" runat="server" ItemPlaceholderID="UsersContainer"
                                        AllowPaging="true" OnNeedDataSource="listviewUsers_OnNeedDataSource" PageSize="8"
                                        Width="620px">
                                        <LayoutTemplate>
                                            <fieldset style="width: 620px; border: none;">
                                                <asp:PlaceHolder ID="UsersContainer" runat="server" />
                                                <!-- Paging -->
                                                <div style="float: left; position: relative;">
                                                    <asp:Button ID="btnFirst" Text="First" runat="server" CommandName="Page" CommandArgument="First"
                                                        Enabled="<%#Container.CurrentPageIndex > 0 %>" CssClass="pageButton" />
                                                    <asp:Button ID="btnPrev" Text="Prev" runat="server" CommandName="Page" CommandArgument="Prev"
                                                        Enabled="<%#Container.CurrentPageIndex > 0 %>" CssClass="pageButton" />
                                                    <span style="vertical-align: top; position: relative; top: 8px">Page
                                                        <%#Container.CurrentPageIndex + 1 %>
                                                        of
                                                        <%#Container.PageCount %></span>
                                                    <asp:Button ID="btnNext" Text="Next" runat="server" CommandName="Page" CommandArgument="Next"
                                                        Enabled="<%#Container.CurrentPageIndex + 1 < Container.PageCount %>" CssClass="pageButton" />
                                                    <asp:Button ID="btnLast" Text="Last" runat="server" CommandName="Page" CommandArgument="Last"
                                                        Enabled="<%#Container.CurrentPageIndex + 1 < Container.PageCount %>" CssClass="pageButton" />
                                                    <span style="vertical-align: top; position: relative; top: 8px">Page Size:</span>
                                                    <telerik:RadComboBox runat="server" ID="cmbPageSize" Width="40px" OnSelectedIndexChanged="cmbPageSize_OnSelectedIndexChanged"
                                                        AutoPostBack="true" SelectedValue="<%#Container.PageSize %>" CssClass="pageButton">
                                                        <Items>
                                                            <telerik:RadComboBoxItem Text="8" Value="8" />
                                                            <telerik:RadComboBoxItem Text="12" Value="12" />
                                                            <telerik:RadComboBoxItem Text="16" Value="16" />
                                                        </Items>
                                                    </telerik:RadComboBox>
                                                </div>
                                                <!-- Paging -->
                                            </fieldset>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <fieldset style="float: left; width: 280px; height: 135px; margin-top: 5px; margin-right: 5px;
                                                margin-left: 0px;">
                                                <legend>
                                                    <asp:LinkButton Text='<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserFullName %>'
                                                        runat="server" ID="linkbtnUserFullName" OnClientClick='<%# GetPopupHandlerString((Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserID)  %>'
                                                        Font-Bold="true" />
                                                </legend>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <!-- basic infos -->
                                                        <td style="width: 190px; vertical-align: middle;">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td style="width: 25%; font-weight: bold">
                                                                        User:
                                                                    </td>
                                                                    <td style="width: 75%">
                                                                        <%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserName %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 25%; font-weight: bold">
                                                                        Email:
                                                                    </td>
                                                                    <td style="width: 75%">
                                                                        <asp:HyperLink ID="linkUserEmail" NavigateUrl='mailto:<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserEmailAddress %>'
                                                                            Text='<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserEmailAddress %>'
                                                                            runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 25%; font-weight: bold">
                                                                        Phone:
                                                                    </td>
                                                                    <td style="width: 75%">
                                                                        <%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserPhone %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 25%; font-weight: bold">
                                                                        Web:
                                                                    </td>
                                                                    <td style="width: 75%">
                                                                        <asp:HyperLink ID="linkUserWeb" NavigateUrl='<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserWeb %>'
                                                                            Text='<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserWeb %>'
                                                                            runat="server" Target="_blank" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="font-weight: bold">
                                                                        <%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserAddress %>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <!-- End basic infos -->
                                                        <!-- photo -->
                                                        <td style="width: 90px;">
                                                            <telerik:RadBinaryImage ID="imageUser" runat="server" ImageUrl='<%#(Container.DataItem as ITM.Modules.UserDirectory.Components.UserInfos).UserPhotoUrl %>'
                                                                AutoAdjustImageControlSize="false" Width="90px" Height="110px" CssClass="radBinaryImage" />
                                                        </td>
                                                        <!-- End photo -->
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </ItemTemplate>
                                    </telerik:RadListView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <!-- Card view -->
    <!-- Table view -->
    <div class="divTableView">
        <asp:Panel runat="server" ID="panelTableView" Width="100%" Visible="false">
            <telerik:RadGrid ID="gridTable" runat="server" AllowSorting="true" AutoGenerateColumns="false"
                EnableViewState="true" OnNeedDataSource="gridTable_OnNeedDataSource" PageSize="10"
                Width="955" AllowPaging="true">
                <PagerStyle Mode="NextPrevAndNumeric" />
                <MasterTableView AutoGenerateColumns="false" ClientDataKeyNames="UserID">
                    <Columns>
                    </Columns>
                </MasterTableView>
                <ClientSettings>
                    <Selecting AllowRowSelect="true" />
                    <Scrolling AllowScroll="true" />
                    <ClientEvents OnRowSelected="gridviewUsers_ClientRowSelected" />
                </ClientSettings>
            </telerik:RadGrid>
        </asp:Panel>
    </div>
    <!-- Table View -->
    <!-- Content End -->
</div>
<br style="clear: both; line-height: 0;" />
<telerik:RadWindowManager ID="winManager" Width="675" Height="450" VisibleStatusbar="false"
    Behaviors="Close,Move, Resize" runat="server" EnableShadow="true" Skin="itm"
    EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="true" VisibleTitlebar="true">
</telerik:RadWindowManager>
<script type="text/javascript">
    function linkbtnUserFullName_OnClientClick(userID) {
        //alert(userID);
        // prepare url
        var url = window.location.href;
        url = url.replace("http://", "");
        var urlParts = url.split("/");
        var len = parseInt(urlParts.length);
        var newUrl = "";
        for (var i = 0; i < len - 1; i++) {
            newUrl += urlParts[i] + "/";
        }
        newUrl = "http://" + newUrl;
        var strTemp = "DesktopModules/UserDirectory/UserInfosDetail.aspx?UserID=";
        newUrl = newUrl + strTemp;
        //alert(newUrl);
        var wnd = window.radopen(newUrl + userID, null);
        wnd.set_modal(true);
    }

    function gridviewUsers_ClientRowSelected(sender, args) {
        // prepare url
        var url = window.location.href;
        url = url.replace("http://", "");
        var urlParts = url.split("/");
        var len = parseInt(urlParts.length);
        var newUrl = "";
        for (var i = 0; i < len - 1; i++) {
            newUrl += urlParts[i] + "/";
        }
        newUrl = "http://" + newUrl;
        var strTemp = "DesktopModules/UserDirectory/UserInfosDetail.aspx?UserID=";
        newUrl = newUrl + strTemp;
        //alert(newUrl);
        var id = args.getDataKeyValue("UserID");
        //alert(id);
        var wnd = window.radopen(newUrl + id, null);
        wnd.set_modal(true);
        // get clicked row
        var index = args.get_itemIndexHierarchical();
        var item = args.get_tableView().get_dataItems()[index];
        var rowElement = item.get_element();
        // get coordinates of the row and reposition the window relative to it
        var bounds = $telerik.getBounds(rowElement);
        //alert("x: " + bounds.x + "y: " + bounds.y);
        window.moveTo(x, y);
    }
</script>
<%--<asp:Button runat="server" Text="Generate Test Users" ID="btnGenerateUsers" OnClick="btnGenerateUsers_OnClick" 
 Visible="false"/>--%>

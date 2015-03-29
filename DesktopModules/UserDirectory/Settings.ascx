<%@ Control Language="C#" AutoEventWireup="false" Inherits="ITM.Modules.UserDirectory.Settings"
    CodeBehind="Settings.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<style type="text/css">
    ul li
    {
        list-style-type: none;
    }
</style>
<telerik:RadTabStrip ID="tabStrip" runat="server" SelectedIndex="0" MultiPageID="multiPage"
    Orientation="VerticalLeft" Style="float: left">
    <Tabs>
        <telerik:RadTab Text="Profiles for Popup">
        </telerik:RadTab>
        <telerik:RadTab Text="Profiles for Table">
        </telerik:RadTab>
        <telerik:RadTab Text="User Roles">
        </telerik:RadTab>
        <telerik:RadTab Text="Display and Search Options">
        </telerik:RadTab>
    </Tabs>
</telerik:RadTabStrip>
<telerik:RadMultiPage runat="server" ID="multiPage" SelectedIndex="0" CssClass="multiPage">
    <telerik:RadPageView runat="server" ID="pageProfileProperties">
        <table border="0" cellpadding="1" cellspacing="5" width="100%">
            <tr>
                <td>
                    <asp:LinkButton Text="Select all" runat="server" ID="btnSelectAll" Font-Bold="true"
                        OnClick="btnSelectAll_OnClick" ToolTip="Select all profiles, which will be displayed in popup window" /><span>
                            / </span>
                    <asp:LinkButton Text="Unselect all" runat="server" ID="btnUnselectAll" Font-Bold="true"
                        OnClick="btnUnselectAll_OnClick" ToolTip="Unselect all profiles, which will be displayed in popup window" />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadListBox ID="listboxProfileProperties" CheckBoxes="true" runat="server"
                        SelectionMode="Single" Width="75%" ToolTip="Checked: corresponding profile will be displayed in popup window">
                    </telerik:RadListBox>
                </td>
            </tr>
        </table>
    </telerik:RadPageView>
    <telerik:RadPageView runat="server" ID="pageProfilePropertiesTable">
        <table border="0" cellpadding="0" cellspacing="5" width="100%">
            <tr>
                <td>
                    <asp:CheckBox Text="Display Email as Hyperlink" runat="server" ID="cbEmailAsLinkTable"
                        Font-Bold="true" ToolTip="Checked: display email as hyperlink " />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton Text="Select all" runat="server" ID="btnSelectAllProfilesTable" OnClick="btnSelectAllProfilesTable_OnClick"
                        Font-Bold="true" ToolTip="Select all profiles, which will be displayed in table" /><span>
                            / </span>
                    <asp:LinkButton Text="Unselect all" runat="server" ID="btnUnselectAllProfilesTable"
                        OnClick="btnUnselectAllProfilesTable_OnClick" Font-Bold="true" ToolTip="Unselect all profiles, which will be displayed in table" />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadListView ID="listProfiles" runat="server" ItemPlaceholderID="placeholderProfiles">
                        <LayoutTemplate>
                            <table border="0" cellpadding="0" cellspacing="3" width="100%">
                                <thead>
                                    <tr>
                                        <th>
                                            <dnn:Label runat="server" ID="lblProfileSelectOption" />
                                        </th>
                                        <th>
                                            <dnn:Label runat="server" ID="lblProfileName" />
                                        </th>
                                        <th>
                                            <dnn:Label runat="server" ID="lblProfileMaxLength" />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder runat="server" ID="placeholderProfiles" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbSelectProfile" runat="server" Checked="true" ToolTip="Checked: corresponding profile will be displayed" />
                                </td>
                                <td>
                                    <asp:Label ID="lblProfile" runat="server" Text='<%#Container.DataItem %>' />
                                </td>
                                <td>
                                    <telerik:RadNumericTextBox ID="tbProfileLength" runat="server" Type="Number" MinValue="0"
                                        NumberFormat-DecimalDigits="0" Value="0">
                                    </telerik:RadNumericTextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </telerik:RadListView>
                </td>
            </tr>
        </table>
    </telerik:RadPageView>
    <telerik:RadPageView runat="server" ID="pageUserRoles">
        <div style="margin-left: 5px; margin-top: 10px;">
            <span style="font-weight: bold;">Add/Remove User Roles</span>
        </div>
        <asp:DataList ID="dlUserRoles" runat="server">
            <ItemTemplate>
                <table border="0" cellpadding="5px" cellspacing="0" width="100%">
                    <tr>
                        <!-- User Roles -->
                        <td width="50%">
                            <asp:Label ID="lblUserRoleName" runat="server" Text='<%#Container.DataItem %>' />
                        </td>
                        <!-- Add/Remove-->
                        <td>
                            <asp:RadioButtonList ID="rblistUserRoles" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Table">
                                <asp:ListItem Text="Add" Value="Add" />
                                <asp:ListItem Text="Remove" Value="Remove" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </telerik:RadPageView>
    <telerik:RadPageView runat="server" ID="pageDisplayOptions">
        <div style="margin-left: 5px; margin-top: 10px;">
            <span style="font-weight: bold;">Display Options</span>
        </div>
        <asp:RadioButtonList ID="btnListOptions" runat="server">
            <asp:ListItem Text="Search Box and Table" Selected="True" />
            <asp:ListItem Text="Search Box and Business Cards" />
        </asp:RadioButtonList>
        <div style="margin-left: 5px; margin-top: 10px;">
            <span style="font-weight: bold;">Search Options</span>
        </div>
        <table border="0" cellpadding="1" cellspacing="5">
            <tr>
                <td>
                    <asp:CheckBox Text="Display Dropdownlist of Search Box" runat="server" ID="cbShowDropDownList"
                        Checked="true" ToolTip="Checked: typing in search box, hints will be displayed in dropdownlist" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox Text="Show All Records Before Search" runat="server" ID="cbShowAllBeforeSearch"
                        ToolTip="Checked: display user profile records immediately" />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadNumericTextBox ID="tbSearchLength" MinValue="1" NumberFormat-DecimalDigits="0"
                        Type="Number" Label="Search Length: " Value="1" runat="server" ToolTip="Choose the number of characters required before Search begins looking for records">
                    </telerik:RadNumericTextBox>
                </td>
            </tr>
        </table>
    </telerik:RadPageView>
</telerik:RadMultiPage>
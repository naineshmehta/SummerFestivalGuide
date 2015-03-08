<%@ Control Language="vb" AutoEventWireup="false" CodeFile="LanguageEditor.ascx.vb" Inherits="DotNetNuke.Services.Localization.LanguageEditor" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke.WebControls" %>
<style type="text/css">
    .Pending  
    {
        BORDER-LEFT-COLOR: red; 
        BORDER-BOTTOM-COLOR: red; 
        BORDER-TOP-STYLE: solid; 
        BORDER-TOP-COLOR: red; 
        BORDER-RIGHT-STYLE: solid; 
        BORDER-LEFT-STYLE: solid; 
        BORDER-RIGHT-COLOR: red; 
        BORDER-BOTTOM-STYLE: solid 
    }
	</style>
<table id="Table2" cellspacing="5" width="100%" border="0">
    <tr>
        <td valign="top" nowrap>
            <p>
                <asp:Panel ID="Panel1" Width="195px" runat="server">
                    <dnn:DnnTree ID="DNNTree" runat="server" DefaultNodeCssClassOver="Normal" CssClass="Normal" DefaultNodeCssClass="Normal" />
                </asp:Panel>
            </p>
        </td>
        <td style="text-align:center; vertical-align:top">
                <table id="Table1" cellspacing="1" cellpadding="1" border="0">
                    <tr>
                        <td width="150" valign="top"><asp:Label ID="lblSelected" runat="server" CssClass="SubHead" resourcekey="SelectedFile" /></td>
                        <td valign="top"><asp:Label ID="lblResourceFile" runat="server" CssClass="NormalBold" /></td>
                    </tr>
                    <tr id="rowMode" runat="server">
                        <td width="150" class="SubHead" valign="top"><dnn:Label ID="lbMode" runat="server" Text="Available Locales" ControlName="cboLocales" /></td>
                        <td valign="top">
                            <asp:RadioButtonList ID="rbMode" runat="server" CssClass="Normal" AutoPostBack="True" RepeatColumns="3" RepeatDirection="Horizontal">
                                <asp:ListItem resourcekey="ModeSystem" Value="System" Selected="True" />
                                <asp:ListItem resourcekey="ModeHost" Value="Host" />
                                <asp:ListItem resourcekey="ModePortal" Value="Portal" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead" valign="top" colspan="2"><asp:CheckBox ID="chkHighlight" runat="server" resourcekey="Highlight" AutoPostBack="True" TextAlign="Left" /></td>
                    </tr>
                </table>
                <br />
                <asp:DataGrid ID="dgEditor" runat="server" CssClass="Normal" GridLines="None" CellPadding="3"
                    AutoGenerateColumns="False">
                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                    <HeaderStyle Font-Bold="True"></HeaderStyle>
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <table cellspacing="2" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td width="100%" bgcolor="silver" colspan="3">
                                            <asp:Label ID="Label3" runat="server" CssClass="NormalBold" resourcekey="ResourceName"
                                                Font-Bold="True">
												Resource name:</asp:Label>
                                            <asp:Label ID="lblName" runat="server" CssClass="Normal">
												<%# DataBinder.Eval(Container, "DataItem.key") %>
                                            </asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="300"><asp:Label ID="Label4" runat="server" CssClass="NormalBold" resourcekey="Value" Font-Bold="True"/></td>
                                        <td></td>
                                        <td width="100%">
                                            <table border="0">
                                                <tr>
                                                    <td>
                                                        <dnn:SectionHead ID="dshDef" runat="server" Text="" IncludeRule="False" Section="divDef"
                                                            CssClass="Normal" IsExpanded='<%# ExpandDefault(DataBinder.Eval(Container, "DataItem.value"))  %>'>
                                                        </dnn:SectionHead>
                                                    </td>
                                                    <td><asp:Label ID="Label5" runat="server" CssClass="NormalBold" resourcekey="DefaultValue" Font-Bold="True" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" width="300">
                                            <asp:TextBox ID="txtValue" Width="300px" runat="server" TextMode="MultiLine" Height="30px"></asp:TextBox></td>
                                        <td valign="top" nowrap>
                                            <asp:HyperLink ID="lnkEdit" runat="server" CssClass="CommandButton" NavigateUrl='<%# OpenFullEditor(DataBinder.Eval(Container, "DataItem.key")) %> '>
                                                <asp:Image runat="server" AlternateText="Edit" ID="imgEdit" ImageUrl="~/images/uprt.gif"
                                                    resourcekey="cmdEdit"></asp:Image>
                                            </asp:HyperLink>&nbsp;
                                        </td>
                                        <td valign="top" width="100%">
                                            <table id="divDef" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                                                <tr>
                                                    <td><asp:Label ID="lblDefault" runat="server" CssClass="Normal"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn Visible="False" DataField="key"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
                <br />
        </td>
    </tr>
    <tr>
        <td style="text-align:center" colspan="2">
            <dnn:CommandButton ID="cmdUpdate" runat="server" CssClass="CommandButton" resourcekey="cmdUpdate" ImageUrl="~/images/save.gif" />&nbsp;
            <dnn:CommandButton ID="cmdDelete" runat="server" CssClass="CommandButton" resourcekey="cmdDelete" ImageUrl="~/images/delete.gif" CausesValidation="false" />&nbsp;
            <dnn:CommandButton ID="cmdCancel" runat="server" CssClass="CommandButton" resourcekey="cmdCancel" ImageUrl="~/images/lt.gif" CausesValidation="false" />
        </td>
    </tr>
</table>

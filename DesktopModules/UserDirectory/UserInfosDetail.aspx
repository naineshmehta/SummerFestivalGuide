<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfosDetail.aspx.cs"
    Inherits="ITM.Modules.UserDirectory.UserInfosDetail" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="module.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="radScriptManager" runat="server" />
    <div class="ud_left">
        <table class="detailBasic">
            <tr class="basicFirstRow">
                <td>
                    <telerik:RadBinaryImage ID="detailImage" runat="server" AutoAdjustImageControlSize="false"
                        Width="165px" Height="205px" BorderWidth="1px" BorderColor="#EAEAEA" />
                </td>
            </tr>
            <tr>
                <td>
                    <table class="detailSecondTable" cellspacing="5px">
                        <tr>
                            <td scope="row">
                                <span class="basicSpan">LastName:</span>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="detailLastName" />
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <span class="basicSpan">FirstName:</span>
                            </td>
                            <td>
                                <asp:Label ID="detailFirstName" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">
                                <span class="basicSpan">Username:</span>
                            </td>
                            <td>
                                <asp:Label ID="detailUsername" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="ud_right">
        <telerik:RadListView runat="server" ItemPlaceholderID="detailSelectProfiles" OnNeedDataSource="lvSelectProfiles_OnNeedDataSource"
            ID="lvSelectProfiles">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="detailSelectProfiles" />
            </LayoutTemplate>
            <ItemTemplate>
                <table class="detailProfiles">
                    <tr>
                        <td style="width: 35%; color: #333333;">
                            <asp:Label Text='<%#Eval("PropertyName", "{0}:") %>' runat="server" />
                        </td>
                        <td style="width: 65%">
                            <asp:Label Text='<%#Eval("PropertyValue") %>' runat="server" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </telerik:RadListView>
    </div>
    </form>
</body>
</html>

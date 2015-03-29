<%@ Control Inherits="Modules.Simple.Tweets.Settings" CodeFile="Settings.ascx.vb" language="vb" AutoEventWireup="false" Explicit="true" %>

<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
    
<script src="/DesktopModules/Simple Tweet/js/iColorPicker.js" type="text/javascript"></script>

<div class="dnnForm" id="panels-tweets">
    <h2 id="MainSimpleTweetInformation" class="dnnFormSectionHead"><a href="#">Main Tweet Configuration</a></h2>
    <fieldset class="dnnClear">
        <div class="dnnRight" style="width:99%;margin-left:2%">
            <table cellspacing="2" cellpadding="2" border="0" class="Normal" style="width:100%">
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTwitterName" ResourceKey="rkTwitterName" Text="Source" runat="server" Suffix=":" ControlName="txtTwitterName" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtTwitterName" runat="server" CssClass="Normal" MaxLength="200" Width="200"/>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblPollForNew" ResourceKey="rkPollForNew" Text="Checkbox" runat="server" Suffix=":" ControlName="chkHyperLink" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkPollForNew" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblIncludeScrollBar" ResourceKey="rkIncludeScrollBar" Text="Checkbox" runat="server" Suffix=":" ControlName="chkIncludeScrollBar" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkIncludeScrollBar" runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblBehavior" ResourceKey="rkBehavior" Text="RadiobuttonList" runat="server" Suffix=":" ControlName="rblBehaviour" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:RadioButtonList ID="rblBehaviour" runat="server" TextAlign="Left" AutoPostBack="True" OnSelectedIndexChanged="rblBehaviour_SelectedIndexChanged" >
                            <asp:listitem value="All" resourcekey="rkBehaviourFalse" />
                            <asp:listitem value="Default" resourcekey="rkBehaviourTrue" />
                        </asp:RadioButtonList>
                        <div id="divTimedSettings" runat="server" visible="false">
                            <table cellspacing="2" cellpadding="2" border="0" class="Normal" style="width:50%" align="left">
                                <tr>
                                    <td class="SubHead">
                                        <dnn:Label class="Normal" ID="lblLoopResults" ResourceKey="rkLoopResults" Text="Checkbox" runat="server" Suffix=":" ControlName="chkLoopResults" />
                                    </td>
                                    <td class="NormalTextBox" >
                                        <asp:CheckBox ID="chkLoopResults" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SubHead">
                                        <dnn:Label class="Normal" ID="lblTweetInterval" ResourceKey="rkTweetInterval" Text="Checkbox" runat="server" Suffix=":" ControlName="txtTweetInterval" />
                                    </td>
                                    <td class="NormalTextBox" >
                                        <asp:TextBox ID="txtTweetInterval" runat="server" CssClass="Normal" MaxLength="5" Width="30"/> seconds
                                    </td>
                                </tr>
                                <tr>
                                    <td class="NormalTextBox" colspan="2">
                                        <asp:RegularExpressionValidator ID="valTweetInterval" ControlToValidate="txtTweetInterval" runat="server" 
                                            SetFocusOnError="True" Display="Dynamic" ValidationExpression="^[2-9]+[0-9]{1,2}|[0-9]+[0-9]{2,10}$" 
                                            resourcekey="valTweetInterval.Error" />
                                    </td>
                                </tr>                                
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblNumberOfTweets" ResourceKey="rkNumberOfTweets" Text="NumberOfTweets" runat="server" Suffix=":" ControlName="txtNumberOfTweets" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtNumberOfTweets" runat="server" CssClass="Normal" MaxLength="5" Width="30"/>
                        <asp:CompareValidator ID="valNumberOfTweets" ControlToValidate="txtNumberOfTweets" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valNumberOfTweets.Error" /><br />
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    
    <h2 id="WidgetColors" class="dnnFormSectionHead"><a href="#">Widget Colors / Styles</a></h2>
    <fieldset class="dnnClear">
        <div class="dnnRight" style="width:99%;margin-left:2%">
            <table cellspacing="2" cellpadding="2" border="0" class="Normal" style="width:100%">
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblFontSize" ResourceKey="rkFontSize" Text="FontSize" runat="server" Suffix=":" ControlName="txtFontSize" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtFontSize" runat="server" CssClass="Normal" MaxLength="3" Width="20"/>&nbsp;px
                        <asp:CompareValidator ID="valFontSize" ControlToValidate="txtFontSize" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valFontSize.Error" /><br />
                    </td>
                </tr>
                
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblAvatars" ResourceKey="rkAvatars" Text="Avatars" runat="server" Suffix=":" ControlName="chkAvatars" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkAvatars" runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblHashTags" ResourceKey="rkHashTags" Text="Hashtags" runat="server" Suffix=":" ControlName="chkHashTags" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkHashTags" runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTimeStamp" ResourceKey="rkTimeStamp" Text="Timestamp" runat="server" Suffix=":" ControlName="chkTimeStamp" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkTimeStamp" runat="server" />
                    </td>
                </tr>
                
                
                
                <tr>
                    <td class="SubHead" colspan="2" style="border-top: 1px solid #ccc;" height="1px"></td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblShellBackground" ResourceKey="rkShellBackground" Text="ShellBackground" runat="server" Suffix=":" ControlName="txtShellBackground" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtShellBackground" runat="server" class="iColorPicker" MaxLength="12" Width="80" />
                        <%--<asp:RegularExpressionValidator ID="valShellBackground" ControlToValidate="txtShellBackground" runat="server" 
                                SetFocusOnError="True" Display="Dynamic" 
                                ValidationExpression="^\#?(([a-fA-F0-9]){3}){1,2}$" 
                                resourcekey="valShellBackground.Error" /><br />--%>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblShellText" ResourceKey="rkShellText" Text="ShellText" runat="server" Suffix=":" ControlName="txtShellText" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtShellText" runat="server" class="iColorPicker" MaxLength="12" Width="80" />
                        <%--<asp:RegularExpressionValidator ID="valShellText" ControlToValidate="txtShellText" runat="server" 
                                SetFocusOnError="True" Display="Dynamic" 
                                ValidationExpression="^\#?(([a-fA-F0-9]){3}){1,2}$" 
                                resourcekey="valShellText.Error" /><br />--%>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" colspan="2" style="border-top: 1px solid #ccc;" height="1px"></td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTweetBackground" ResourceKey="rkTweetBackground" Text="TweetBackground" runat="server" Suffix=":" ControlName="txtTweetBackground" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtTweetBackground" runat="server" class="iColorPicker" MaxLength="12" Width="80" />
                        <%--<asp:RegularExpressionValidator ID="valTweetBackground" ControlToValidate="txtTweetBackground" runat="server" 
                                SetFocusOnError="True" Display="Dynamic" 
                                ValidationExpression="^\#?(([a-fA-F0-9]){3}){1,2}$" 
                                resourcekey="valTweetBackground.Error" /><br />--%>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTweetText" ResourceKey="rkTweetText" Text="TweetText" runat="server" Suffix=":" ControlName="txtTweetText" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtTweetText" runat="server" class="iColorPicker" MaxLength="12" Width="80" />
                        <%--<asp:RegularExpressionValidator ID="valTweetText" ControlToValidate="txtTweetText" runat="server" 
                                SetFocusOnError="True" Display="Dynamic" 
                                ValidationExpression="^\#?(([a-fA-F0-9]){3}){1,2}$" 
                                resourcekey="valTweetText.Error" /><br />--%>
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" colspan="2" style="border-top: 1px solid #ccc;" height="1px"></td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblLinkColor" ResourceKey="rkLinkColor" Text="LinkColor" runat="server" Suffix=":" ControlName="txtLinkColor" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtLinkColor" runat="server" class="iColorPicker" MaxLength="12" Width="80" />
                        <%--<asp:RegularExpressionValidator ID="valLinkColor" ControlToValidate="txtLinkColor" runat="server" 
                                SetFocusOnError="True" Display="Dynamic" 
                                ValidationExpression="^\#?(([a-fA-F0-9]){3}){1,2}$" 
                                resourcekey="valLinkColor.Error" /><br />--%>
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
    
    <h2 id="DimensionsPadding" class="dnnFormSectionHead"><a href="#">Widget Dimensions and Padding</a></h2>
    <fieldset class="dnnClear">
        <div class="dnnRight" style="width:99%;margin-left:2%">
            <table cellspacing="2" cellpadding="2" border="0" class="Normal" style="width:100%">
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTweetWidth" ResourceKey="rkTweetWidth" Text="Width" runat="server" Suffix=":" ControlName="txtTweetWidth" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtTweetWidth" runat="server" CssClass="Normal" MaxLength="5" Width="30"/>
                        <asp:CompareValidator ID="valTweetWidth" ControlToValidate="txtTweetWidth" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valTweetWidth.Error" /><br />
                    </td>
                </tr>
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblTweetHeight" ResourceKey="rkTweetHeight" Text="Height" runat="server" Suffix=":" ControlName="txtTweetHeight" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:TextBox ID="txtTweetHeight" runat="server" CssClass="Normal" MaxLength="5" Width="30"/>
                        <asp:CompareValidator ID="valTweetHeight" ControlToValidate="txtTweetHeight" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valTweetHeight.Error" /><br />
                    </td>
                </tr>
                
                <tr>
                    <td class="SubHead" colspan="2" style="border-top: 1px solid #ccc;" height="1px"></td>
                </tr>
                
                <tr>
                    <td class="SubHead" style="width:150px">
                        <dnn:Label class="Normal" ID="lblDivPadding" ResourceKey="rkDivPadding" Text="DivPadding" runat="server" Suffix=":" ControlName="txtDivPaddingTop" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:Label class="Normal" ID="lblDivPaddingTop" runat="server" Text="Top:" Width="40"></asp:Label>
                        <asp:TextBox ID="txtDivPaddingTop" runat="server" CssClass="Normal" MaxLength="4" Width="40" />
                        <asp:CompareValidator ID="valDivPaddingTop" ControlToValidate="txtDivPaddingTop" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valDivPaddingTop.Error" /><br />
                        
                        <asp:Label class="Normal" ID="lblDivPaddingRight" runat="server" Text="Right:" Width="40"></asp:Label>
                        <asp:TextBox ID="txtDivPaddingRight" runat="server" CssClass="Normal" MaxLength="4" Width="40" />
                        <asp:CompareValidator ID="valDivPaddingRight" ControlToValidate="txtDivPaddingRight" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valDivPaddingRight.Error" /><br />
                        
                        <asp:Label class="Normal" ID="lblDivPaddingBottom" runat="server" Text="Bottom:" Width="40"></asp:Label>
                        <asp:TextBox ID="txtDivPaddingBottom" runat="server" CssClass="Normal" MaxLength="4" Width="40" />
                        <asp:CompareValidator ID="valDivPaddingBottom" ControlToValidate="txtDivPaddingBottom" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valDivPaddingBottom.Error" /><br />
                        
                        <asp:Label class="Normal" ID="lblDivPaddingLeft" runat="server" Text="Left:" Width="40"></asp:Label>
                        <asp:TextBox ID="txtDivPaddingLeft" runat="server" CssClass="Normal" MaxLength="4" Width="40" />
                        <asp:CompareValidator ID="valDivPaddingLeft" ControlToValidate="txtDivPaddingLeft" Operator="DataTypeCheck" Type="Integer" Runat="server" Display="Dynamic" resourcekey="valDivPaddingLeft.Error" /><br />
                    </td>
                </tr>
                
            </table>
        </div>
    </fieldset>

    <h2 id="H1" class="dnnFormSectionHead"><a href="#">Debugging Information</a></h2>
    <fieldset class="dnnClear">
        <div class="dnnRight" style="width:99%;margin-left:2%">
            <table cellspacing="2" cellpadding="2" border="0" class="Normal" style="width:100%">
                <tr>
                    <td class="SubHead" style="width:300px">
                        <dnn:Label class="Normal" ID="lblDebug" ResourceKey="rkDebug" Text="Checkbox" runat="server" Suffix=":" ControlName="chkDebug" />
                    </td>
                    <td class="NormalTextBox" >
                        <asp:CheckBox ID="chkDebug" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </fieldset>
</div>
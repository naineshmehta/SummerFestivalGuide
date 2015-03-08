﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EditSlider.ascx.vb" Inherits="WillStrohl.Modules.ContentSlider.EditSlider" %>
<%@ Import Namespace="DotNetNuke.Services.Localization" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Url" Src="~/controls/UrlControl.ascx" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div id="dnnEditEntry" class="dnnForm dnnEditEntry dnnClear">
    <h2 id="dnnPanel-h2Slider" class="dnnFormSectionHead"><a href="" class="dnnLabelExpanded"><%= Me.GetLocalizedString("SliderHeader.Text")%></a></h2>
    <fieldset id="fsSlider" class="wns-fieldset">
        <ol id="olSlider" class="wns-list">
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblSliderName" runat="server" ResourceKey="lblSliderName" ControlName="txtSliderName" Suffix=":" />
                    <asp:TextBox ID="txtSliderName" runat="server" MaxLength="50" CssClass="NormalTextBox dnnFormRequired" ValidationGroup="slider" /> 
                    <asp:RequiredFieldValidator ID="rfvSliderName" runat="server" ControlToValidate="txtSliderName" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="slider" />
                </div>
            </li>
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblAlternateText" runat="server" ResourceKey="lblAlternateText" ControlName="txtAlternateText" Suffix=":" />
                    <asp:TextBox ID="txtAlternateText" runat="server" MaxLength="100" CssClass="NormalTextBox dnnFormRequired" ValidationGroup="slider" /> 
                    <asp:RequiredFieldValidator ID="rfvAlternateText" runat="server" ControlToValidate="txtAlternateText" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="slider" />
                </div>
            </li>
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblStartDate" runat="server" ResourceKey="lblStartDate" ControlName="txtStartDate" Suffix=":" />
                    <dnnweb:DnnDatePicker ID="txtStartDate" runat="server" CssClass="NormalTextBox dnnFormRequired" ShowPopupOnFocus="true" />
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate" Display="Dynamic" CssClass="dnnFormMessage dnnFormError" ValidationGroup="slider" />
                </div>
            </li>
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblEndDate" runat="server" ResourceKey="lblEndDate" ControlName="txtEndDate" Suffix=":" />
                    <dnnweb:DnnDatePicker ID="txtEndDate" runat="server" ShowPopupOnFocus="true" />
                </div>
            </li>
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblFile" runat="server" ResourceKey="lblFile" ControlName="ctlFile" Suffix=":" />
                    <div class="dnnLeft">
                        <dnn:Url ID="ctlFile" runat="server" FileFilter="png,jpg,jpeg,gif" Required="true" ShowDatabase="false" ShowFiles="true" 
                            ShowImages="true" ShowLog="false" ShowNewWindow="false" ShowNone="false" ShowSecure="false" ShowTabs="false" ShowTrack="false" 
                            ShowUpLoad="true" ShowUrls="true" ShowUsers="false" />
                    </div>
                </div>
            </li>
            <li class="wns-listitem">
                <div class="dnnFormItem">
                    <dnn:label id="lblLink" runat="server" ResourceKey="lblLink" ControlName="ctlLink" Suffix=":" />
                    <div class="dnnLeft">
                        <dnn:Url ID="ctlLink" runat="server" Required="true" ShowDatabase="false" ShowFiles="false" 
                            ShowImages="false" ShowLog="false" ShowNewWindow="true" ShowNone="false" ShowSecure="false" ShowTabs="true" ShowTrack="false" 
                            ShowUpLoad="true" ShowUrls="true" ShowUsers="false" />
                    </div>
                </div>
            </li>
        </ol>
    </fieldset>
    <div class="dnnClear">
        <asp:LinkButton ID="cmdUpdate" runat="server" CssClass="dnnPrimaryAction" CausesValidation="true" ValidationGroup="slider" />&nbsp; 
        <asp:LinkButton ID="cmdCancel" runat="server" CssClass="dnnSecondaryAction" CausesValidation="false" />&nbsp; 
        <asp:LinkButton ID="cmdDelete" runat="server" CssClass="dnnSecondaryAction" CausesValidation="false" />
    </div>
</div>
<script language="javascript" type="text/javascript">/*<![CDATA[*/
    var delText = '<%= Me.GetLocalizedString("Delete.Confirm").Replace("'", "")%>';

    (function ($, Sys) {
        function setupDnnSiteSettings() {
            $('#dnnEditEntry').dnnPanels();

            /* add a friend confirmation message for when a deletion is requested */
            $('#<%= Me.cmdDelete.ClientId %>').dnnConfirm({
                text: delText,
                yesText: '<%= Localization.GetString("Yes.Text", Localization.SharedResourceFile) %>',
                noText: '<%= Localization.GetString("No.Text", Localization.SharedResourceFile) %>',
                title: '<%= Localization.GetString("Confirm.Text", Localization.SharedResourceFile) %>'
            });

            $('#<%= Me.txtSliderName.ClientId %>').live('blur', function(){
                if ($('#<%= Me.txtAlternateText.ClientId %>').val() == '') $('#<%= Me.txtAlternateText.ClientId %>').val($('#<%= Me.txtSliderName.ClientId %>').val());
            });
        }

        $(document).ready(function () {
            setupDnnSiteSettings();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                setupDnnSiteSettings();
            });
        });

    } (jQuery, window.Sys));
/*]]>*/</script>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagGroupedGridAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TagGroupedGridAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>
<%@ Register TagPrefix="UPG" TagName="TagPicker" Src="TagPicker.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="5" width="100%" id="tblContainer" runat="server">
    <tr>
        <td class="SectionHeader">
            <dnn:sectionhead id="dshColorsAndAppearance" runat="server" resourcekey="ColorsAndAppearance"
                section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:sectionhead></td>
    </tr>
    <tr>
        <td class="UMGMenuBody">
            <table id="tblColors" width="100%" runat="server" class="Normal">
                <tr>
                    <td width="150">
                        <dnn:Label ID="pltags" runat="server" resourcekey="tags"></dnn:Label></td>
                    <td class="Normal">
                        <UPG:tagpicker id="ctlTagPicker" runat="server"></UPG:tagpicker>
                            <div id="tagPreview" class="UMGMenuBody" style="width: 400px;">
                            </div>                   
                    </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label2" runat="server" resourcekey="NumberOfImages"></dnn:Label></td>
                    <td class="Normal">
                        <asp:dropdownlist id="cboNumberOfImages" runat="server" CssClass="NormalTextBox">
                            <asp:listitem value="2"></asp:listitem>
                            <asp:listitem value="3"></asp:listitem>
                            <asp:listitem value="4" selected="true"></asp:listitem>
                            <asp:listitem value="5"></asp:listitem>
                            <asp:listitem value="6"></asp:listitem>
                            <asp:listitem value="7"></asp:listitem>
                            <asp:listitem value="8"></asp:listitem>
                            <asp:listitem value="9"></asp:listitem>
                            <asp:listitem value="10"></asp:listitem>
                            <asp:listitem value="12"></asp:listitem>
                            <asp:listitem value="15"></asp:listitem>
                            <asp:listitem value="16"></asp:listitem>
                            <asp:listitem value="18"></asp:listitem>
                            <asp:listitem value="20"></asp:listitem>
                        </asp:dropdownlist>
                        </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label4" runat="server" resourcekey="NumberOfImages2"></dnn:Label></td>
                    <td class="Normal">
                        <asp:dropdownlist id="cboNumberOfImages2" runat="server" CssClass="NormalTextBox">
                            <asp:listitem value="2"></asp:listitem>
                            <asp:listitem value="3"></asp:listitem>
                            <asp:listitem value="4" selected="true"></asp:listitem>
                            <asp:listitem value="5"></asp:listitem>
                            <asp:listitem value="6"></asp:listitem>
                            <asp:listitem value="7"></asp:listitem>
                            <asp:listitem value="8"></asp:listitem>
                            <asp:listitem value="9"></asp:listitem>
                            <asp:listitem value="10"></asp:listitem>
                            <asp:listitem value="12"></asp:listitem>
                            <asp:listitem value="15"></asp:listitem>
                            <asp:listitem value="16"></asp:listitem>
                            <asp:listitem value="18"></asp:listitem>
                            <asp:listitem value="20"></asp:listitem>
                        </asp:dropdownlist>
                        </td>
                </tr>
                <tr>
                    <td>
                        <dnn:Label ID="Label3" runat="server" resourcekey="MediaSize" Suffix=":">
                                        </dnn:Label>
                    </td>
                    <td class="Normal">
                        <asp:TextBox ID="txtMediaWidth" runat="server" Width="35px" CssClass="NormalTextBox"></asp:TextBox>px<asp:RegularExpressionValidator
                            ID="Regularexpressionvalidator4" runat="server" ControlToValidate="txtMediaWidth"
                            ErrorMessage="*" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                        X&nbsp;
                        <asp:TextBox ID="txtMediaHeight" runat="server" Width="35px" CssClass="NormalTextBox"></asp:TextBox>px<asp:RegularExpressionValidator
                            ID="Regularexpressionvalidator5" runat="server" ControlToValidate="txtMediaHeight"
                            ErrorMessage="*" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:Button ID="btnSave" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton" />
            <asp:Button ID="btnCancel" runat="server" resourcekey="cmdCancel" CssClass="CommandButton" /></td>
    </tr>
</table>

<script language="javascript">
function updateTags(tags)
{
    var dest = jQuery("#tagPreview");
    dest.children().remove();
    
    var tagarray = tags.split(",");
    for (var i=0;i<tagarray.length;i++)
    {
        var tag = tagarray[i].trim();
        if (tag != "")
        {
            dest.append("<span class='Tag'>"+tag+"</span>");
        }
    }
    
    if (dest.children().length <= 0)
    {
        dest.append("<span class='Tag'>&lt;<%=Localize("notags") %>&gt;</span>");
    }
}

jQuery(document).ready(function(){
    var tagInput = jQuery(".TagInput");
	tagInput.bind('keyup mouseup change', function (){
	    updateTags(this.value);
	});	
	
	updateTags(tagInput.attr("value"));
});

</script>

</script>
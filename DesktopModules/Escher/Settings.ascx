<%@ Control language="vb" Inherits="OliverHine.Escher.Settings" AutoEventWireup="false" Explicit="True" Codebehind="Settings.ascx.vb" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<link rel="stylesheet" type="text/css" href="<%=ResolveUrl("js/jquery.qtip.min.css") %>"/>
<div id="overlay" runat="server" class="escher-overlay"><asp:Label ID="lAlbumViewer" runat="server" /></div>

<asp:Panel ID="wrapper" runat="server" class="escher-settings">

<table>
    <tr>
        <td class="SubHead">
            <dnn:label id="lPhotoStore" runat="server" controlname="lPhotoStore" suffix=":" />
        </td>
        <td>
            <asp:DropDownList ID="dPhotoStore" runat="server" AutoPostBack="true"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lUsername" runat="server" controlname="lUsername" suffix=":" />
        </td>
        <td>
            <asp:TextBox ID="tUsername" runat="server" Columns="30" />
            <asp:ImageButton ID="cmdLookup" runat="server" resourceKey="cmdLookup" ImageUrl="~/images/view.gif" CssClass="CommandButton" />
            <asp:ImageButton ID="cmdAuthModule" runat="server" ImageUrl="~/images/lock.gif" ToolTip="Authenticate" />
        </td>
    <tr>
        <td class="SubHead">
            <dnn:label id="lGallery" runat="server" controlname="lGallery" suffix=":" />
        </td>
        <td>
            <asp:TextBox ID="tGallery" runat="server" Columns="30" />
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lDisplayMode" runat="server" controlname="lDisplayMode" suffix=":" />
        </td>
        <td>
            <asp:DropDownList ID="dDisplayMode" runat="server"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lRows" runat="server" controlname="lRows" suffix=":" />
        </td>
        <td><asp:TextBox ID="tRows" runat="server" Columns="2" /></td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lColumns" runat="server" controlname="lColumns" suffix=":" />
        </td>
        <td><asp:TextBox ID="tColumns" runat="server" Columns="2" /></td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lThumbnail" runat="server" controlname="lThumbnail" suffix=":" />
        </td>
        <td>
            <asp:DropDownList ID="dThumbnail" runat="server"/>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lFullsize" runat="server" controlname="lFullsize" suffix=":" />
        </td>
        <td>
            <asp:DropDownList ID="dFullsize" runat="server" />
        </td>
    </tr>
    <tr runat="server" visible="true">
        <td class="SubHead">
            <dnn:label id="lGalleryCaption" runat="server" controlname="lGalleryCaption" suffix=":" />
        </td>
        <td>
            <asp:CheckBox ID="cGalleryCaptionTitle" runat="server" Text="Title" CssClass="Normal" />
            <asp:CheckBox ID="cGalleryCaptionDesc" runat="server" Text="Description" CssClass="Normal" />
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:label id="lGalleryCaptionDisplay" runat="server" controlname="lGalleryCaptionDisplay" suffix=":" />
        </td>
        <td>
            <asp:CheckBox ID="cGalleryCaptionDisplayTitle" runat="server" Text="Tooltip" CssClass="Normal" />
            <asp:CheckBox ID="cGalleryCaptionDisplayInline" runat="server" Text="Below Image" CssClass="Normal" />
            <asp:CheckBox ID="cGalleryCaptionDisplayAbove" runat="server" Text="Above Image" CssClass="Normal" />
            <asp:CheckBox ID="cGalleryCaptionDisplayPolaroid" runat="server" Text="Polaroid Style" CssClass="Normal" />
        </td>
    </tr>
    <tr runat="server" visible="false">
        <td class="SubHead">
            <dnn:label id="lImageCaption" runat="server" controlname="lImageCaption" suffix=":" />
        </td>
        <td>
            <asp:CheckBox ID="cImageCaptionTitle" runat="server" Text="Title" CssClass="Normal" />
            <asp:CheckBox ID="cImageCaptionDesc" runat="server" Text="Description" CssClass="Normal" />
        </td>
    </tr>
    <tr>
        <td class="SubHead" valign="top" style="padding-top:4px;">
            <dnn:label id="lSlideShow" runat="server" controlname="lSlideShow" suffix=":" />
        </td>
        <td>
            <asp:DropDownList ID="dSlideShow" runat="server" />
            <div id="SlideShowSettings" runat="server"><span class="SubHead">Speed: </span><asp:TextBox ID="tSlideShowSpeed" runat="server" Columns="2" /></div>
        </td>
    </tr>
    <tr ID="tExtraAuthSettings" runat="server">
        <td class="SubHead">
            <dnn:label id="lUpload" runat="server" controlname="lUpload" suffix=":" />
        </td>
        <td>
            <asp:CheckBox ID="cUpload" runat="server" Text="Upload" />
        </td>
    </tr>
</table>
</asp:Panel>
<asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif" CssClass="ohHidden" />

<script type="text/javascript">
    function ohEscherGallerySelect(albumident) {
        document.getElementById('<%= tGallery.ClientId %>').value = albumident;
        document.getElementById('<%= lAlbumViewer.ClientId %>').innerHTML = '';
        jQuery('#<%= overlay.ClientId %>').hide();
        jQuery(".escher-overlay-bg").hide();
    }
    var imgUpSrc = '<%= ResolveUrl("~/images/plus.gif") %>';
    var imgDownSrc = '<%= ResolveUrl("~/images/minus.gif") %>';
</script>
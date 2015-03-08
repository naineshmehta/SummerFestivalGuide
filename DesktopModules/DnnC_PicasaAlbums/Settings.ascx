<%@ Control Language="vb" AutoEventWireup="false" Inherits="DnnC.Modules.DnnC_PicasaAlbums.Settings" Codebehind="Settings.ascx.vb" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>

<div class="dnnForm dnnClear">

    <h2 class="dnnFormSectionHead" id="dnnPanel-PicasaCreds"><a href="" class="dnnLabelExpanded"><%=LocalizeString("lblPicasaCredentialsTitle")%></a></h2>
    <fieldset>

	    <div class="dnnFormItem">
            <dnn:label id="lblPicasaUserName" controlname="lblPicasaUserName" runat="server" />
            <asp:textbox id="txtPicasaUserName" cssclass="NormalTextBox" width="100" runat="server" />        
        </div>
        <div class="dnnFormItem">
            <dnn:label id="lblPicasaPassWord" controlname="lblPicasaPassWord" runat="server" />
            <asp:textbox id="txtPicasaPassWord" cssclass="NormalTextBox" width="100" runat="server" />        
        </div>

    </fieldset> 

    <h2 class="dnnFormSectionHead" id="dnnPanel-GallerifficOptions"><a href="" class="dnnLabelExpanded"><%=LocalizeString("lblGallerifficTitle")%></a></h2>
    <fieldset>

	    <div class="dnnFormItem">
            <dnn:label id="lblGallerifficScript" controlname="lblGallerifficScript" runat="server" />
            <asp:textbox id="txtGallerifficScript" runat="server" cssclass="NormalTextBox" TextMode="MultiLine" style="width:580px; min-height:0;" height="300px" />       
            
            <div style="text-align:right;"><asp:LinkButton ID="btnGalScriptDefault" runat="server"><%=LocalizeString("btnLoadDefault")%></asp:LinkButton></div>
            <br /><hr width="100%" />
        </div>

        <div class="dnnFormItem">
            <dnn:label id="lblGallerifficCss" controlname="lblGallerifficCss" runat="server" />
            <asp:textbox id="txtGallerifficCss" runat="server" cssclass="NormalTextBox" TextMode="MultiLine" style="width:580px; min-height:0;" height="200px" />

            <div style="text-align:right;"><asp:LinkButton ID="btnGalCssDefault" runat="server"><%=LocalizeString("btnLoadDefault")%></asp:LinkButton></div>
            <br /><hr width="100%" />
        </div>

    </fieldset>

    <h2 class="dnnFormSectionHead" id="H3"><a href="" class="dnnLabelExpanded"><%=LocalizeString("lblPicasaCategoryCssTitle")%></a></h2>
    <fieldset>
        <div class="dnnFormItem">
            <asp:TextBox ID="txtCatStyle" runat="server" TextMode="MultiLine" style="width:100%; min-height:0;" height="150px" />

            <div style="text-align:right;"><asp:LinkButton ID="btnCatStyleDefault" runat="server"><%=LocalizeString("btnLoadDefault")%></asp:LinkButton></div>
            <br /><hr width="100%" />
        </div>
        <div class="dnnFormItem">
            <dnn:label id="lblToAlbumsText" controlname="lblToAlbumsText" runat="server" />
            <asp:textbox id="txtCatBackToAlbums" cssclass="NormalTextBox" width="100" runat="server" Text="back to the albums" /> 
                   
        </div>
    </fieldset>

</div>
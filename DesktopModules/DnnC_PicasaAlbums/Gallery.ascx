<%@ Control language="vb" Inherits="DnnC.Modules.DnnC_PicasaAlbums.Gallery" AutoEventWireup="false" Explicit="True" Codebehind="Gallery.ascx.vb" %>

<asp:Panel ID="PanelNofication" runat="server" Visible="false">
    <div class="dnnFormMessage dnnFormWarning"><asp:Label ID="lblError" runat="server" /></div>
</asp:Panel>

<asp:Literal ID="ltlIncludes" runat="server" />


<asp:Panel ID="PanelPicasaAlbums" runat="server">

    <!-- BEGIN : Category panel -->
    <asp:Panel ID="PanelAlbums" runat="server" Visible="true">
        <asp:Literal ID="ltlCatSyle" runat="server" />

        <div id="divAlbums" runat="server"></div>
        <div style="clear: both;"></div>
        <hr />
    </asp:Panel>
    <!-- END : Category panel -->

    <!-- BEGIN : Picasa Photo list -->
    <asp:Panel ID="PanelGallerifficPhotos" runat="server" Visible="false">
        <div id="page">
            <div id="container">
                <div class="DnnC_CatDiv">
                    <asp:LinkButton ID="btnBackToAlbums" runat="server" CssClass="DnnC_BackToCat" />
                    &nbsp;
                    <asp:DropDownList ID="ddlAlbums" runat="server" CssClass="DnnC_CatList" AutoPostBack="true" />
                </div>

                <div id="gallery" class="content">
                    <div id="controls" class="controls"></div>
                    <div class="slideshow-container">
                        <div id="loading" class="loader"></div>
                        <div id="slideshow" class="slideshow"></div>
                    </div>
                    <div id="caption" class="caption-container"></div>
                </div>

                <div id="thumbs" class="navigation">
                    <div id="divSlider" runat="server"></div>            
                </div>

                <div style="clear: both;"></div>
            </div>
        </div>
    </asp:Panel>
    <!-- END : Picasa Photo list -->

<asp:Literal ID="ltlScript" runat="server" />

</asp:Panel>
<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TagGroupedGrid.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.TagGroupedGrid" %>
<%@ Register TagPrefix="UNA" TagName="NumericPagination" Src="NumericPagination.ascx" %>

<script type="text/javascript">
// 830126e595ae5776b3745d836be3b5ba

hs.graphicsDir = '<%=ResolveUrl("css/highslide/graphics/") %>';
hs.showCredits = false;
hs.align = 'center';
hs.transitions = ['expand', 'crossfade'];
hs.outlineType = '<%=Theme %>';
<%If WrapperClass<> ""%>hs.wrapperClassName = '<%=WrapperClass%>';<%End If%>
hs.fadeInOut = true;
//hs.dimmingOpacity = 0.75;

</script>

<table border="0" cellpadding="0" cellspacing="0" class="umg_grid" style="width: <%=GalleryWidth %>px;
    height: <%=GalleryHeight %>px;">
    <tr>
        <td class="left">
            <div class="tags">
                <asp:datalist id="lstTags" runat="server" repeatcolumns="1" width="100%" cellpadding="0"
                    cellspacing="0">
                    <ItemTemplate>
                    <asp:linkbutton id="lnkTag" runat="server" Text="<%#Container.DataItem.Trim() %>" onclick="lnkTag_Click" ></asp:linkbutton>
                    </ItemTemplate></asp:datalist>
                    <p></p>
                <table cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td>
                            <asp:textbox id="txtSearch" runat="server" cssclass="searchInput"></asp:textbox>
                        </td>
                        <td>
                            <asp:imagebutton id="imgSearch" runat="server" imageurl="~/Desktopmodules/UltraMediaGallery/css/TagGroupedGrid/go.gif"></asp:imagebutton></td>
                    </tr>
                </table>
            </div>
        </td>
        <td class="right">
            <asp:datalist id="lstMedias" runat="server" repeatcolumns="1" width="100%" cellpadding="5"
                cellspacing="0" onitemdatabound="lstMedias_ItemDataBound">
                    <ItemTemplate>
                    
                    <table width="100%" cellpadding="0" cellspacing="0" class="mediaGroup">
                    <tr>
                    <td>
                    
                    <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:0px;">
                    <tr>
                    <td class="tagHeaderLeft">&nbsp;</td><td class="tagHeaderCenter1"><asp:label id="lblTag" runat="server" text="<%#Container.DataItem.Key %>"></asp:label></td><td class="tagHeaderCenter2"><asp:linkbutton id="lnkSeeMore" runat="server" onclick="lnkSeeMore_Click" cssclass="seeMore" Text="See more" tooltip="<%#Container.DataItem.Key %>"></asp:linkbutton></td><td class="tagHeaderRight">&nbsp;</td>
                    </tr>
                    </table>
                    
                    </td>
                    </tr>
                    <tr><td colspan="3" class="tagBody">
                    
                    <asp:datalist id="lstPhotos" runat="server" repeatcolumns="5" width="100%" cellpadding="2" cellspacing="2">
                    <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                    <%#GetPhotoDisplay(Container.DataItem) %>
                    </ItemTemplate>
                    </asp:datalist>

                    
                    </td></tr>
                    </table>
                    </ItemTemplate></asp:datalist>
                    
                    <asp:panel id="pnlLargeList" runat="server" visible="False">
                        <div style="float:left;">
                        <asp:label id="lblSelection" runat="server" cssclass="selection"></asp:label>
                        </div>
                        <div style="text-align:right;">
                        <asp:linkbutton id="lnkReturn" runat="server" resourcekey="Return" cssclass="SubHead" onclick="lnkReturn_Click"></asp:linkbutton></div>
                        <asp:datalist id="lstLargeList" runat="server" repeatcolumns="1" width="100%" cellpadding="5" cellspacing="0">
                        <ItemTemplate>
                        <%#GetPhotoDisplay2(Container.DataItem) %>
                        </ItemTemplate>
                        </asp:datalist>
                        
                        <asp:label id="lblNoResults" runat="server" resourcekey="NoResults" cssclass="noResults"></asp:label>
                        <div style="text-align:center;">
                        <una:numericpagination id="ucNumericPagination" runat="server">
                        </una:numericpagination>
                        </div>
                    </asp:panel>
        </td>
    </tr>
</table>

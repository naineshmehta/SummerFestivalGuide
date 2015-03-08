<%@ Control language="vb" Inherits="OliverHine.Escher.ViewEscher" AutoEventWireup="false" Explicit="True" Codebehind="ViewEscher.ascx.vb" %>

<asp:Label ID="lPageInfo" runat="server" CssClass="Normal" />
<asp:Panel ID="pImages" runat="server" CssClass="Normal" />
<asp:Panel runat="server" ID="pPager"/>
<%--<div>
    <asp:HyperLink ID="bPrev" runat="server" class="ohPager ohPrevPage" />
    <asp:HyperLink ID="bNext" runat="server" class="ohPager ohNextPage" />
    <div class="clear_float"></div>
</div>--%>

<asp:Panel runat="server" ID="pLoading" CssClass="ohHidden ohCenter">Loading... <asp:Image ID="imgAjax" runat="server" ImageUrl="ajaxanim.gif"  /></asp:Panel>


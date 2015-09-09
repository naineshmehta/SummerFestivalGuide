<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListView_SimpleList.ascx.cs" Inherits="BizModules.FlexEvents.Views.ListView_Grid" %>

<h5 class="title">Upcoming Events</h5>

<div class="simplelistview">
    <%=FirstPage %>

    <asp:Panel ID="pnlLoadMore" runat="server" CssClass="loadmore">
    <asp:HyperLink ID="lblLoadMore" runat="server" NavigateUrl="javascript:void(0);" resourcekey="LoadMore"></asp:HyperLink>
    </asp:Panel>
</div>
<%@ Control Language="vb" AutoEventWireup="false" Explicit="true" Codebehind="UCP_Bookmark.ascx.vb" Inherits="DotNetNuke.Modules.Forum.UCP.Bookmark" %>
<%@ Register Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" TagPrefix="dnnweb" %>
<%@ Register TagPrefix="wrapper" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<div class="UCP-Bookmark">
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td class="Forum_UCP_Header">
				<asp:Label id="lblTitle" runat="server" resourcekey="Bookmark" EnableViewState="false" />
			</td>
		</tr>
		<tr>
			<td class="Forum_UCP_HeaderInfo">
				<dnnweb:DnnGrid runat="server" ID="gridBookmarks" AllowPaging="true" AllowSorting="false" AutoGenerateColumns="false" AllowCustomPaging="true" GridLines="None">
					<MasterTableView DataKeyNames="ForumID,ThreadID,MostRecentPostID" >
						<Columns>
							<wrapper:GridButtonColumn ButtonType="ImageButton" ImageUrl="~/images/delete.gif" UniqueName="imgDelete" CommandName="DeleteItem" HeaderStyle-Width="20px" ItemStyle-Width="20px" HeaderText="Delete" />
							<dnnweb:DnnGridHyperlinkColumn UniqueName="hlName" HeaderText="Subject" DataTextField="Subject" ItemStyle-Width="45%" />
							<dnnweb:DnnGridBoundColumn UniqueName="Posts" DataField="TotalPosts" HeaderText="TotalPosts" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="85px" HeaderStyle-Width="85px" />
							<dnnweb:DnnGridHyperlinkColumn UniqueName="hlLastPost" HeaderText="LastPost" />
						</Columns>
					</MasterTableView>			
				</dnnweb:DnnGrid>
			</td>
		</tr>
	</table>
</div>
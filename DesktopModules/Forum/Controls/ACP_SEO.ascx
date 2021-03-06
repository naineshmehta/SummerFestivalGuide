<%@ Control language="vb" CodeBehind="ACP_SEO.ascx.vb" Explicit="true" AutoEventWireup="false" Inherits="DotNetNuke.Modules.Forum.ACP.SEO" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<div class="ACP-SEO">
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td class="Forum_UCP_Header">
				<asp:Label id="lblTitle" runat="server" resourcekey="lblTitle" EnableViewState="false" />
			</td>
		</tr>
		<tr>
			<td class="Forum_UCP_HeaderInfo">    
				<table id="tblSpider" cellspacing="0" cellpadding="0" width="100%" runat="server">
					 <tr>
						 <td width="35%">
	                			<span class="Forum_Row_AdminText">
	                				<dnn:label id="plNoFollowWeb" runat="server" Suffix=":" controlname="chkNoFollowWeb"></dnn:label>
							</span>
						  </td>
						 <td valign="middle" align="left">
							<asp:checkbox id="chkNoFollowWeb" runat="server" CssClass="Forum_NormalTextBox" EnableViewState="false" />
						 </td>
					 </tr>
				    <tr>
					   <td width="35%">
							<span class="Forum_Row_AdminText">
	                				<dnn:label id="plOverrideTitle" runat="server" Suffix=":" controlname="chkOverrideTitle"></dnn:label>
							</span>
					   </td>
					   <td valign="middle" align="left">
						  <asp:checkbox id="chkOverrideTitle" runat="server" CssClass="Forum_NormalTextBox" EnableViewState="false" />
					   </td>
				    </tr>
			    		<tr>
					   <td width="35%">
                  				<span class="Forum_Row_AdminText">
	                				<dnn:label id="plOverrideDescription" runat="server" Suffix=":" controlname="chkOverrideDescription"></dnn:label>
							</span>
					   </td>
					   <td  valign="middle" align="left">
						  <asp:checkbox id="chkOverrideDescription" runat="server" CssClass="Forum_NormalTextBox" EnableViewState="false" />
					   </td>
				    </tr>
				    	<tr>
					   <td width="35%">
                  				<span class="Forum_Row_AdminText">
	                				<dnn:label id="plOverrideKeyWords" runat="server" Suffix=":" controlname="chkOverrideKeyWords"></dnn:label>
							</span>
					   </td>
					   <td  valign="middle" align="left">
						  <asp:checkbox id="chkOverrideKeyWords" runat="server" CssClass="Forum_NormalTextBox" EnableViewState="false" />
					   </td>
				    </tr>
					<tr>
					   <td width="35%">
                  				<span class="Forum_Row_AdminText">
	                				<dnn:label id="plNoFollowLatestThreads" runat="server" Suffix=":" controlname="chkNoFollowLatestThreads"></dnn:label>
							</span>
					   </td>
					   <td  valign="middle" align="left">
						  <asp:checkbox id="chkNoFollowLatestThreads" runat="server" CssClass="Forum_NormalTextBox" EnableViewState="false" />
					   </td>
				    </tr>
			    		<tr>
					   <td width="35%">
                  				<span class="Forum_Row_AdminText">
	                				<dnn:label id="plSitemapPriority" runat="server" Suffix=":" controlname="txtSitemapPriority"></dnn:label>
							</span>
					   </td>
					   <td  valign="middle" align="left">
						  <telerik:RadNumericTextBox ID="textSitemapPriority" runat="server" MinValue="0" MaxValue="1" />
					   </td>
				    </tr>
				</table>
				<div align="center">
					<asp:linkbutton cssclass="CommandButton primary-action" id="cmdUpdate" runat="server" text="Update" resourcekey="cmdUpdate" EnableViewState="false" />
				</div>
				<div align="center">
					<asp:Label ID="lblUpdateDone" runat="server" CssClass="NormalRed" Visible="false" resourcekey="lblUpdateDone" EnableViewState="false" />
				</div>
			</td>
		</tr>
	</table>
</div>
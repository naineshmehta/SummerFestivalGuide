<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WizardStep4.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WizardStep4" %>
<table class="Wizard" width="100%" border="0">
	<tr>
		<td class="WizardHeader"><font class="Head"><asp:label id="lblTitle" resourcekey="Wizard" runat="server"></asp:label>
				-
				<asp:label id="Label2" resourcekey="Step4" runat="server"></asp:label></font>
			<br>
			<font class="Normal">
				<asp:label id="Label1" resourcekey="ServerDirectory" runat="server"></asp:label>
			</font>
		</td>
	</tr>
	<tr>
		<td class="WizardBody">
			<table id="tblDynamicGallery" cellSpacing="0" cellPadding="2" width="100%" align="center"
				border="0" runat="server">
				<tr>
					<td class="SubSubHead" width="145">
						<asp:label id="lbSourceFolder" runat="server" resourcekey="SourceFolder" CssClass="Normal"></asp:label>:</td>
					<td class="Normal">
						<asp:DropDownList id="lstDirectories" runat="server"></asp:DropDownList></td>
				</tr>
			</table>
			<asp:label id="Label3" runat="server" cssclass="Normal" resourcekey="SourceFolder.Help"></asp:label></td>
		</td>
	</tr>
	<tr>
		<td class="WizardFooter" align="right"><input type=button onclick="javascript:window.history.go(-1);" value="<%=Localize("Previous")%>">&nbsp;<asp:button id="btnNextStep" resourcekey="NextStep" runat="server" Text="Button"></asp:button>&nbsp;</td>
	</tr>
</table>

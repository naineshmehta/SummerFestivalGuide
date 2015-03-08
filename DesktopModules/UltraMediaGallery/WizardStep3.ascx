<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WizardStep3.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WizardStep3" %>
<table class="Wizard" width="100%" border="0">
	<tr>
		<td class="WizardHeader"><font class="Head"><asp:label id="lblTitle" resourcekey="Wizard" runat="server"></asp:label>
				-
				<asp:label id="Label2" resourcekey="Step3" runat="server"></asp:label></font>
			<br>
			<font class="Normal">
				<asp:label id="Label1" resourcekey="PictureSource" runat="server"></asp:label>
			</font>
		</td>
	</tr>
	<tr>
		<td class="WizardBody">
			<table>
				<tr>
					<td valign="top">
						<asp:RadioButton id="rbWebUpload" runat="server" GroupName="PictureSource"></asp:RadioButton>
					<td><font class="SubSubHead"><asp:Label ID="lblWebUpload" Runat="server" resourcekey="WebUpload"></asp:Label></font>
						<br>
						<font class="Normal">
							<asp:Label ID="Label3" Runat="server" resourcekey="WebUpload.Help"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<asp:RadioButton id="rbRssSubscription" runat="server" GroupName="PictureSource"></asp:RadioButton>
					<td><font class="SubSubHead"><asp:Label ID="Label4" Runat="server" resourcekey="RssSubscription"></asp:Label></font>
						<br>
						<font class="Normal">
							<asp:Label ID="Label5" Runat="server" resourcekey="RssSubscription.Help"></asp:Label>
						</font>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<asp:RadioButton id="rbServerDirectory" runat="server" GroupName="PictureSource"></asp:RadioButton>
					<td><font class="SubSubHead"><asp:Label ID="Label6" Runat="server" resourcekey="ServerDirectory"></asp:Label></font>
						<br>
						<font class="Normal">
							<asp:Label ID="Label7" Runat="server" resourcekey="ServerDirectory.Help"></asp:Label>
						</font>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="WizardFooter" align="right"><input type=button onclick="javascript:window.history.go(-1);" value="<%=Localize("Previous")%>">&nbsp;<asp:button id="btnNextStep" resourcekey="NextStep" runat="server" Text="Button"></asp:button>&nbsp;</td>
	</tr>
</table>

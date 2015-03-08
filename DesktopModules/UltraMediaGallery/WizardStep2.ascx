<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WizardStep2.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WizardStep2" %>
<table class="Wizard" width="100%" border="0">
	<tr>
		<td class="WizardHeader"><font class="Head"><asp:label id="lblTitle" resourcekey="Wizard" runat="server"></asp:label>
				-
				<asp:label id="Label2" resourcekey="Step2" runat="server"></asp:label></font>
			<br>
			<font class="Normal">
				<asp:label id="Label1" resourcekey="GallerySize" runat="server"></asp:label>
			</font>
		</td>
	</tr>
	<tr>
		<td class="WizardBody">
			<p>
				<table width="100%" runat="server" class="Normal">
					<tr>
						<td width="145">
							<asp:label id="plGalleryWidth" runat="server" resourcekey="Width"></asp:label>:</td>
						<td>
							<asp:textbox id="txtGalleryWidth" runat="server" CssClass="NormalTextBox" Width="100px"></asp:textbox>px
							<asp:rangevalidator id="RangeValidator19" runat="server" resourcekey="20to2000" Type="Integer" MinimumValue="20"
								MaximumValue="2000" ControlToValidate="txtGalleryWidth"></asp:rangevalidator>
							<asp:regularexpressionvalidator id="Regularexpressionvalidator6" runat="server" resourcekey="InvalidInput" ControlToValidate="txtGalleryWidth"
								ValidationExpression="\d*" ErrorMessage="Invalid input"></asp:regularexpressionvalidator></td>
					</tr>
					<tr>
						<td>
							<asp:label id="plGalleryHeight" runat="server" resourcekey="Height"></asp:label>:</td>
						<td>
							<asp:textbox id="txtGalleryHeight" runat="server" CssClass="NormalTextBox" Width="100px"></asp:textbox>px
							<asp:rangevalidator id="RangeValidator20" runat="server" resourcekey="20to2000" Type="Integer" MinimumValue="20"
								MaximumValue="2000" ControlToValidate="txtGalleryHeight"></asp:rangevalidator>
							<asp:regularexpressionvalidator id="Regularexpressionvalidator7" runat="server" resourcekey="InvalidInput" ControlToValidate="txtGalleryHeight"
								ValidationExpression="\d*" ErrorMessage="Invalid input"></asp:regularexpressionvalidator></td>
					</tr>
				</table>
			</p>
		</td>
	</tr>
	<tr>
		<td class="WizardFooter" align="right"><input type=button onclick="javascript:window.history.go(-1);" value="<%=Localize("Previous")%>">&nbsp;<asp:button id="btnNextStep" resourcekey="Next" runat="server" Text="Button"></asp:button>&nbsp;</td>
	</tr>
</table>

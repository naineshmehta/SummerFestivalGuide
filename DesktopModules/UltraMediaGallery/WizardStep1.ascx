<%@ Control Language="vb" AutoEventWireup="false" Codebehind="WizardStep1.ascx.vb" Inherits="BizModules.UltraPhotoGallery.WizardStep1" %>
<table class="Wizard" width="100%" border="0">
	<tr>
		<td class="WizardHeader"><font class="Head"><asp:label id="lblTitle" resourcekey="Wizard" runat="server"></asp:label>
				-
				<asp:label id="Label2" resourcekey="Step1" runat="server"></asp:label></font>
			<br />
			<font class="Normal">
				<asp:label id="Label1" resourcekey="PreferedPresentation" runat="server"></asp:label>
			</font>
		</td>
	</tr>
	<tr>
		<td class="WizardBody">
		<asp:label id="Label3" resourcekey="lblChoosePresentation" runat="server" CssClass="Normal"></asp:label>
		<p class="SubSubHead">
		<asp:RadioButton ID="rdoFullFeaturedFlash" resourcekey="SmallGallery" runat="server"
                                        GroupName="Presentation" AutoPostBack="True"></asp:RadioButton>
                                    <asp:RadioButton ID="rdoSimpleFlash" resourcekey="LargeGallery" runat="server" GroupName="Presentation"
                                        AutoPostBack="True"></asp:RadioButton>
                                    <asp:RadioButton ID="rdoHtml" resourcekey="SlidersAndRotators" runat="server" GroupName="Presentation"
                                        AutoPostBack="True"></asp:RadioButton>
                                        </p>

			                        <asp:RadioButtonList ID="rdoPresentations" runat="server" DataValueField="ItemId"
                                        DataTextField="Name" CssClass="Normal">
                                    </asp:RadioButtonList>
                                    
                                    <p>
                                    <asp:label id="Label4" resourcekey="FeaturedDisplayOnly" runat="server" CssClass="Normal"></asp:label>
                                    </p>
		</td>
	</tr>
	<tr>
		<td class="WizardFooter" align="right"><asp:button id="btnNextStep" resourcekey="NextStep" runat="server" Text="Button"></asp:button>&nbsp;</td>
	</tr>
</table>

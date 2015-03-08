<%@ Control Language="vb" AutoEventWireup="false" Codebehind="HeadlineAppearance.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.HeadlineAppearance" %>
<%@ Register TagPrefix="dnn" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ucColorPicker" Src="ucColorPicker.ascx" %>

<table cellSpacing="5" width="100%" id="tblContainer" runat="server">
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshColors" runat="server" resourcekey="Colors" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblColors" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200">
					<asp:Label ID="plbackgroundColor" runat="server" resourcekey="backgroundColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="backgroundColor" runat="server" Color="1A1A1A">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="pltextColor" runat="server" resourcekey="textColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="textColor" runat="server">
					</uc1:uccolorpicker></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="plIndicatorColor" runat="server" resourcekey="IndicatorColor"></asp:Label></td>
				<td class="Normal">
					<uc1:uccolorpicker id="indicatorColor" runat="server" Color="00FF00">
					</uc1:uccolorpicker></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="SectionHeader"><dnn:sectionhead id="dshAppearance" runat="server" resourcekey="AppearanceAndBehaviors" section="tblColors" IncludeRule="False" CssClass="SubHead" maximageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle1.gif"
                minimageurl="~/DesktopModules/UltraMediaGallery/Images/Triangle2.gif">
            </dnn:SectionHead></td>
	</tr>
	<tr>
		<td class="UMGMenuBody">
			<table id="tblAppearance" width="100%" runat="server" class="Normal">
			<tr>
				<td width="200">
					<asp:Label ID="pltextSize" runat="server" resourcekey="textSize"></asp:Label></td>
				<td class="Normal">
								<asp:dropdownlist id="textSize" runat="server">
									<asp:ListItem Value="9"></asp:ListItem>
									<asp:ListItem Value="10"></asp:ListItem>
									<asp:ListItem Value="11"></asp:ListItem>
									<asp:ListItem Value="12"></asp:ListItem>
									<asp:ListItem Value="13"></asp:ListItem>
									<asp:ListItem Value="14"></asp:ListItem>
									<asp:ListItem Value="16"></asp:ListItem>
									<asp:ListItem Value="18"></asp:ListItem>
									<asp:ListItem Value="20"></asp:ListItem>
									<asp:ListItem Value="24"></asp:ListItem>
								</asp:dropdownlist></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="plDefaultSpeed" runat="server" resourcekey="DefaultSpeed"></asp:Label></td>
				<td class="Normal">
				<asp:DropDownList ID="defaultSpeed" runat="server" CssClass="NormalTextBox">
											<asp:ListItem Text="2"></asp:ListItem>
											<asp:ListItem Text="3"></asp:ListItem>
											<asp:ListItem Text="4"></asp:ListItem>
											<asp:ListItem Text="5"></asp:ListItem>
											<asp:ListItem Text="6"></asp:ListItem>
											<asp:ListItem Text="7"></asp:ListItem>
											<asp:ListItem Text="8"></asp:ListItem>
											<asp:ListItem Text="9"></asp:ListItem>
											<asp:ListItem Text="10"></asp:ListItem>
											<asp:ListItem Text="12"></asp:ListItem>
											<asp:ListItem Text="15"></asp:ListItem>
											<asp:ListItem Text="30"></asp:ListItem>
										</asp:DropDownList></td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="plNumericButtonSize" runat="server" resourcekey="NumericButtonSize"
					   ></asp:Label></td>
				<td class="Normal">
				<asp:dropdownlist id="numericButtonSize" runat="server">
									<asp:ListItem Value="16"></asp:ListItem>
									<asp:ListItem Value="18"></asp:ListItem>
									<asp:ListItem Value="20"></asp:ListItem>
									<asp:ListItem Value="22"></asp:ListItem>
									<asp:ListItem Value="24"></asp:ListItem>
									<asp:ListItem Value="26"></asp:ListItem>
									<asp:ListItem Value="28"></asp:ListItem>
									<asp:ListItem Value="30"></asp:ListItem>
									<asp:ListItem Value="32"></asp:ListItem>
									<asp:ListItem Value="34"></asp:ListItem>
									<asp:ListItem Value="36"></asp:ListItem>
								</asp:dropdownlist>
					</td>
			</tr>
			<tr>
				<td>
					<asp:Label ID="plTransition" runat="server" resourcekey="Transition"></asp:Label></td>
				<td class="Normal">
					<asp:DropDownList ID="transition" runat="server">
						<asp:ListItem Value="Fade-in">Fade-in</asp:ListItem>
						<asp:ListItem Value="Wipe">Wipe</asp:ListItem>
						<asp:ListItem Value="Curtain">Curtain</asp:ListItem>
						<asp:ListItem Value="Dissolve">Dissolve</asp:ListItem>
						<asp:ListItem Value="Fly-in">Fly-in</asp:ListItem>
						<asp:ListItem Value="Zoom">Zoom</asp:ListItem>
						<asp:ListItem Value="Squeeze">Squeeze</asp:ListItem>
						<asp:ListItem Value="Repeat">Repeat</asp:ListItem>
					</asp:DropDownList></td>
			</tr>
			<tr>
				<td></td>
				<td class="Normal">
					<asp:CheckBox ID="linkInCurrent" runat="server" resourcekey="openLinkInCurrent"></asp:CheckBox></td>
			</tr>
			<tr>
				<td></td>
				<td class="Normal">
					<asp:CheckBox ID="showTitle" runat="server" resourcekey="showTitle"></asp:CheckBox></td>
			</tr>
			</table>
		</td>
	</tr>
</table>
<p align="center">
	<asp:linkbutton class="CommandButton" id="cmdLoadDefault" runat="server" resourcekey="cmdLoadDefault"
		text="" borderstyle="none" CausesValidation="false"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdSaveAsDefault" runat="server" resourcekey="cmdSaveAsDefault"
		text="" borderstyle="none"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdUpdate" runat="server" resourcekey="cmdUpdate" text=""
		borderstyle="none"></asp:linkbutton>&nbsp;
	<asp:linkbutton class="CommandButton" id="cmdCancel" runat="server" resourcekey="cmdCancel" text=""
		borderstyle="none" causesvalidation="False"></asp:linkbutton>
</p>
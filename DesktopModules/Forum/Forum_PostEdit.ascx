<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="forum" TagName="Attachment" Src="~/DesktopModules/Forum/controls/AttachmentControl.ascx" %>
<%@ Control language="vb" CodeBehind="Forum_PostEdit.ascx.vb" AutoEventWireup="True" Inherits="DotNetNuke.Modules.Forum.PostEdit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnnweb" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<div class="Post-Edit">
    <table class="Forum_SearchContainer" cellspacing="0" cellpadding="0" width="100%" align="center">
	    <tr>
	        <td>
	            <table id="tblNewPost" runat="server" class="Forum_Border" cellpadding="0" cellspacing="0" width="100%">
	                <tr>
	                    <td colspan="2">
	                        <table cellpadding="0" cellspacing="0" width="100%">
	                            <tr>
	                                <td class="Forum_HeaderCapLeft"><asp:image id="imglftHeader" runat="server" /></td>
		                            <td class="Forum_Header" width="100%">
			                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
				                            <tr>
					                            <td>
					                                <asp:image id="imgAltHeader" runat="server" />
					                            </td>
					                            <td align="left" width="100%">&nbsp;
					                                <asp:label id="lblPostHeader" Runat="server" resourcekey="lblPostHeader" CssClass="Forum_HeaderText" />
					                            </td>
				                            </tr>
			                            </table>
		                            </td>
		                            <td class="Forum_HeaderCapRight"><asp:image id="imgrghtHeader" runat="server" /></td>
	                            </tr>
	                        </table>
	                    </td>
	                </tr>
				    <tr>
		                <td class="Forum_Row_AdminL" width="200px">
		                    <span class="Forum_Row_AdminText">
		                        <dnn:label id="plForum" runat="server" Suffix=":" controlname="ddlForum"></dnn:label>
			                </span>
		                </td>
		                <td class="Forum_Row_AdminR" align="left" width="80%">
			                <asp:dropdownlist id="ddlForum" runat="server" CssClass="Forum_NormalTextBox" Width="350px" />
		                </td>
	                </tr>
				    <tr id="rowSubject" runat="server">
		                <td class="Forum_Row_AdminL" width="200px">
		                    <span class="Forum_Row_AdminText">
		                        <dnn:label id="plSubject" runat="server" Suffix=":" controlname="txtSubject"></dnn:label>
			                </span>
		                </td>
		                <td class="Forum_Row_AdminR" align="left" width="80%">
		                    <asp:textbox id="txtSubject" runat="server" cssclass="Forum_NormalTextBox" width="350px" maxlength="100" />
		                    <asp:requiredfieldvalidator id="valSubject" runat="server" resourcekey="valSubject" CssClass="NormalRed" ControlToValidate="txtSubject" />
		                </td>
	                </tr>
				    <tr>
		                <td class="Forum_Row_Admin" valign="top" align="left" width="100%" colspan="2">
						<div style="min-height: 300px;">
							<dnn:texteditor id="teContent" runat="server" width="100%" height="250px"></dnn:texteditor>
		                    </div>
		                </td>
	                </tr>
				    <tr id="rowAttachments" runat="server" width="200px">
		                <td class="Forum_Row_AdminL" valign="top">
		                    <span class="Forum_Row_AdminText">
		                        <dnn:label id="plAttachments" runat="server" suffix=":" controlname="txtAttachments"></dnn:label>
			                </span>
		                </td>
		                <td class="Forum_Row_AdminR" align="left" width="80%">
			                <forum:Attachment ID="ctlAttachment" runat="server" Width="375px" />
		                </td>
	                </tr>
				    <tr id="rowPinned" runat="server">
		                <td class="Forum_Row_AdminL" width="200px">
		                    <span class="Forum_Row_AdminText">
		                        <dnn:label id="plPinned" runat="server" Suffix=":" controlname="chkPinned"></dnn:label>
			                </span>
		                </td>
		                <td class="Forum_Row_AdminR" align="left" width="80%">
		                    <asp:checkbox id="chkIsPinned" Runat="server" CssClass="Forum_NormalTextBox" />
		                </td>
	                </tr>
				    <tr id="rowNotify" runat="server">
	                    <td class="Forum_Row_AdminL" width="200px">
	                        <span class="Forum_Row_AdminText">
	                            <dnn:label id="plNotify" runat="server" Suffix=":" controlname="chkNotify"></dnn:label>
		                    </span>
	                    </td>
	                    <td class="Forum_Row_AdminR" align="left" width="80%">
	                        <asp:checkbox id="chkNotify" Runat="server" CssClass="Forum_NormalTextBox" />
	                    </td>
                    </tr>
				    <tr id="rowClose" runat="server" width="200px">
		                <td class="Forum_Row_AdminL">
		                    <span class="Forum_Row_AdminText">
		                        <dnn:label id="plClose" runat="server" Suffix=":" controlname="chkClose"></dnn:label>
			                </span>
		                </td>
		                <td class="Forum_Row_AdminR" align="left">
		                    <asp:checkbox id="chkIsClosed" Runat="server" CssClass="Forum_NormalTextBox" />
		                </td>
	                </tr>
                    <tr id="rowThreadStatus" runat="server">
                        <td class="Forum_Row_AdminL" width="200px">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plThreadStatus" runat="server" ControlName="ddlThreadStatus" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR">
						<dnnweb:DnnComboBox ID="dnncbThreadStatus" runat="server" AutoPostBack="true" CausesValidation="false" />
                        </td>
                    </tr>
				<tr id="rowTagging" runat="server" visible="false">
					<td class="Forum_Row_AdminL" width="200px">
						<span class="Forum_Row_AdminText">
                                <dnn:Label ID="plTerms" runat="server" ControlName="tsTerms" Suffix=":" />
                            </span>
					</td>
					<td align="left" class="Forum_Row_AdminR">
						<dnnweb:TermsSelector ID="tsTerms" runat="server" Height="250" Width="350px" />
					</td>
				</tr>
	                <tr>
				     <td class="Forum_Row_Admin_Foot" colspan="2">&nbsp;</td>
				 </tr>
	            </table>
	            <table id="tblPoll" runat="server" class="Forum_Border" cellpadding="0" cellspacing="0" width="100%">
	                <tr>
		                <td colspan="2">
	                        <table cellpadding="0" cellspacing="0" width="100%">
	                            <tr>
	                                <td class="Forum_AltHeaderCapLeft">&nbsp;</td>
		                            <td class="Forum_AltHeader" width="100%">
			                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
				                            <tr>
					                            <td>
					                                <asp:image id="imgAltHeaderPoll" runat="server" />
					                            </td>
					                            <td align="left" width="100%">&nbsp;
					                                <asp:label id="lblPostPollHeader" Runat="server" resourcekey="lblPostPollHeader" CssClass="Forum_AltHeaderText" />
					                            </td>
				                            </tr>
			                            </table>
		                            </td>
		                            <td class="Forum_AltHeaderCapRight">&nbsp;</td>
	                            </tr>
	                        </table>
	                    </td>
	                </tr>
                    <tr valign="top">
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plQuestion" runat="server" ControlName="txtQuestion" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <asp:TextBox ID="txtQuestion" runat="server" CssClass="Forum_NormalTextBox" Height="50px" MaxLength="500" TextMode="MultiLine" Width="350px" />
                            <asp:TextBox ID="txtPollID" runat="server" Visible="false" /> 
                        </td>
                    </tr>
                    <tr>
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plAnswers" runat="server" ControlName="dgAnswers" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <asp:DataGrid id="dgAnswers" AutoGenerateColumns="false" width="350px" CellPadding="4"
                                            GridLines="None" cssclass="DataGrid_Container" Runat="server">
                                            <headerstyle cssclass="NormalBold" verticalalign="Top" horizontalalign="Left" />
                                            <itemstyle cssclass="DataGrid_Item" horizontalalign="Left" />
                                            <alternatingitemstyle cssclass="DataGrid_AlternatingItem" />
                                            <edititemstyle cssclass="NormalTextBox" />
                                            <selecteditemstyle cssclass="NormalRed" />
                                            <footerstyle cssclass="DataGrid_Footer" />
                                            <pagerstyle cssclass="DataGrid_Pager" />
                                            <columns>
                                                <dnn:imagecommandcolumn CommandName="Delete" KeyField="AnswerID" />
                                                <dnn:imagecommandcolumn CommandName="MoveDown" HeaderText="Dn" KeyField="AnswerID" />
                                                <dnn:imagecommandcolumn CommandName="MoveUp" HeaderText="Up" KeyField="AnswerID" />
                                                <dnn:textcolumn DataField="Answer" HeaderText="Answer" Width="200px"></dnn:textcolumn>
                                            </columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plNewAnswer" runat="server" ControlName="txtAddAnswer" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <asp:TextBox runat="server" ID="txtAddAnswer" CssClass="Forum_NormalTextBox" Width="300px" MaxLength="200" />
                            <asp:LinkButton ID="cmdAddAnswer" runat="server" CausesValidation="False" CssClass="CommandButton" resourcekey="cmdAddAnswer" />
                            <asp:Label ID="lblNoAnswer" runat="server" CssClass="NormalRed" Visible="False" resourcekey="lblNoAnswer" />
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plTakenMessage" runat="server" ControlName="txtTakenMessage" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <asp:TextBox ID="txtTakenMessage" runat="server" CssClass="Forum_NormalTextBox" Height="50px" MaxLength="500" TextMode="MultiLine" Width="350px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plShowResults" runat="server" ControlName="chkShowResults" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <asp:CheckBox ID="chkShowResults" runat="server" CssClass="Forum_NormalTextBox" />
                        </td>
                    </tr>                 
                    <tr>
                        <td class="Forum_Row_AdminL" width="200">
                            <span class="Forum_Row_AdminText">
                                <dnn:Label ID="plEndDate" runat="server" ControlName="txtEndDate" Suffix=":" />
                            </span>
                        </td>
                        <td align="left" class="Forum_Row_AdminR" width="80%">
                            <table cellpadding="0" cellspacing="0" border="0" id="PollEndDate">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="Forum_NormalTextBox" Width="150px" />
                                    </td>
                                    <td>
                                        &nbsp;<asp:HyperLink ID="cmdCalEndDate" runat="server" resourcekey="cmdCalEndDate" />
                                    </td>
                                </tr>
                            </table>
                        </td>                           
                    </tr>
	                <tr>
	                    <td class="Forum_Row_Admin_Foot" colspan="2">&nbsp;</td>
	                </tr>
			    </table>
			  <table id="tblPreview" runat="server" class="Forum_Border" cellpadding="0" cellspacing="0" width="100%" visible="false">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td class="Forum_HeaderCapLeft">
									<asp:Image ID="imgPrevSpaceL" runat="server" />
								</td>
								<td class="Forum_Header" width="100%">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td>
											    <asp:image id="imgAltHeaderPreview" runat="server" />
											</td>
											<td align="left" width="100%">&nbsp;
											    <asp:label id="lblPreviewHead" Runat="server" resourcekey="lblPreviewHead" CssClass="Forum_HeaderText" />
											</td>
										</tr>
									</table>
								</td>
								<td class="Forum_HeaderCapRight">
									<asp:Image ID="imgPrevSpaceR" runat="server" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table cellspacing="0" cellpadding="0" border="0" width="100%">
			                    <tr valign="top">
				                    <td width="80%" class="Forum_Row_Admin" align="left">
				                        <div style="padding: 10px 10px 10px 0px">
				                            <asp:label id="lblPreview" Runat="server" CssClass="Forum_Normal" />
				                        </div>
				                    </td>
			                    </tr>
		                    </table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr id="rowModerate" runat="server" visible="false">
		   <td align="center" width="100%">
                <asp:label id="lblModerate" Runat="server" CssClass="Forum_NormalBold" resourcekey="lblModerate"/>
		   </td>
	</tr>
	<tr>
	        <td align="center" width="100%">
			  <asp:linkbutton cssclass="CommandButton" id="cmdBackToForum" runat="server" resourcekey="cmdBackToForum" />
	            <asp:linkbutton cssclass="CommandButton primary-action" id="cmdSubmit" runat="server" resourcekey="cmdSubmit" />
	            <asp:linkbutton cssclass="CommandButton" id="cmdBackToEdit" runat="server" resourcekey="cmdReturnToEdit" CausesValidation="False" />
	            <asp:linkbutton cssclass="CommandButton" id="cmdCancel" runat="server" resourcekey="cmdCancel" CausesValidation="False" />&nbsp;
			  <asp:linkbutton cssclass="CommandButton" id="cmdPreview" runat="server" resourcekey="cmdPreview" CausesValidation="false" />
		   </td>
	    </tr>
	<tr>
		<td align="center" width="100%">
			<asp:label id="lblInfo" Runat="server" CssClass="NormalRed" />
		</td>
	</tr>
	<tr>
		<td>
			<br />
			<table id="tblOldPost" runat="server" class="Forum_Border" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="Forum_HeaderCapLeft">
								<asp:Image ID="imgReplyLeft" runat="server" />
							</td>
	                                <td class="Forum_Header" width="100%">
		                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
			                                <tr>
				                                <td>
				                                    <asp:image id="imgAltHeaderReply" runat="server" />
				                                </td>
				                                <td align="left" width="100%">&nbsp;
				                                    <asp:label id="lblPostReplyHeader" Runat="server" resourcekey="lblPostReplyHeader" CssClass="Forum_HeaderText" />&nbsp;
				                                    <asp:HyperLink id="hlAuthor" runat="server" CssClass="Forum_HeaderText" Target="_blank" />
				                                </td>
			                                </tr>
		                                </table>
	                                </td>
	                                <td class="Forum_HeaderCapRight"><asp:Image ID="imgReplyRight" runat="server" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
	                    <td>
		                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
			                    <tr valign="top">
				                    <td width="80%" class="Forum_Row_Admin" align="left">
				                        <div style="padding: 10px 10px 10px 0px">
				                            <asp:label id="lblMessage" runat="server" CssClass="Forum_Normal" />
				                        </div>
				                    </td>
			                    </tr>
		                    </table>
	                    </td>
                    </tr>
	          </table>
		</td>
	</tr>
</table>
</div>
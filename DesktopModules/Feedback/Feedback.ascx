<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Codebehind="Feedback.ascx.vb" Inherits="DotNetNuke.Modules.Feedback.Feedback" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<div id="divFeedbackForm" runat="server">
    <div class="Normal Feedback_Instructions">
       <asp:Label id="lblInstructions" AssociatedControlID="divContactBlock" runat="server"></asp:Label>
    </div>
    <div class="SubHead Feedback_SectionHead">
      <dnn:Label id="plContactInfo" runat="server" ControlName="divContactBlock" Suffix=":"></dnn:Label>
    </div>
    <div id="divContactBlock" runat="server" class="Feedback_ContactBlock">
         <div id="divEmail" runat="server" class="Feedback_Field">
		      <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plEmail" runat="server" controlname="txtEmail" suffix=":"></dnn:label>
	          </div>
	          <div class="Feedback_FieldValue">
			    <asp:textbox id="txtEmail" runat="server" cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="256" ></asp:textbox><asp:Image ID="imgRequiredEmail" runat="server" ImageUrl="~/images/required.gif"  ImageAlign="Top" CssClass="Feedback_Required" />
		      </div>
		      <asp:requiredfieldvalidator id="valEmail1" runat="server" cssclass="NormalRed" Display="Dynamic" errormessage="Email is required."
				    controltovalidate="txtEmail" InitialValue="" resourcekey="valEmail1.Error"></asp:requiredfieldvalidator>
			  <asp:regularexpressionvalidator id="valEmail2" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Email must be valid."
				    controltovalidate="txtEmail" resourcekey="valEmail2.Error" validationexpression="\b[a-zA-Z0-9._%\-+']+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,4}\b"></asp:regularexpressionvalidator>
	    </div>
	    <div id="divName" runat="server" visible="false" class="Feedback_Field">
		      <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plName" runat="server" controlname="txtName" suffix=":"></dnn:label>
		      </div>
	          <div class="Feedback_FieldValue">
			    <asp:textbox id="txtName" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="200" ></asp:textbox><asp:Image ID="imgRequiredName" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valName" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Name is required."
				    controltovalidate="txtName" InitialValue="" Enabled="false" resourcekey="valName.Error"></asp:requiredfieldvalidator>
    		  </div>
	    </div>
	    <div id="divStreet" runat="server" visible="false" class="Feedback_Field">
		      <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plStreet" runat="server" controlname="txtStreet" suffix=":"></dnn:label>
		      </div>
	          <div class="Feedback_FieldValue">
			    <asp:textbox id="txtStreet" runat="server" cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="50" ></asp:textbox><asp:Image ID="imgRequiredStreet" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valStreet" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Street is required."
				    controltovalidate="txtStreet" InitialValue="" Enabled="false" resourcekey="valStreet.Error"></asp:requiredfieldvalidator>
		      </div>
	    </div>
	    <div id="divCity" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plCity" runat="server" controlname="txtCity" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtCity" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="35" ></asp:textbox><asp:Image ID="imgRequiredCity" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valCity" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="City is required."
				    controltovalidate="txtCity" InitialValue="" Enabled="false" resourcekey="valCity.Error"></asp:requiredfieldvalidator>
		    </div>
	    </div>
	    <div id="divRegion" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plRegion" runat="server" controlname="txtRegion" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtRegion" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="35" ></asp:textbox><asp:Image ID="imgRequiredRegion" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valRegion" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Region is required."
				    controltovalidate="txtRegion" InitialValue="" Enabled="false" resourcekey="valRegion.Error"></asp:requiredfieldvalidator>
		    </div>
	    </div>
	    <div id="divCountry" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plCountry" runat="server" controlname="txtCountry" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtCountry" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="35" ></asp:textbox><asp:Image ID="imgRequiredCountry" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valCountry" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Country is required."
				    controltovalidate="txtCountry" InitialValue="" Enabled="false" resourcekey="valCountry.Error"></asp:requiredfieldvalidator>
		    </div>
	    </div>
	    <div id="divPostalCode" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plPostalCode" runat="server" controlname="txtPostalCode" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtPostalCode" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="35" ></asp:textbox><asp:Image ID="imgRequiredPostalCode" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valPostalCode" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Postal Code is required."
				    controltovalidate="txtPostalCode" InitialValue="" Enabled="false" resourcekey="valPostalCode.Error"></asp:requiredfieldvalidator>
				<asp:regularexpressionvalidator id="valPostalCode2" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Postal Code must be valid."
				    controltovalidate="txtPostalCode" resourcekey="valPostalCode2.Error"></asp:regularexpressionvalidator>    	
		    </div>
	    </div>
	    <div id="divTelephone" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plTelephone" runat="server" controlname="txtTelephone" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtTelephone" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="16" ></asp:textbox><asp:Image ID="imgRequiredTelephone" runat="server" Visible="false" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valTelephone" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Telephone is required."
				    controltovalidate="txtTelephone" InitialValue="" Enabled="false" resourcekey="valTelephone.Error"></asp:requiredfieldvalidator>
			    <asp:regularexpressionvalidator id="valTelephone2" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Telephone Must be Valid."
				    controltovalidate="txtTelephone" resourcekey="valTelephone2.Error"></asp:regularexpressionvalidator>
		    </div>
	    </div>
    </div>
    <div class="SubHead Feedback_SectionHead">
      <dnn:Label id="plFeedback" runat="server" ControlName="Message" Suffix=":"></dnn:Label>
    </div>
    <div id="divMessageBlock" runat="server" class="Feedback_MessageBlock">
        <div id="divCategory" runat="Server" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plCategory" runat="server" controlname="cboCategory" suffix=":"></dnn:label>
		    </div>
		    <div class="Feedback_FieldValue">
			    <asp:DropDownList id="cboCategory" runat="server" Cssclass="NormalTextBox" ></asp:DropDownList>
		    </div>
	    </div>
        <div id="divSubject" runat="server" visible="false" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plSubject" runat="server" controlname="cboSubject" suffix=":"></dnn:label>
		    </div>
		    <div class="Feedback_FieldValue">
			    <asp:DropDownList id="cboSubject" runat="server" Cssclass="NormalTextBox" ></asp:DropDownList>
		    </div>
	    </div>
        <div id="divSubject2" runat="server" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plSubject2" runat="server" controlname="txtSubject" suffix=":"></dnn:label>
		    </div>
	        <div class="Feedback_FieldValue">
			    <asp:textbox id="txtSubject" runat="server"  cssclass="NormalTextBox Feedback_ControlWidth"
				    maxlength="200" ></asp:textbox><asp:Image ID="imgRequiredSubject2" runat="server" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:RequiredFieldValidator ID="valSubject2" runat="server" CssClass="NormalRed" Display="Dynamic" ErrorMessage="Subject is required"
			       ControlToValidate="txtSubject" InitialValue="" resourceKey="valSubject2.Error"></asp:RequiredFieldValidator>
		    </div>
	    </div>
        <div id="divMessage" runat="server" class="Feedback_Field">
		    <div class="SubHead Feedback_FieldLabel">
			    <dnn:label id="plMessage" runat="server" controlname="txtBody" suffix=":"></dnn:label>
			</div>
			<div class="Feedback_FieldValue">
			    <asp:textbox id="txtBody" runat="server"  textmode="Multiline" rows="10"
				    cssclass="NormalTextBox Feedback_ControlWidth"></asp:textbox><asp:Image ID="imgRequiredMessage" runat="server" ImageUrl="~/images/required.gif" ImageAlign="Top" CssClass="Feedback_Required" />
			    <asp:requiredfieldvalidator id="valMessage" runat="server" cssclass="NormalRed" display="Dynamic" errormessage="Message is required"
				    controltovalidate="txtBody" InitialValue="" resourcekey="valBody.Error"></asp:requiredfieldvalidator>
			</div>
	      </div>
    </div>
    <div id="divFooter" runat="server" class="Feedback_FooterBlock">
	    <div id="divCopy" runat="server">
		     <div class="SubHead">
			    <asp:CheckBox id="chkCopy" Runat="server" cssclass="NormalTextBox Feedback_ControlWidth"></asp:CheckBox><dnn:label id="plCopy" runat="server" controlname="chkCopy" suffix="?"></dnn:label>
		     </div>
	    </div>
	    <div id="divCaptcha1" runat="server" class="Subhead Feedback_CaptchaLabel">
		          <dnn:label id="plCaptcha" runat="server" text="Captcha:"></dnn:label>&nbsp;
  	              <asp:ImageButton ID="btnRefreshCaptcha" resourcekey="btnRefreshCaptcha" runat="server" ImageUrl="~/images/refresh.gif" CausesValidation="false" />
	    </div>
	    <div id="divCaptcha2" runat="server" class="Feedback_CaptchaControl">
  	          <dnn:captchacontrol  id="ctlCaptcha" captchawidth="130" captchaheight="40" cssclass="Normal" runat="server" errorstyle-cssclass="NormalRed"  />
		</div>
	    <div class="Feedback_CommandButtons">
	          <asp:linkbutton id="cmdSend" resourcekey="cmdSend" runat="server" cssclass="CommandButton">Send Feedback</asp:linkbutton>
	    </div>
    </div>
</div>    
<div id="divConfirmation" runat="server" class="Feedback_Confirmation" Visible="False">
   <asp:label id="lblMessage" runat="server" cssclass="NormalRed"></asp:label><br /><br />
   <asp:linkbutton id="cmdCancel" resourcekey="cmdCancel" runat="server" cssclass="CommandButton" CausesValidation="False">Cancel</asp:linkbutton>
</div>

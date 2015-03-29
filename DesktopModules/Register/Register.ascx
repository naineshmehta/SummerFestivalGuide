<%@ Control Language="C#" AutoEventWireup="true" Inherits="DotNetNuke.Modules.Admin.Users.Register" Codebehind="Register.ascx.cs" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls"%>
<%@ Register TagPrefix="recaptcha" Namespace="iwebs.Recaptcha" Assembly="iwebs.Recaptcha" %>
<div class="dnnForm dnnRegistrationForm">
    <div class="dnnFormItem">
        <div class="dnnFormMessage dnnFormInfo"><asp:label id="userHelpLabel" runat="server" /></div>
    </div>
    <br/>
    <div class="dnnFormItem dnnClear">
        <dnn:DnnFormEditor id="userForm" runat="Server" FormMode="Short" />
        <div class="dnnSocialRegistration">
            <div id="mainContainer">
                <ul class="buttonList">
                    <asp:PlaceHolder ID="socialLoginControls" runat="server"/>
                </ul>
            </div>
        </div>
    </div>
    <div id="captchaRow" runat="server" visible="false" class="dnnFormItem dnnCaptcha">
        <dnn:label id="captchaLabel" controlname="ctlCaptcha" runat="server" />
        <recaptcha:RecaptchaControl
            ID="recaptcha"
            runat="server"
            PublicKey="null"
            PrivateKey="null"

            />
            <asp:Literal ID="ltCustom" runat="server"></asp:Literal>
    </div>
    <div id="actionsRow" runat="server" class="dnnActions dnnClear" style="text-align:center;display:block;">
        <asp:LinkButton id="registerButton" runat="server" CssClass="dnnPrimaryAction" resourcekey="cmdRegister" />
        <asp:LinkButton id="cancelButton" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdCancel" CausesValidation="false" />
    </div>
</div>
<style>
#recaptcha_widget_div
{
    display:inline-block;
}
</style>

<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_initializeRequest(initRequest);
    function initRequest(sender, args) {
        if (true) {
            args.set_cancel(true);  //stop async request
            sender._form["__EVENTTARGET"].value = args.get_postBackElement().id.replace(/\_/g, "$");
            sender._form["__EVENTARGUMENT"].value = "";
            sender._form.submit();
            return;
        }
    }
</script>
<script type="text/javascript">
    $(function () {
        $('.dnnFormItem .dnnLabel').each(function () {
            var next = $(this).next();
            if (next.hasClass('dnnFormRequired'))
                $(this).find('span').addClass('dnnFormRequired');
        });
    });
</script>

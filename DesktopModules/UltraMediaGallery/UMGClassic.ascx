<%@ Control Language="vb" AutoEventWireup="false" Codebehind="UMGClassic.ascx.vb" Inherits="BizModules.UltraPhotoGallery.UMGClassic" %>

<div class="umgclassic" id="classic<%=ModuleId %>" style="width: <%=GalleryWidthEx %>px; height: <%=GalleryHeightEx %>px;">
<div class="datahtml">
<%=DataHtml %>
</div>
</div>

<script type="text/javascript">			
jQuery(document).ready(function() {
    launchclassic<%=ModuleId %>();
    var req=Sys.WebForms.PageRequestManager.getInstance();
    if (req)
	    req.add_endRequest(EndRequestHandler<%=ModuleId %>);
});
function launchclassic<%=ModuleId %>()
{
    jQuery("#classic<%=ModuleId %>").umgclassic({<%=Params %>});
}
function EndRequestHandler<%=ModuleId %>(sender, args){
    launchclassic<%=ModuleId %>();
} 
</script>
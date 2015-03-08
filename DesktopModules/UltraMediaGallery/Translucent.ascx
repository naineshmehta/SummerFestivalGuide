<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Translucent.ascx.vb"
    Inherits="BizModules.UltraPhotoGallery.Translucent" %>
    
<div id='umg_trans<%=ModuleId %>' class="TB_Wrapper" style="width:<%=GalleryWidthEx %>px;height:<%=GalleryHeightEx %>px;background: #eee url(<%=ResolveUrl("Css/Translucent/preloader.gif") %>) center center no-repeat;display:inline-block;">

<%=DataHtml %>

</div>

<script type="text/javascript">

jQuery(document).ready(function(){
		
	jQuery("#umg_trans<%=ModuleId %>").TransBanner( { 
	    <%=Params %>
	});	
	
});

</script>

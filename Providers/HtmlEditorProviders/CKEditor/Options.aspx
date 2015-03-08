<%@ Page language="c#" Codebehind="Options.aspx.cs" AutoEventWireup="True" Inherits="WatchersNET.CKEditor.Options" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="language" content="en" />
    <title>CKEditor Options</title>
    <asp:PlaceHolder id="favicon" runat="server"></asp:PlaceHolder>
    <style type="text/css">
      body {background-color:#ededed;font-family: Arial, Verdana;color: #333;font-size:small;}
      a:hover {color:rgb(204, 0, 0);}
      hr {color: #d9d9d9;background-color: #d9d9d9;height:0px;border: 1px solid #d9d9d9;}
      h1 {font-weight: bold;margin: 0px;font-size:medium;font-family:Arial, Helvetica, sans-serif; color:#333}
      .ui-tabs .ui-tabs-panel {border: 1px dotted #333; -moz-border-radius: 0.4em; -webkit-border-radius: 0.4em;border-radius: 0.4em; display:block;overflow: auto;height:500px;margin-top:5px;}
	  .SettingBox {width:100%;padding-left: 5px; margin-right: 15px;float: left; }
	  #SettingsBox {height:400px;margin-bottom:10px;padding:10px;padding-right:20px;min-width:550px;border:1px solid #ccc; -moz-border-radius: 0.4em; -webkit-border-radius: 0.4em;border-radius: 0.4em;background-color:white;min-width:500px;}
      #tblMainSet td, #tblMainSet th {padding: 2px;margin: 2px;}
      #ckeditoroptions_ctlConfigUrl_TypeRow br,
      #ckeditoroptions_ctlStylesURL_TypeRow br,
      #ckeditoroptions_ctlCSSURL_TypeRow br,
      #ckeditoroptions_ctlTemplUrl_TypeRow br {display:none;}
	  
	  input[type="text"] {-moz-border-radius: 5px;-webkit-border-radius: 5px;-o-border-radius: 5px;border-radius: 5px;}
      
	  /* Default Buttons */
      input[type="submit"] {margin: 5px 3px;padding: 5px 10px 6px;color: black;border:1px solid #999;background-color:#e4e4e4;background: -webkit-gradient(linear, left top, left bottom, from(#e4e4e4), to(#999));
	background: -moz-linear-gradient(top,  #e4e4e4,  #999);background: -o-linear-gradient(top,  #e4e4e4,  #999);-moz-border-radius: 5px;-webkit-border-radius: 5px;-o-border-radius: 5px;border-radius: 5px;-moz-transition: color .15s linear,background-color .15s linear;-webkit-transition: color .15s linear,background-color .15s linear;transition: color .15s linear,background-color .15s linear;cursor:pointer}

      input[type="submit"]:hover{background:#e4e4e4;background: -webkit-gradient(linear, left top, left bottom, from(#e4e4e4), to(#999));
	background: -moz-linear-gradient(top,  #e4e4e4,  #999);background: -o-linear-gradient(top,  #e4e4e4,  #999);text-decoration:none;color: #444;text-shadow: 0 1px 0 rgba(255,255,255, 1);}
	  input[type="submit"].DefaultButton {font-weight:bold;}
	  .ui-widget-content a,#lnkToolbarGuide,a, a:hover {color:rgb(204, 0, 0);	text-decoration: none;}
	  
	  .Hidden { position: absolute;top: -999px;left: -999px;}
	  
	  .DefaultDropDown {width:400px}
	  
	  .ui-widget-content {font-size:small;}
	  .ui-tabs li a {font-size:85%;}
    </style>
   
    <script type="text/javascript">
        $(document).ready(function () {
            $('#ExportDialog').dialog({
                autoOpen: false,
                width: 350,
                buttons: { "Cancel": function () { $(this).dialog("close"); }, "Export Now": function () { __doPostBack('ckeditoroptions$ExportNow', ''); $(this).dialog("close"); } },
                open: function () {
                    $(this).parent().appendTo("form");
                }
            });
            $('#ImportDialog').dialog({
                autoOpen: false,
                width: 350,
                buttons: { "Cancel": function () { $(this).dialog("close"); }, "Import Now": function () { __doPostBack('ckeditoroptions$lnkImportNow', ''); $(this).dialog("close"); } },
                open: function () {
                    $(this).parent().appendTo("form");
                }
            });
           $('#ToolbarGuide').dialog({
               autoOpen: false,
               buttons: { "OK": function () { $(this).dialog("close"); } } ,
               open: function () {
                   $(this).parent().appendTo("form");
               }
           });

           $("select, input:checkbox, input:radio, input:file").uniform();
       });

       function pageLoad() {
           $('#SettingsTabs').tabs(
               {
                   show: function() {
                       var sel = $('#SettingsTabs').tabs('option', 'selected');
                       $('#ckeditoroptions_LastTabId').val(sel);
                   },
                   selected: $('#ckeditoroptions_LastTabId').val()
               });

           $('#SettingsBox').height($(window).height() - 100);
           $('.ui-tabs .ui-tabs-panel').height($(window).height() - 260);
       }

       $(window).bind('resize', function () {
           $('#SettingsBox').height($(window).height() - 100);
           $('.ui-tabs .ui-tabs-panel').height($(window).height() - 260);
       });

       function showDialog(id) {
           $('#' + id).dialog("open");
       }
	</script>
  </head>
  <body>
    <form id="ckOptionsForm" runat="server">
	  <asp:PlaceHolder id="phControls" runat="server"></asp:PlaceHolder>
	</form>
  </body>
</html>

function ShowNotificationBar(n,t,i){showNotification({type:t,message:n,autoClose:!0,duration:20,imagepath:i})}function pageLoad(){jQuery(".panelLoading").show(),jQuery(".removeButton").button({icons:{primary:"ui-icon-trash"}}),jQuery(".importButton").button({icons:{primary:"ui-icon-arrowreturnthick-1-s"}}),jQuery(".exportButton").button({icons:{primary:"ui-icon-disk"}}),jQuery(".DefaultButton").button(),jQuery(".Toolbar").buttonset(),EnableSorting(),jQuery("#createGroup").click(function(){jQuery(".groups").append('<li class="groupItem"><span class="ui-icon ui-icon-cancel" title="'+deleteGroup+'"><\/span><span class="ui-icon ui-icon-arrowthick-2-n-s"><\/span><a href="#" class="groupName" title="'+editGroupName+'">'+newGroupName+'<\/a><input type="text" class="groupEdit"><div class="ui-state-default ui-corner-all saveGroupName"><span class="ui-icon ui-icon-check" title="'+saveGroupName+'"><\/div><ul class="groupButtons"><\/ul><div style="clear:both"><\/div><\/li>'),EnableSorting()}),jQuery("#addRowBreak").click(function(){jQuery(".groups").append('<li class="groupItem rowBreakItem"><span class="ui-icon ui-icon-cancel" title="'+deleteGroup+'"><\/span><span class="ui-icon ui-icon-arrowthick-2-n-s"><\/span><p class="rowBreakLabel">'+newRowName+'<\/p><a href="#" class="groupName" title="'+editGroupName+'">rowBreak<\/a><input type="text" class="groupEdit"><div class="ui-state-default ui-corner-all saveGroupName"><span class="ui-icon ui-icon-check" title="'+saveGroupName+'"><\/div><ul class="groupButtons"><li class="groupButton ui-state-default ui-corner-all rowBreak"><span class="ui-icon ui-icon-cancel"><\/span><span class="item">/<\/span><\/li><\/ul><div style="clear:both"><\/div><\/li>'),EnableSorting(),jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())}),jQuery("#SettingsTabs").tabs({activate:function(){var n=jQuery("#SettingsTabs").tabs("option","active");jQuery('[id*="CKEditor_Options_LastTabId"]').val(n)},active:jQuery('[id*="CKEditor_Options_LastTabId"]').val()}),jQuery("#SettingsBox").height(jQuery(window).height()-100),jQuery(".ui-tabs .ui-tabs-panel").height(jQuery(window).height()-285),jQuery("#ExportDialog").dialog({autoOpen:!1,width:350,buttons:{Cancel:function(){jQuery(this).dialog("close")},"Export Now":function(){window.location=jQuery(".ExportHidden").attr("href"),jQuery(this).dialog("close")}},open:function(){jQuery(this).parent().appendTo("form")}}),jQuery("#ImportDialog").dialog({autoOpen:!1,width:350,buttons:{Cancel:function(){jQuery(this).dialog("close")},"Import Now":function(){window.location=jQuery(".ImportHidden").attr("href"),jQuery(this).dialog("close")}},open:function(){jQuery(this).parent().appendTo("form")}}),jQuery("#ToolbarGuide").dialog({autoOpen:!1,buttons:{OK:function(){jQuery(this).dialog("close")}},open:function(){jQuery(this).parent().appendTo("form")}}),jQuery(".settingValueInputNumeric").spinner&&jQuery(".settingValueInputNumeric").spinner(),jQuery(".settingValueContainer").tooltip&&jQuery(".settingValueInputNumeric").tooltip(),jQuery("#CKEditor_Options_rBlSetMode input").button(),jQuery("#CKEditor_Options_rBlSetMode").buttonset()}function showDialog(n){jQuery("#"+n).dialog("open")}function EnableSorting(){jQuery(".rowBreakItem .rowBreak").parent("ul").length&&jQuery(".rowBreakItem .rowBreak").parent("ul").removeClass("groupButtons"),jQuery(".groups").sortable({connectWith:".groups",placeholder:"ui-state-highlight",update:function(){jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())}}),jQuery(".groupButtons").sortable({connectWith:".groupButtons",placeholder:"ui-state-highlight",start:function(){jQuery(".groupButtons").css("min-height","50px"),jQuery(".groupButtons").sortable("refreshPositions")},update:function(){jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())}}),jQuery(".availableButtons").sortable({connectWith:".groupButtons",placeholder:"ui-state-highlight",start:function(){jQuery(".groupButtons").css("min-height","50px"),jQuery(".groupButtons").sortable("refreshPositions")},remove:function(n,t){if(t.item.attr("class").indexOf("separator")!=-1){var i=t.item.clone(!0);i.children(".ui-icon").remove(),jQuery(this).append(i)}t.item.prepend('<span class="ui-icon ui-icon-cancel" title="Delete this Toolbar"><\/span>'),EnableSorting(),jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())},update:function(){}}),jQuery(".groups .ui-icon-cancel,.groupButtons .ui-icon-cancel").hide(),jQuery(".groups li,.groupButtons li").not(".rowBreak").hover(function(){jQuery(this).find(".ui-icon-cancel").eq(0).stop(!0,!0).fadeIn("fast")},function(){jQuery(this).find(".ui-icon-cancel").eq(0).stop(!0,!0).fadeOut("slow")}),jQuery(".groupItem .groupName").not(".rowBreakItem .groupName").click(function(){var n=jQuery(this),t=n.next();n.hide(),t.show(),t.val(n.html()).focus(),t.next().css("display","inline-block"),jQuery(".saveGroupName").click(function(){var n=jQuery(this).prev(),t=n.prev();t.show(),n.hide(),t.html(n.val()),jQuery(this).hide(),jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())})}),jQuery(".groups .ui-icon-cancel").click(function(){jQuery(this).parent(".groupItem").children(".groupButtons").children("li").each(function(){var n=jQuery(this);n.attr("class").indexOf("separator")==-1&&n.attr("class").indexOf("rowBreak")==-1&&(n.children(".ui-icon").remove(),jQuery(".availableButtons").children(".separator").before(n)),jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())}),jQuery(this).parent(".groupItem").remove()}),jQuery(".groupButtons .ui-icon-cancel").click(function(){var n=jQuery(this).parent("li");n.attr("class").indexOf("separator")==-1&&n.attr("class").indexOf("rowBreak")==-1?(n.children(".ui-icon").remove(),jQuery(".availableButtons").children(".separator").before(n)):n.remove(),jQuery('[id*="CKEditor_Options_ToolbarSet"]').val(jQuery(".groups").SerializeToolbars())}),jQuery(".panelLoading").hide()}jQuery(window).bind("resize",function(){jQuery("#SettingsBox").height(jQuery(window).height()-100),jQuery(".ui-tabs .ui-tabs-panel").height(jQuery(window).height()-285)}),function(n){n.fn.SerializeToolbars=function(){var t=[],n;return this.children().each(function(){var i=jQuery(this),n,r;i.has("li").length&&(n=[],i.children("ul").children("li").each(function(){var t=jQuery(this).children(".item").html();n.push(t)}),r={name:jQuery(this).children("a").html(),items:n},t.push(r))}),n=JSON.stringify(t),n.substring(1,n.length-1).replaceAll('"name"',"name").replaceAll('"items"',"items")}}(jQuery),String.prototype.replaceAll=function(n,t,i){var r,u=-1,f;if((r=this.toString())&&typeof n=="string")for(f=i===!0?n.toLowerCase():undefined;(u=f!==undefined?r.toLowerCase().indexOf(f,u>=0?u+t.length:0):r.indexOf(n,u>=0?u+t.length:0))!==-1;)r=r.substring(0,u).concat(t).concat(r.substring(u+n.length));return r};
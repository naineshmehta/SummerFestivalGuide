//------------------
//Friendly Urls js file
//Url Master 2.0 UI
//May 2010
//mods
//
//-------------------

//main jquery handler for page
jQuery(document).ready(function($){

    //main page loading function
    friendlyUrlsPageLoad();
    

});//end main jquery handler for page

function friendlyUrlsPageLoad()
{
    //onload actions
    jQuery("#tabs").tabs();
    // binding for jQuery ui up to 1.9
    jQuery("#tabs").bind('tabsshow', function (event, ui) {
        bindCurrentTabEvents(ui.index);
    });
        //bind for jQuery ui 1.9+
    jQuery("#tabs").on('tabsactivate', function (event, ui) {
        //this gets called on the click of a different tab
        bindCurrentTabEvents(ui.newTab.index());
    });

        
        enableUpdatePanelHandler(); //keep tabs index when updatepanel does partial postback
          
        //space replacement option
        jQuery("[name$='$chkReplaceSpaces']").change(function()
            {
                //if checked, hide text box
                var tb = jQuery("[name$='$txtReplaceSpaceWith']")
                if (this.checked == true)
                    tb.show();
                else
                {
                    tb.hide('slow');
                    tb.val("");
                    }
            });


            jQuery("[name$='$btnMigrateToAUM']").click(function () {
                showMigrateToAUMDialog();

            });

        //page extension handling
        jQuery("[name$='$optPageExtensionUsage']").change(function ()
        {
            var val = jQuery("[name$='$optPageExtensionUsage']:checked");
            showPageExtensionHandling(val, true);
        });
        
        
      
}

//global var for remembeing which tab we were on across postbacks
var selectedTabIndex=-1; var pageLoaded=0;
function enableUpdatePanelHandler()
{
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (prm != null)
    {
        //register the end and begin request handler events
        prm.add_endRequest(EndRequestHandler);
        prm.add_beginRequest(BeginRequestHandler);
    }
}
/// begin request event handler - triggered by MS ajax scriptmanager
function BeginRequestHandler(sender, args) 
{
    if (pageLoaded == 0)
    {
        pageLoaded = 1;
        var tabs = jQuery("#tabs").tabs();
        selectedTabIndex = tabs.tabs('option', 'selected');
        if (selectedTabIndex == null)
            selectedTabIndex = tabs.tabs('option', 'active');
        pageLoaded = 2;
    }
} 
/// end request event handler - triggered by MS ajax scriptmanager
function EndRequestHandler(sender, args) 
{
    if (pageLoaded > 1)
    {
        var tabs = jQuery("#tabs").tabs();
        //tabs.tabs('select', selectedTabIndex);
        //975 : .tabs('select' no longer valid
        tabs.tabs("option", "active", selectedTabIndex);
        friendlyUrlsPageLoad();//run the page load routine
        //re-hook tabSingleSelect events after postback
        if (selectedTabIndex == 4)
            ifty_tss.reHookAllEvents();
        if (selectedTabIndex == 4)
            showTestUrlSettings();
        pageLoaded = 0;//set back to initial state
    }
}
//bind on change of tab
function bindCurrentTabEvents(newIndex) {
    switch (newIndex)
    {
        case 0://friendlyUrlSettings
            var pageExtHandling = jQuery("[name$='$optPageExtensionUsage']:checked");
            showPageExtensionHandling(pageExtHandling, false);
            break;
        case 1://advancedSettings
            showAdvancedSettings();
            break;
        case 2:// regex settings
            break;
        case 3://performance settings
            break;
        case 4://testUrls 
            showTestUrlSettings();
            break;
    }
}

function showPageExtensionHandling(val, fromClick)
{
    var pageExt = jQuery("#pageExtension");
    var tb = jQuery("[name$='$txtPageExtension']");
    var tbVis = tb.is(":visible");
    switch (val.val())
    {
        case "Always":
            pageExt.show();
            if (tb.val()=="")
                tb.val(".aspx");
            break;
        case "Never":
            pageExt.hide('slow');
            tb.val("");
            if (fromClick)
                showPageExtensionWarning(val);
            break;
        case "PageOnly":
            pageExt.show();
            if (tb.val()=="")
                tb.val(".aspx");
            if (fromClick)
                showPageExtensionWarning(val);
            break;
    }
}
function showPageExtensionWarning(val) {
    //862: dnn6 changes to dialog
    jQuery('.pageExtDialog').dialog({ modal: true, dialogClass: 'umdialog', buttons: { "Ok": function () { jQuery(this).dialog("close"); } } });
    
}
function showDefaultRedirectWarning() {
    //862: dnn6 changes to dialog
    jQuery('.defaultRedirectDialog').dialog({ modal: true, dialogClass: 'umdialog', buttons: { "Ok": function () { jQuery(this).dialog("close"); } } });

}

function showMigrateToAUMDialog() {
    jQuery('.migrateDialog').dialog({ modal: true, dialogClass: 'umdialog', width: 350, buttons: { "Close": function () { jQuery(this).dialog("close"); location.reload(true); } } });
    jQuery(".migrateStatus").hide();
    var titleLabel = jQuery("[name$='lblMigrationTitle']");
    if (titleLabel.length)
        jQuery(".migrateDialog").dialog("option", "title", titleLabel.val());
    
}
function showAdvancedSettings()
{
    //setup dialog warning on click of checkbox
    jQuery("[name$='$chkRedirectDefaultPage']").change( function () 
    { 
        if (jQuery(this).is(':checked'))
            showDefaultRedirectWarning(); 
    });
}
function showTestUrlSettings()
{
    //set dummy link up
    jQuery('.copyToTestRewrite').attr('href',"#");
    //links up the buttons to copy text into the test url rewriting.
    jQuery('.copyToTestRewrite').click(function () {
        var label = jQuery(this).siblings('.friendlyUrlExample');
        //find friendly url result
        var example = label.html();
        jQuery("[name$='$txtTestRewrite']").val(example);
        return false;
    });
}

function migrateToAUM() {

    var moduleId = -1;
    var hdnModuleId = jQuery("#hdnModuleId");
    var txtMigrateStatus = jQuery(".migrateStatus");
    var doActivation = false;
    txtMigrateStatus.show('slow');
    txtMigrateStatus.val('Initialising Conversion Process');
    if (hdnModuleId.length) {
        moduleId = hdnModuleId.val();
    }
    if (moduleId > -1) {

        var sf = jQuery.ServicesFramework(moduleId);
        jQuery.ajax({
            type: "POST",
            url: sf.getServiceRoot('iFinity_UrlMaster') + "Migration/MigrateToAUM",
            beforeSend: sf.setModuleHeaders
        }).done(function (data) {
            if (data.Success == true) {
                var results = "Site Aliases: " + data.NumPortalAliases.toString() + "\n" +
                    "URL Settings: " + data.NumSettings.toString() + "\n" +
                    "Page Alias Skins: " + data.NumTabAliasSkins.toString() + "\n" +
                    "Page Custom Urls: " + data.NumTabUrls.toString() + "\n" +
                    "User Profile Urls: " + data.UserProfiles.toString() + "\n";
                txtMigrateStatus.val(txtMigrateStatus.val() + "...Success\n" + results);
                //now call the advanced mode activation
                txtMigrateStatus.val(txtMigrateStatus.val() + 'Activating Advanced Mode');
                jQuery.ajax({
                    type: "POST",
                    url: sf.getServiceRoot('iFinity_UrlMaster') + "Migration/ActivateAUM",
                    beforeSend: sf.setModuleHeaders
                }).done(function (data) {
                    if (data.Success == true) {
                        var results = "Deactivated Url Master\nActivated DNN Advanced Mode\nYour DNN install is now ready for use.";
                        txtMigrateStatus.val(txtMigrateStatus.val() + "...Success\n" + results);
                    } else {

                        txtMigrateStatus.val(txtMigrateStatus.val() + "...Failed\n" + "AUM Activation Unsuccessful" + "\n" + data.ErrorMessage);
                    }
                }).fail(function (xhr, result, status) {
                    txtMigrateStatus.val(txtMigrateStatus.val() + "...Failed\n" + "Operation Failed : " + status);
                });

            } else {

                txtMigrateStatus.val(txtMigrateStatus.val() + "\n" + "Conversion Unsuccessful");
            }
        }).fail(function (xhr, result, status) {
            txtMigrateStatus.val(txtMigrateStatus.val() + "\n" + "Operation Failed : " + status);
        });

        
    }

}

//ajax notification for safari, which doesn't notify upon load completion
if (typeof(Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
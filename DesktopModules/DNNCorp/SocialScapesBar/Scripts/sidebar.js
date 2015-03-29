jQuery(function ($) {
    $.dnn = $.dnn || {};
    $.dnn.popupSettings = $("#ssPopupSettings").overlay({ api: true, effect: 'apple' });

    $("#ssConfigure>a").click(function (event) {
        //eat the mouseclick
        event.preventDefault();

        //popup the settings form
        $.dnn.popupSettings.load();
    });

    $("#panelTab").slidepanel({ api: false, orientation: 'vertical' });

    var options = JSON.parse(dnn.getVar("ssSettings"));

    $("#ssTweetlist")
        .socialscapes({
            count: options.Count,
            refresh: options.Refresh,
            type: options.SearchType,
            search: options.SearchString,
            ShowToolTips: options.ShowToolTips
        });


    twttr.anywhere(function (T) {

        T("#ssTweetbox").tweetBox({
            height: 70,
            width: 375,
            label: "Leave your mark!"
        });

        if (options.ShowToolTips) {
            T("#ssTweetlist").hovercards();
//            T(".ssUser").hovercards({
//                username: function(node) {
//                    return node.rel;
//                }
//            });
        }

    });
});
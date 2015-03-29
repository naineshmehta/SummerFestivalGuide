jQuery.fn.reverse = Array.prototype.reverse;

String.prototype.linkify = function () {
    return this.replace(/[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+/g, function (m) {
        return m.link(m);
    });
};

String.prototype.linkuser = function () {
    return this.replace(/[@]+[A-Za-z0-9-_]+/g, function (u) {
        var username = u.replace("@", "");
        return u.link("http://twitter.com/" + username);
    });
};

String.prototype.linktag = function () {
    return this.replace(/[#]+[A-Za-z0-9-_]+/, function (t) {
        var tag = t.replace("#", "%23")
        return t.link("http://search.twitter.com/search?q=" + tag);
    });
};


(function ($) {

    /****************************************************
    *            Private Functions                      *
    ****************************************************/

    function fetch_tweets(options, elem) {
        switch(options.type){
            case "from":
                if (!elem.data('tweet')) { 
                    elem.data('tweet', {lastId: 0, timeout: null }); 
                    var url = "http://twitter.com/status/user_timeline/" + options.search + ".json?count=" + options.count+"&callback=?";
                }
                else {
                    var url = "http://twitter.com/status/user_timeline/" + options.search + ".json?count=" + options.count + "&since_id=" + elem.data('tweet').lastId + "&callback=?";
                }

                $.getJSON( url,  function (data) {
                    $.each(data.reverse(), function () {
                        elem.prepend(format_tweet(this, $("#tweetTemplate"), options.ShowToolTips));
                        elem.data('tweet').lastId = this.id;
                    });
                });
                break;
            case "to":
                if (!elem.data('tweet')) { 
                    elem.data('tweet', {lastId: 0, timeout: null }); 
                    var url = "http://search.twitter.com/search.json?to=" + options.search + "&rpp=" + options.count + "&callback=?";
                }
                else {
                    var url = "http://search.twitter.com/search.json?to=" + options.search + "&rpp=" + options.count + "&since_id=" + elem.data('tweet').lastId + "&callback=?";
                }

                var url = "http://search.twitter.com/search.json?to=" + options.search + "&rpp=" + options.count + "&callback=?";
                $.getJSON( url,  function (data) {
                    $.each(data.results.reverse(), function () {
                        elem.prepend(format_tweet(this, $("#searchTemplate"), options.ShowToolTips));
                        elem.data('tweet').lastId = this.id;
                    });
                });

                break;
            case "search":
                if (!elem.data('tweet')) { 
                    elem.data('tweet', {lastId: 0, timeout: null }); 
                    var url = "http://search.twitter.com/search.json?q=" + options.search + "&rpp=" + options.count + "&callback=?";
                }
                else {
                    var url = "http://search.twitter.com/search.json?q=" + options.search + "&rpp=" + options.count + "&since_id=" + elem.data('tweet').lastId + "&callback=?";
                }
                $.getJSON( url,  function (data) {
                    $.each(data.results.reverse(), function () {
                        elem.prepend(format_tweet(this, $("#searchTemplate"), options.ShowToolTips));
                    });
                });
                break;
        }
    }

    function format_tweet(tweet, template, ShowToolTips) {
        tweet.spacer = dnn.getVar("spacerImg");
        tweet.text = tweet.text.linkify().linktag();
        if (!ShowToolTips)
        {
            tweet.text = tweet.text.linkuser();
        }
        tweet.created_at = formatDate(tweet.created_at);
        return template.parseTemplate(tweet);
    }

    function formatDate(date) {
        var thedate = new Date(Date.parse(date));
        var thedatestr = thedate.getHours() + ':' + ((thedate.getMinutes() < 10) ? '0' + thedate.getMinutes() : thedate.getMinutes());
        return thedatestr;
    }
    /****************************************************
    *            Public Functions                       *
    ****************************************************/

    // We put all our public methods and objects in a 
    // common namespace so we don't pollute the jQuery namespaces.
    $.dnn = $.dnn || {};

    $.dnn.socialscapes = {

        version: '1.0.0',

        defaults: {
            count: 10,             //Number of tweets to request
            refresh: 15,           //Number of seconds to refresh
            type: "from",        //Valid values - search, from, to
            search: "jbrinkman" //Search query 
        }
    };

    /****************************************************
    *            Plugin Functions                       *
    ****************************************************/

    $.fn.socialscapes = function (options) {

        var globals = $.extend({}, $.dnn.socialscapes.defaults);
        options = $.extend(true, globals, options);

        this.each(function () {
            fetch_tweets(options, $(this));
        });

        return this;
    };


})(jQuery);
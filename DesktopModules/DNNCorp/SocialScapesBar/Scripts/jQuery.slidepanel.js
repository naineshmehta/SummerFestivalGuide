(function ($) {

    /****************************************************
    *            Private Functions                      *
    ****************************************************/

    var instances = [];
    var effects = {};

    function SlidePanel(tab, options) {

        // private variables
        var self = this,
			 $self = $(this),
			 slidepanel

        // get panel and trigger
        var sp = options.panel || tab.attr("rel");

        slidepanel = $('#' + sp);

        // sets up the tab click event
        // if the user is using the api then we turn off default click
        if (!options.api && tab && tab.index(slidepanel) == -1) {
            tab.click(function (e) {
                self.open(e);
                return e.preventDefault();
            });
        }

        // API methods  
        $.extend(self, {
            open: function (e) {
                //alert('Opened Panel');

                // find the effect
                var eff = effects[options.effect];
                if (!eff) { throw "Slidepanel: cannot find effect : \"" + options.effect + "\""; }

                // load effect  		 		
                eff.open.call(self, function () {
                    //if (opened) {
                    e.type = "onOpen";
                    $self.trigger(e);
                    //}
                });

            },

            close: function (e) {
                var eff = effects[options.effect];
                if (!eff) { throw "Slidepanel: cannot find effect : \"" + options.effect + "\""; }

                eff.close.call(self, function () {
                    e.type = "onClose";
                    $self.trigger(e);
                });
            },

            getSlidePanel: function (e) {
                return slidepanel;
            },

            getTab: function (e) {
                return tab;
            },

            getOptions: function (e) {
                return options;
            },

            bind: function (name, fn) {
                $self.bind(name, fn);
                return self;
            },

            unbind: function (name) {
                $self.unbind(name);
                return self;
            }

        });

        $.each("onBeforeOpen,onOpen,onBeforeClose, onClose".split(","), function (i, ev) {
            self[ev] = function (fn) {
                return self.bind(ev, fn);
            };
        });

        closeButton = slidepanel.find(options.close || '.spclose');

        if (!closeButton.Length) {
            slidepanel.prepend(
                $('<div class="spclose"></div>')
                    .click(function (e) {
                        self.close(e);
                    })
            );
        }

    };

    function log(sp, data) {
        if (sp.getOptions().debug && (window.console || console.firebug)) {
            console.debug(data);
        }
    }


    /****************************************************
    *            Public Functions                       *
    ****************************************************/

    // We put all our public methods and objects in a 
    // common namespace so we don't pollute the jQuery namespaces.
    $.dnn = $.dnn || {};

    $.dnn.slidepanel = {

        version: '1.0.0',

        addEffect: function (name, functions) {
            effects[name] = functions;
        },

        defaults: {
            panel: null,

            speed: 250,
            closeSpeed: 200,
            orientation: 'vertical',
            effect: 'slide',

            close: null,
            oneInstance: true,
            closeOnClick: true,
            api: false,
            debug: false

        }
    };

    // the default effect. nice and easy!
    $.dnn.slidepanel.addEffect('slide', {
        open:
        	function (onOpen) {
        	    var panel = this.getSlidePanel();

        	    var pSize = panel.data('size');

        	    if (!pSize) {
        	        pSize = {
        	            width: panel.outerWidth({ margin: true }),
        	            height: panel.outerHeight({ margin: true })
        	        }
        	        panel.data('size', pSize);
        	    }

        	    this.getTab().fadeOut(this.getOptions().closeSpeed);

        	    switch (this.getOptions().orientation.toLowerCase()) {
        	        case 'vertical':
        	            panel.css({ width: 0 });
        	            panel.animate({ width: pSize.width }, this.getOptions().speed, onOpen);
        	            break;
        	        case 'horizontal':
        	            panel.css({ height: 0 });
        	            panel.animate({ height: pSize.height }, this.getOptions().speed, onOpen);
        	            break;
        	        default:
        	            panel.fadeIn(this.getOptions().speed, onOpen);
        	    }
        	},
        close:
            function (onClose) {
                var panel = this.getSlidePanel();

                switch (this.getOptions().orientation.toLowerCase()) {
                    case 'vertical':
                        panel
                            .animate({ width: 0 }, this.getOptions().closeSpeed, function () { panel.hide(); onClose; });
                        break;
                    case 'horizontal':
                        panel
                            .animate({ height: 0 }, this.getOptions().closeSpeed, function () { panel.hide(); onClose; });
                        break;
                    default:
                        panel.fadeOut(this.getOptions().closeSpeed, onClose);
                }
                this.getTab().fadeIn(this.getOptions().speed);
            }
    });


    // jQuery plugin initialization
    $.fn.slidepanel = function (options) {

        var elem = this.eq(typeof options == 'number' ? options : 0).data("slidepanel");
        if (elem) { return elem; }

        var globals = $.extend({}, $.dnn.slidepanel.defaults);
        options = $.extend(true, globals, options);

        this.each(function () {
            elem = new SlidePanel($(this), options);
            instances.push(elem);
            $(this).data("slidepanel", elem);
        });

        return options.api ? elem : this;
    };


})(jQuery);
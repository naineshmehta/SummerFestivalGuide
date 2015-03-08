/**
 * @fileOverview The "codemirror" plugin. It's indented to enhance the
 *  "sourcearea" editing mode, which displays the xhtml source code with
 *  syntax highlight and line numbers.
 * @see http://marijn.haverbeke.nl/codemirror/ for CodeMirror editor which this
 *  plugin is using.
 */

CKEDITOR.plugins.add( 'codemirror',
{
	requires : [ 'sourcearea' ],
	/**
	 * This's a command-less plugin, auto loaded as soon as switch to 'source' mode  
	 * and 'textarea' plugin is activeated.
	 * @param {Object} editor
	 */
	init : function( editor )
	{
		function registerLoader()
		{
			editor.on( 'mode', function()
				{
					if ( editor.mode == 'source' )
					{
						var sourceAreaElement = editor.textarea,
							holderElement = sourceAreaElement.getParent();
							
						var holderHeight = holderElement.$.clientHeight + 'px';
						var holderWidth = holderElement.$.clientWidth + 'px';
						
						var codemirror =
						CodeMirror.fromTextArea(
							sourceAreaElement.$, {
								parserfile: 'parsexml.js',
								stylesheet: rootPath + 'css/xmlcolors.css',
								// Adapt to holder height.
								height: holderHeight,
								width: holderWidth,	
								path: rootPath + 'js/',
								passDelay: 300,
								passTime: 35,
								continuousScanning: 1000, /* Numbers lower than this suck megabytes of memory very quickly out of firefox */
								lineNumbers: true,
								textWrapping: false
						} );
						
						// Commit source data back into 'source' mode.
						editor.on( 'beforeCommandExec', function( ev ){
							// Listen to this event once.
							ev.removeListener();
							editor._.modes[ editor.mode ].loadData(
								codemirror.getCode() );
						} );
					}
				} );
		}
		
		var rootPath = this.path;

		// Load skin at first.
		CKEDITOR.skins.load( editor, 'codemirror' );

		// Load bootstraping codes.
		CKEDITOR.scriptLoader.load( rootPath + '/js/codemirror.js' ,
			function( success ){
				if ( success )
					registerLoader();
			} );
	}
});

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
			var delay;
			
			editor.on( 'mode', function()
				{
					if ( editor.mode == 'source' )
					{
						var sourceAreaElement = editor.textarea,
							holderElement = sourceAreaElement.getParent();
							
						var holderHeight = holderElement.$.clientHeight + 'px';
						var holderWidth = holderElement.$.clientWidth + 'px';
						 // Initialize CodeMirror editor with a nice html5 canvas demo.
						 
						 
      var codemirror = CodeMirror.fromTextArea(sourceAreaElement.$, {
		  mode: 'text/html',
		  tabMode: 'indent',
		  height: holderHeight,
		  parserfile: 'parsexml.js',
		  stylesheet: rootPath + 'css/xmlcolors.css',
		  width: holderWidth,	
		  passDelay: 300,
		  passTime: 35,
		  continuousScanning: 1000,
		  lineNumbers: true,
		  textWrapping: true,
		  path: rootPath + 'js/',
		  onChange: function() {
			  clearTimeout(delay);
			  delay = setTimeout(updateEditor, 300);
			  }
	 });
	  
	  function updateEditor() {
       editor._.modes[ editor.mode ].loadData(
								//codemirror.getCode() 
								codemirror.getCode()
								);
      }
      setTimeout(updateEditor, 300);
	  
	  // Commit source data back into 'source' mode.
						editor.on( 'beforeCommandExec', function( ev ){
							// Listen to this event once.
							ev.removeListener();
							editor._.modes[ editor.mode ].loadData(
								//codemirror.getCode() 
								codemirror.getCode()
								);
						} );
					}
				} );
		}
		
		var rootPath = this.path;

		//CKEDITOR.document.appendStyleSheet( rootPath + '/lib/codemirror.css' );
		
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

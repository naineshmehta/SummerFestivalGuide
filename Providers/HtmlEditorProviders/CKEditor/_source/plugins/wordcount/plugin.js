CKEDITOR.plugins.add( 'wordcount',
{
   init : function( editor )
   {
      var defaultLimit = 'unlimited';
      var defaultFormat = 'Word Count: <span class="cke_wordcount_count" style="font-style: italic;color:black">%count%</span>';
      var limit = defaultLimit;
      var format = defaultFormat;

      var intervalId;
      var lastCount = 0;
      var limitReachedNotified = false;
      var limitRestoredNotified = false;
      
      
      if ( true )
      {   
         function counterId( editor )
         {
            return 'cke_wordcount_' + editor.name;
         }
         
         function counterElement( editor )
         {
            return document.getElementById( counterId(editor) );
         }
		 
		 function strip(html)
   {
      var tmp = document.createElement("DIV");
      tmp.innerHTML = html;
      return tmp.textContent||tmp.innerText;
   } 
         
         function updateCounter( editor )
         {
            var count = strip(editor.getData()).trim().split(/\s+/).length;//editor.getData().length;return strip(editor.getData()).trim().split(/\s+/).length;
            if( count == lastCount ){
               return true;
            } else {
               lastCount = count;
            }
            if( !limitReachedNotified && count > limit ){
               limitReached( editor );
            } else if( !limitRestoredNotified && count < limit ){
               limitRestored( editor );
            }
            
            var html = format.replace('%count%', count);
            counterElement(editor).innerHTML = html;
         }
         
         function limitReached( editor )
         {
            limitReachedNotified = true;
            limitRestoredNotified = false;
            editor.setUiColor( '#FFC4C4' );
         }
         
         function limitRestored( editor )
         {
            limitRestoredNotified = true;
            limitReachedNotified = false;
            editor.setUiColor( '#C4C4C4' );
         }

         editor.on( 'themeSpace', function( event )
         {
            if ( event.data.space == 'bottom' )
            {
               event.data.html += '<div id="'+counterId(event.editor)+'" class="cke_wordcount" style="display:block;float:right;margin-top:5px;margin-right:3px;color:black;"' +
                  ' title="' + CKEDITOR.tools.htmlEncode( 'Words Counter' ) + '"' +
                  '>&nbsp;</div>';
            }
         }, editor, null, 100 );
         
         editor.on( 'instanceReady', function( event )
         {
            if( editor.config.wordcount_limit != undefined )
            {
               limit = editor.config.wordcount_limit;
            }
            
            if( editor.config.wordcount_format != undefined )
            {
               format = editor.config.wordcount_format;
            }
            
            
         }, editor, null, 100 );
         
         editor.on( 'dataReady', function( event )
         {
            var count = event.editor.getData().length;
            if( count > limit ){
               limitReached( editor );
            }
            updateCounter(event.editor);
         }, editor, null, 100 );
         
         editor.on( 'key', function( event )
         {
            //updateCounter(event.editor);
         }, editor, null, 100 );
         
         editor.on( 'focus', function( event )
         {
            editorHasFocus = true;
            intervalId = window.setInterval(function (editor) {
                 updateCounter(editor)
            }, 1000, event.editor);
         }, editor, null, 100 );
         
         editor.on( 'blur', function( event )
         {
            editorHasFocus = false;
            if( intervalId )
               clearInterval(intervalId);
         }, editor, null, 100 );
      }
   }
});
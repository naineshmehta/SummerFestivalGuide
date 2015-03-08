/*********************************************************************************************************/
/**
 * Ventrian News Articles Article Link Selector plugin for CKEditor 3.x by Ingo Herbote
 * Released: On 2012-02-25
 */
/*********************************************************************************************************/

( function() {
    CKEDITOR.plugins.add( 'newsarticleslinks',
    {
        requires: [ 'iframedialog' ],
        init: function( editor )
        {
           var me = this;
           CKEDITOR.dialog.add( 'newsarticleslinksDialog', function (editor)
           {
              return {
                 title : 'News Articles Link Selector Dialog',
                 minWidth : 550,
                 minHeight : 160,
                 contents :
                       [
                          {
                             id : 'iframe',
                             label : 'Article Links',
                             expand : true,
                             elements :
                                   [
                                      {
						               type : 'html',
						               id : 'pagenewsarticleslinks',
						               label : 'Article Links',
						               style : 'width : 100%;',
						               html : '<iframe src="'+me.path+'/dialogs/newsarticleslinks.aspx" frameborder="0" name="iframenewsarticleslinks" id="iframenewsarticleslinks" allowtransparency="1" style="width:100%;margin:0;padding:0;"></iframe>'
						              }
                                   ]
                          }
                       ],
                 onOk : function()
                 {
					for (var i=0; i<window.frames.length; i++) {
					   if(window.frames[i].name == 'iframenewsarticleslinks') {
						   
					      
						  var index = window.frames[i].document.getElementById("ArticlesList").selectedIndex;

                          var linkUrl = window.frames[i].document.getElementById("ArticlesList").value;
						  var linkText = window.frames[i].document.getElementById("ArticlesList").options[index].text;
					   }
					}
                    editor.insertHtml('<a href="' + linkUrl + '" title="' + linkText + '">' + linkText + '</a>');
                 }
              };
           } );

            editor.addCommand( 'newsarticleslinks', new CKEDITOR.dialogCommand( 'newsarticleslinksDialog' ) );

            editor.ui.addButton( 'newsarticleslinks',
            {
                label: 'News Article Links',
                command: 'newsarticleslinks',
                icon: this.path + 'icon.gif'
            } );
        }
    } );
} )();

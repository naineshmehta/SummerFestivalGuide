/*
 *
 * Copyright (c) 2006-2011 Sam Collett (http://www.texotela.co.uk)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 * 
 * Version 1.3.1
 * Demo: http://www.texotela.co.uk/code/jquery/numeric/
 *
 */
(function($){$.fn.numeric=function(a,b){if(typeof a==='boolean'){a={decimal:a}}a=a||{};if(typeof a.negative=="undefined"){a.negative=true}var c=(a.decimal===false)?"":a.decimal||".";var d=(a.negative===true)?true:false;b=(typeof(b)=="function"?b:function(){});return this.data("numeric.decimal",c).data("numeric.negative",d).data("numeric.callback",b).keypress($.fn.numeric.keypress).keyup($.fn.numeric.keyup).blur($.fn.numeric.blur)};$.fn.numeric.keypress=function(e){var a=$.data(this,"numeric.decimal");var b=$.data(this,"numeric.negative");var c=e.charCode?e.charCode:e.keyCode?e.keyCode:0;if(c==13&&this.nodeName.toLowerCase()=="input"){return true}else if(c==13){return false}var d=false;if((e.ctrlKey&&c==97)||(e.ctrlKey&&c==65)){return true}if((e.ctrlKey&&c==120)||(e.ctrlKey&&c==88)){return true}if((e.ctrlKey&&c==99)||(e.ctrlKey&&c==67)){return true}if((e.ctrlKey&&c==122)||(e.ctrlKey&&c==90)){return true}if((e.ctrlKey&&c==118)||(e.ctrlKey&&c==86)||(e.shiftKey&&c==45)){return true}if(c<48||c>57){var f=$(this).val();if(f.indexOf("-")!==0&&b&&c==45&&(f.length===0||parseInt($.fn.getSelectionStart(this),10)===0)){return true}if(a&&c==a.charCodeAt(0)&&f.indexOf(a)!=-1){d=false}if(c!=8&&c!=9&&c!=13&&c!=35&&c!=36&&c!=37&&c!=39&&c!=46){d=false}else{if(typeof e.charCode!="undefined"){if(e.keyCode==e.which&&e.which!==0){d=true;if(e.which==46){d=false}}else if(e.keyCode!==0&&e.charCode===0&&e.which===0){d=true}}}if(a&&c==a.charCodeAt(0)){if(f.indexOf(a)==-1){d=true}else{d=false}}}else{d=true}return d};$.fn.numeric.keyup=function(e){var a=$(this).val();if(a&&a.length>0){var b=$.fn.getSelectionStart(this);var c=$.data(this,"numeric.decimal");var d=$.data(this,"numeric.negative");if(c!==""&&c!==null){var f=a.indexOf(c);if(f===0){this.value="0"+a}if(f==1&&a.charAt(0)=="-"){this.value="-0"+a.substring(1)}a=this.value}var g=[0,1,2,3,4,5,6,7,8,9,'-',c];var h=a.length;for(var i=h-1;i>=0;i--){var l=a.charAt(i);if(i!==0&&l=="-"){a=a.substring(0,i)+a.substring(i+1)}else if(i===0&&!d&&l=="-"){a=a.substring(1)}var m=false;for(var j=0;j<g.length;j++){if(l==g[j]){m=true;break}}if(!m||l==" "){a=a.substring(0,i)+a.substring(i+1)}}var n=a.indexOf(c);if(n>0){for(var k=h-1;k>n;k--){var o=a.charAt(k);if(o==c){a=a.substring(0,k)+a.substring(k+1)}}}this.value=a;$.fn.setSelection(this,b)}};$.fn.numeric.blur=function(){var a=$.data(this,"numeric.decimal");var b=$.data(this,"numeric.callback");var c=this.value;if(c!==""){var d=new RegExp("^\\d+$|^\\d*"+a+"\\d+$");if(!d.exec(c)){b.apply(this)}}};$.fn.removeNumeric=function(){return this.data("numeric.decimal",null).data("numeric.negative",null).data("numeric.callback",null).unbind("keypress",$.fn.numeric.keypress).unbind("blur",$.fn.numeric.blur)};$.fn.getSelectionStart=function(o){if(o.createTextRange){var r=document.selection.createRange().duplicate();r.moveEnd('character',o.value.length);if(r.text===''){return o.value.length}return o.value.lastIndexOf(r.text)}else{return o.selectionStart}};$.fn.setSelection=function(o,p){if(typeof p=="number"){p=[p,p]}if(p&&p.constructor==Array&&p.length==2){if(o.createTextRange){var r=o.createTextRange();r.collapse(true);r.moveStart('character',p[0]);r.moveEnd('character',p[1]);r.select()}else if(o.setSelectionRange){o.focus();o.setSelectionRange(p[0],p[1])}}}})(jQuery);
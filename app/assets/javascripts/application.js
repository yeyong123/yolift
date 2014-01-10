// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require jquery_nested_form
//= require ckeditor/ckeditor
//收藏页面
//
function addfavorite() 
{ 
if (document.all) 
{ 
window.external.addFavorite('http://www.yolift.com','力形科技'); 
} 
else if (window.sidebar) 
{ 
window.sidebar.addPanel('力形科技', 'www.yolift.com', ""); 
} 
}


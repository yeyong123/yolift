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
//= require js/customer
//= require zoom/zoom.min
//= require zoom/imagezoom
//= require js/bootstrap.min
//= require js/jquery.validate.min
//= require mobile/jquery.flexslider-min
//收藏页面
//
function addfavorite(title,url) {
	try{ 
		window.external.addFavorite(url,title); 
	} 
	catch(e){
		try{ 
			window.sidebar.addPanel(title, url, ""); 
		} 
		catch(e){
			alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}


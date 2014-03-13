$(document).ready(function(){

	//产品展示页面中的询价的下拉菜单
	//
	$('.drop-list').click(function(){
			$('.drop-list-toggle').toggle();
		});
//产品页面下拉选择货号
//放大镜
//
$('#idHandle3').mouseout(function(){
	$('#idHandle3').hide();
	
});

	//左侧导航
	//

	function subindexMenu(){
		$(".submenulist").find("li").hover(function(){
			$(this).css("z-index","9999");
			$(this).find("h3 a").addClass("on");
			$(this).find("h3 span").hide();
			$(this).find(".listbox").show();
		},function(){
			$(this).removeAttr("style");
			$(this).find("h3 a").removeClass("on");
			$(this).find("h3 span").show();
			$(this).find(".listbox").hide();
		});
	}
	$(function(){
		subindexMenu();
	});

// 购物车的下拉鼠标经过下拉菜单
//
$('.cart-img,.cart_items-drop, .cart_items-drop2').mouseover(function(){
	$('.cart_items-drop, .cart_items-drop2').show();
});	
$('.cart_items-drop, .cart_items-drop2').mouseout(function(){
	$('.cart_items-drop, .cart_items-drop2').hide();
});

//
//
//$('.dropdown-toggle, .dropdown-menu').hover(
//		function(){ $('.dropdown').addClass("open");},
//		function(){ $('.dropdown').removeClass("open");}
//		);

//

//选择下拉菜单切换

$.fn.linkSelect = function (num){
	if (!num) num = 1;
	var all_select = document.getElementsByTagName('select');
	this.each(function(i){
		new linkSelect(this, all_select, num);
	});
	all_select = null;

	function linkSelect(obj, all_select, num){
		var obj1_index = 0;
		for (i =0; i < all_select.length; i++){
			if (all_select[i] == obj){
				obj1_index = i;
			}
		}
		obj1_index = (obj1_index - num) > -1 ? obj1_index - num : 0;
		this.obj1 = $(all_select[obj1_index]);
		this.obj2 = $(obj);
		var obj3 = $('<select disabled="disabled">' + this.obj2.html() + '</select>');
		this.elems = obj3[0].getElementsByTagName('optgroup');
		this.obj2.html(this.obj2.get(0).options[this.obj2.get(0).selectedIndex].parentNode.innerHTML);  
		var self = this;
		this.obj1.change(function(){
			self.obj2.html('');
			for (var i = 0; i < self.elems.length; i++){
				if (self.elems[i].label == this.value){
					self.obj2.html(self.elems[i].innerHTML);
					self.obj2.change();
				}
			}
		});  
	}
}

//调用选择下拉菜单

 $('#tag_tag_id').linkSelect();
 $('#product_tag_id').linkSelect();

 //orders 地址的下拉城市选择
 //
 $('#order_city_id').linkSelect();
 $('#order_district_id').linkSelect();

 //申请产品目录页面选择城市
  $('#catelog_city_id').linkSelect();
 $('#catelog_district_id').linkSelect();



 $('.carousel').carousel({
 		interval: 5000
 });
 // 首页展示图的js选择active
 //
 $('.carousel-indicators li:first').addClass('active');
 $('.carousel-inner .item:first').addClass('active');

 //首页产品展示切换用的
 //
 //$('.nav-tabs .tab-tag + li').addClass('active');
 $('.tab-content div:first-child').addClass('active');
 
//IE的占位符
  
 $(function(){
	 if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
		 $('[placeholder]').focus(function() {
			 var input = $(this);
			 if (input.val() == input.attr('placeholder')) {
				 input.val('');
				 input.removeClass('placeholder');
			 }
		 }).blur(function() {
			 var input = $(this);
			 if (input.val() == '' || input.val() == input.attr('placeholder')) {
				 input.addClass('placeholder');
				 input.val(input.attr('placeholder'));
			 }
		 }).blur();
	 };
 })
function placeholderSupport() {
	return 'placeholder' in document.createElement('input');
}

//选择产品货号验证
//
$('.drop-list-toggle .error').hide();
$('.drop-list-toggle .btn').click(
		function(event){
			var count = $('input:checked').length;
			if (count == 0)
			{
				$('.drop-list-toggle .error').show();
				event.preventDefault();
			}

			else
			{
				$('.drop-list-toggle .error').hide();
			}
	});
//$('.cart-img').click(
//function(event){
//	var count = $('.cart-items-drop').length;
//		if (count == 0)
//		{
//			event.preventDefault();
//}
//});

//为了IE去除最后一个link的边框
//
$('.lange a:last').addClass("lastitem");


//搜索框不能为空
$('#search-get').click(function(event){
	var count = $('.serach-query');
	if (count.val() == "")
{
	event.preventDefault();
	}
});

//验证购物车输入的产品数量
//

$('.edit_line_item').validate({
	rules: {
		"line_item[quantity]": {
			required: true,
	number: true,
	max: 10,
	min: 1
		}
	},
	messages: {
		"line_item[quantity]": {
			required: "不能为空的",
	max: "最大数量10台!",
	min: "最小数量1台!",
	number: "不是无效数字"
		}
	}
});

$('.edit_product').validate({
	rules: {
		"product[paixu]": {
			number: true,
	min: 0,
	max: 2999
		}
	},
	messages: {
		"product[paixu]": {
			number: "不是数字",
	max: "超过了2999",
	min: "不能是负数"
		}
	}
});
//调用产品控制台产品推荐的时候Ajax请求中按钮加入css
$('.tuijian1').hover(
		function(){$(this).find('.tuijian').addClass('tuijian22');
},
		function(){$(this).find('.tuijian22').removeClass('tuijian22');});
//订单页面中更新数据
//
$('.getnumber').hover(
		function(){
			$(this).addClass('getnumber2');
		},function(){
			$(this).removeClass('getnumber2');
		}
		);
//过滤表单数据
$('#table').filterTable();

//产品展示页面的固定定位
//
//回到顶部的代码
//
function goTop()
{
	$(window).scroll(function(e) {
		//若滚动条离顶部大于100元素
		if($(window).scrollTop()>300)
		$("#gotop").fadeIn(1000);//以1秒的间隔渐显id=gotop的元素
		else
		$("#gotop").fadeOut(1000);//以1秒的间隔渐隐id=gotop的元素
	});
};
$(function(){
	//点击回到顶部的元素
	$("#gotop").click(function(e) {
		//以1秒的间隔返回顶部
		$('body,html').animate({scrollTop:0},1000);
	});
	$("#gotop").mouseover(function(e) {
		$(this).css("background","url(/assets/top.png) no-repeat 0px 0px");
	});
	$("#gotop").mouseout(function(e) {
		$(this).css("background","url(/assets/top.png) no-repeat -70px 0px");
	});
	goTop();//实现回到顶部元素的渐显与渐隐
});

});

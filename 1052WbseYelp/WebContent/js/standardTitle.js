var login=0;	//1 已登入 0尚未登入

$(document).ready(function() {
	/*前置*/
	$.getScript("js/modalGenerator.js");	//取得modalGenerator.js
	$("body").append(
			"	<a id='modal-1' href='#modal-container-1' role='button' class='btn' data-toggle='modal' >"+
			"	</a>");
	/*登入登出*/
	$("#login").click(function(e) {
		$.getScript("js/login.js");	//取得login.js
	});
	
	/*收藏列表*/
	$("#collect").click(function(e) {
		$.getScript("js/collect.js");	//取得collect.js
	});
	
	/*註冊列表*/
	$("#register").click(function(e) {
		$.getScript("js/register.js");	//取得register.js
	});
});
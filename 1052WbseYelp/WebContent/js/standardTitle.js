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
	
	/*註冊列表*/
	$("#register").click(function(e) {
		$.getScript("js/register.js");	//取得register.js
	});
	
	/*判斷是否登入 顯示該頁面為登入或登出狀態*/
	$.getScript("js/judgeLogin.js");	//取得judgeLogin.js
});
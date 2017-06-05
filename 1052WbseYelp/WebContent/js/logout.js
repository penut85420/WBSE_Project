$("body").append(
		"	<a id='modal-1' href='#modal-container-1' role='button' class='btn' data-toggle='modal' >"+
		"	</a>");
$(document).ready(function() {
	modalGenerator("登出結果", "成功");

	// 登出
	$.ajax({
		url : "LogoutServlet",
		data : {},
		dataType : "json",

		success : function(response) {
			if (response == true) {
				console.log("登出成功");
				setTimeout(function(){
					$("#modal-container-1 .close").click();		//關閉modal
				},1500);
			}
		},
		error : function() {
			console.log("錯誤訊息");
		}
	});
});

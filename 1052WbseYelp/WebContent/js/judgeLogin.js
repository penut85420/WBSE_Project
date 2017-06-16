$(document).ready(function() {
		$.ajax({
			url : "LoginVerificationServlet",
			//url : "http://140.121.197.130:8000/BBDPDoctor/LoginVerificationServlet",
			data : {
				state : "judgeLogin"
			},
			dataType : "json",

			success : function(response) {	
				if(response){
					$("#login").html("<span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;登出");
					console.log("已登入狀態");
				}
				else{
					$("#login").html("<span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;登入");
					console.log("已登出狀態");
				}
			},
			error : function() {
				console.log("錯誤訊息");
			}
		});
	});
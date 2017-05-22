$(document).ready(function() {
		$.ajax({
			url : "LoginVerificationServlet",
			//url : "http://140.121.197.130:8000/BBDPDoctor/LoginVerificationServlet",
			data : {
				state : "judgeLogin"
			},
			dataType : "json",

			success : function(response) {	
				if(response)
					alert("已登入judgeLogin.js : " + response);
				else
					alert("尚未登入judgeLogin.js : " + response);
			},
			error : function() {
				console.log("錯誤訊息");
			}
		});
	});


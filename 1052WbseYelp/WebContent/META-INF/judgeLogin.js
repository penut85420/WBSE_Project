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
					alert("�w�n�JjudgeLogin.js : " + response);
				else
					alert("�|���n�JjudgeLogin.js : " + response);
			},
			error : function() {
				console.log("���~�T��");
			}
		});
	});
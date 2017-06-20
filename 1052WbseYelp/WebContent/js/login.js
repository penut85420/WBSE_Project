$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "LoginVerificationServlet",
			//url : "http://140.121.197.130:8000/BBDPDoctor/LoginVerificationServlet",
			data : {
				state : "judgeLogin"
			},
			dataType : "json",

			success : function(response) {	
				/*已登入狀態 要登出*/
				if(response){
					console.log("要登出");
					$.getScript("js/logout.js");
					$("#login").html("<span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;登入");
				}
				/*已登出狀態 要登入*/
				else{
					console.log("要登入");
					
					/*登入modal*/
					modalGenerator("登入", 
							"		<div class='row'>"+
							"				<div class='form-group'>"+
							"					<div class='col-sm-offset-4 col-sm-4'>"+
							"						<input type='text' class='form-control' id='account' placeholder='帳號' autofocus /><br>"+
							"					</div>"+
							"				</div>"+
							"				<div class='form-group'>"+
							"					<div class='col-sm-offset-4 col-sm-4'>"+
							"							<input type='password' class='form-control' id='password' placeholder='密碼' /><br>"+
							"					</div>"+
							"				</div>"+
			
							"		</div>"+
							"		<div class='row' style='text-align:center;'>"+
							"			<div class='col-sm-5'></div>"+
							"			<div class='col-sm-2'>"+
							"				<button type='submit' class='btn btn-default' id='loginId' >登入</button>"+
							"			</div>"+
							"			<div class='col-sm-5'></div>"+
							"		</div>"+
			
							"		<div class='row' style='margin-top: 3vh;'>"+
							"			<div id='loginFail'></div>"+
							"		</div>");
					
					/*登入*/
					$("#loginId").click(function(e) {
						e.preventDefault();
						console.log("account : " + $("#account").val());
						console.log("password : " + $("#password").val());
						$.ajax({
							type : "POST",
							url : "LoginVerificationServlet",
							data : {
								state : "login",
								account : $("#account").val(),
								password : $("#password").val()
							},
							dataType : "json",
			
							success : function(response) {		
								if (response.result == "登入成功") {
									$("#modal-container-1 .close").click();		//關閉modal
									$("#login").html("<span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;登出");
									$.ajax({
										url : "collect.do",
										method : "post",
										data : {
										},
										dataType : "json",

										success : function(response) {	
											$.ajax({
												url : "show.do",
												method : "post",
												data : {
												},
												dataType : "json",
								
												success : function(response) {		
													if (response == "success") {
														document.cookie = "1";
														location.reload();
													}
												},
												error : function() {
													console.log("錯誤訊息");
												}
											});
										},
										error : function() {
											console.log("錯誤訊息");
										}
									});
								}
								else {
									$("#loginFail").empty();
									$("#loginFail").append(response.result);
									console.log(response.result);
								}
							},
							error : function() {
								console.log("錯誤訊息");
							}
						});
					});
				}
			},
			error : function() {
				console.log("錯誤訊息");
			}
		});
	});

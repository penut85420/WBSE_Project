
		/*要登入*/
		if(login == 0){
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
							login = 1;	//狀態改成已登入
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
		/*已登入要登出*/
		else if(login == 1){
			$.getScript("js/logout.js");
			$("#login").html("<span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;登入");
			login = 0;	//狀態改成為登入
		}
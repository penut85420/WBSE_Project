modalGenerator("註冊",
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-1'></div>"+
		"			<div class='col-md-3' style='padding-right: 0;text-align:center;'>"+
		"				<h4 style='color: #666666; margin-top: 1.5vh;'><b>帳號</b></h4>"+
		"			</div>"+
		"			<div class='col-md-6'>"+
		"				<div class='input-group' style='margin-bottom: 1vh;'>"+
		"					<span class='input-group-addon'><i class='glyphicon glyphicon-asterisk'></i></span>"+
		"					<input type='text' class='form-control' id='account' placeholder='請輸入帳號(介於6~15字元間)'>"+
		"				</div>"+
		"			</div>"+
		"		</div>"+
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-1'></div>"+
		"			<div class='col-md-3' style='padding-right: 0;text-align:center;'>"+
		"				<h4 style='color: #666666; margin-top: 1.5vh;'><b>姓名</b></h4>"+
		"			</div>"+
		"			<div class='col-md-6'>"+
		"				<div class='input-group' style='margin-bottom: 1vh;'>"+
		"					<span class='input-group-addon'><i class='glyphicon glyphicon-user'></i></span>"+
		"					<input type='text' class='form-control' placeholder='請輸入姓名' id='name' />"+
		"				</div>"+
		"			</div>"+
		"		</div>"+
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-1'></div>"+
		"			<div class='col-md-3' style='padding-right: 0;text-align:center;'>"+
		"				<h4 style='color: #666666; margin-top: 1.5vh;'><b>密碼</b></h4>"+
		"			</div>"+
		"			<div class='col-md-6'>"+
		"				<div class='input-group' style='margin-bottom: 1vh;'>"+
		"					<span class='input-group-addon'><i class='glyphicon glyphicon-question-sign'></i></span>"+
		"					<input type='password' class='form-control' placeholder='請輸入密碼 (介於6~15字元間)' id='password' />"+
		"				</div>"+
		"			</div>"+
		"		</div>"+
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-1'></div>"+
		"			<div class='col-md-3' style='padding-right: 0;text-align:center;'>"+
		"				<h4 style='color: #666666; margin-top: 1.5vh;'><b>確認密碼</b></h4>"+
		"			</div>"+
		"			<div class='col-md-6'>"+
		"				<div class='input-group' style='margin-bottom: 1vh;'>"+
		"					<span class='input-group-addon'><i class='glyphicon glyphicon-ok-sign'></i></span>"+
		"					<input type='password' class='form-control' placeholder='再一次輸入密碼' id='passwordCheck' />"+
		"				</div>"+
		"			</div>"+
		"		</div>"+
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-1'></div>"+
		"			<div class='col-md-3' style='padding-right: 0;text-align:center;'>"+
		"				<h4 style='color: #666666; margin-top: 1.5vh;'><b>生日</b></h4>"+
		"			</div>"+
		"			<div class='col-md-6'>"+
		"				<div class='input-group' style='margin-bottom: 1vh;'>"+
		"					<span class='input-group-addon'><i class='glyphicon glyphicon-calendar'></i></span>"+
		"					<input type='date' class='form-control' placeholder='請輸入生日 例:2017/01/01' id='birthday' />"+
		"				</div>"+
		"			</div>"+
		"		</div>"+
		"		<div class='row' style='margin-top: 3vh;'>"+
		"			<div class='col-md-3'>" +
		"			</div>" +
		"			<div class='col-md-5' id='registerFail' style='color:red;text-align:right;'>" +
		"			</div>"+
		"			<div class='col-md-2' style='text-align:right;'>"+
		"				<button type='submit' class='btn btn-default' id='doAjaxBtn'>送出</button>	"+
		"			</div>"+
		"		</div>"); 



$(document).ready(function() {
	$("#doAjaxBtn").click(function() {
		$.ajax({
			url : "RegisterServlet",
			//url : "http://140.121.197.130:8000/BBDPPatient/RegisterServlet",
			data : {
				account : $("#account").val(),
				password : $("#password").val(),
				passwordCheck : $("#passwordCheck").val(),
				name : $("#name").val(),
				birthday : $("#birthday").val(),
				agree : $('input[name="agree"]').prop("checked")
			},
			dataType : "json",

			success : function(response) {
				console.log(response);				
				$("#registerFail").html(response);
								
				if(response == "成功"){
					setTimeout(function(){ 
						$('#modal-container-1').modal('hide');
					}, 1500);
				}
			},
			error : function() {
				console.log("錯誤訊息");
			}
		});
	});
});
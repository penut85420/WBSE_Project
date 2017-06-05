<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 按鈕css -->	
<link href="css/button.css" rel="stylesheet" type="text/css">

<!-- standardTitle js-->
<script src="js/standardTitle.js"></script>

<!-- modalGenerator js 
<script src="js/modalGenerator.js"></script>
-->

<style>
* {
  font-family: 微軟正黑體;
}
body{
	background-color: #2D9AB7;
}
#loginFail {
	color: red;
	text-align:center;
}
#loginclick{
	width:20%;
	height:400px;
	position: absolute;
	right: 0px;
	top: 100px;
}
</style>
</head>
<body>
	<div class="col-md-12" style="background-color:#2D9AB7;">
		<!-- 最上面的那一列 -->
		<div class="row" style="color:#FFFFFF;">
			<div class="col-md-4" style="float:left;"><a href="" style="text-decoration:none;color:#FFFFFF;"><h4>FOODSEARCH</h4></a></div>
			<div class="col-md-6"></div>
			<div class="col-md-1" id="login" style="float:right;text-align:center;color:#FFFFFF;"><h4>LOGIN</h4></div>	
			<div class="col-md-1" style="float:right;text-align:center;"><a href="" style="text-decoration:none;color:#FFFFFF;"><h4>REGISTER</h4></a></div>		
		</div>
		<!-- 白色列 -->
		<div class="row" style="height:5vh;background-color:#FFFFFF;">
		</div>
		<!-- 撰寫區 -->
		<div class="row" style="">
			<div class="col-md-12">
			<!-- 撰寫區 -->
			<!-- ======================================================================================================================================================= -->
			<!--  
			<div id="loginclick">
				<input type="text" id="account"/>
				<input type="text" id="password"/>
				<input type="button" id="login" value="login"/>
			</div>
			-->
			
			<!-- ======================================================================================================================================================= -->
			</div>
		</div>
		<!-- 底部 -->
		<nav class="navbar-default navbar-fixed-bottom" role="navigation" style="width:100vw;background-color:#717070;text-align:center;">
			<div style="margin-top:1vh;margin-bottom:1vh;">&copy;2017 - <strong>FoodSearch</strong></div>
		</nav>
	</div>
	
</body>
</html>
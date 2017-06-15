<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Yelp Bla Bla Bla</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 按鈕css -->	
<link href="css/button.css" rel="stylesheet" type="text/css">

<!-- standardTitle css -->	
<link href="css/standardTitle.css" rel="stylesheet" type="text/css">

<!-- standardTitle js-->
<script src="js/standardTitle.js"></script>

<!-- modalGenerator js 
<script src="js/modalGenerator.js"></script>
-->

</head>
<body>	
	<div class="col-md-12">
		
		<!-- 最上面的那一列 -->
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0;margin-top:0;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
				</button> <a class="navbar-brand" href="#">FOODSEARCH</a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a id="modal-1" href="#modal-container-collect" role="button" class="btn" data-toggle="modal" id="collect">
							<span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;收藏
						</a>
					</li>
					<li>
						<a href="#" id="login"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;登入</a>
					</li>
					<li>
						<a href="#" id="register"><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;註冊</a>
					</li>
				</ul>
			</div>
		</nav>
			
		<!-- 白色列 -->
		<div class="row" style="height:5vh;background-color:#FFFFFF;margin-top:0;">
		</div>
		 
		<!--<div class="col-md-12">-->
			<!-- 撰寫區 -->
			<!-- ======================================================================================================================================================= -->
		
			<!-- ======================================================================================================================================================= -->
			<!-- 撰寫區 -->
		<!--</div>-->	
		
		<!-- 底部 -->
		<nav class="navbar-default navbar-fixed-bottom" role="navigation" style="width:100vw;background-color:#717070;text-align:center;">
			<div style="margin-top:1vh;margin-bottom:1vh;color:#FFFFFF;">&copy;2017 - <strong>FoodSearch</strong></div>
		</nav>

	</div>
	
	<!-- modal start -->
	<div class="modal fade" id="modal-container-collect" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="close()">×</button>
					<h4 class="modal-title" id="alertTitle">
					<!-------------------------------------- title start -------------------------------------->
						已收藏列表
					<!-------------------------------------- title end -------------------------------------->
					</h4>
				</div>
				<div class="modal-body">
					<div id="alertbody">
						<!-------------------------------------- body start -------------------------------------->
						<div class="row">
							<div class="col-md-1">
										<div class="pull-left" id="heart" style="color:red;cursor:pointer;">
											<h1>❤</h1>
										</div>
							</div>
					    	<div class="col-md-11">
									<a href="detailCollectUI.jsp" class="list-group-item">
										<div class="pull-left">
											<img class="img-thumbnail" src="picture/logo.png" style="float:left;height:70px;width:70px;">
										</div>
										<div class="pull-left" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">Name : 星巴克-信義區-4</h4>
											<p class="list-group-item-text">Distance : 4400KM</p>
											<p class="list-group-item-text">Rating : ★★★★☆</p>
											<p class="list-group-item-text">PhoneNumber : 02 25578493</p>
										</div>
										<div class="pull-right" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">信義</h4>
											<p class="list-group-item-text">11 Bao"an Street</p>
											<p class="list-group-item-text">保安街11號</p>
											<p class="list-group-item-text">Datong District, 台北市 103</p>
											<p class="list-group-item-text">Taiwan</p>
										</div>
										<div class="clearfix"></div>
									</a>
		       				</div>
		       				<div class="col-md-1">
										<div class="pull-left" id="heart" style="color:red;cursor:pointer;">
											<h1>❤</h1>
										</div>
							</div>
					    	<div class="col-md-11">
									<a href="detailCollectUI.jsp" class="list-group-item">
										<div class="pull-left">
											<img class="img-thumbnail" src="picture/logo.png" style="float:left;height:70px;width:70px;">
										</div>
										<div class="pull-left" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">Name : 星巴克-信義區-4</h4>
											<p class="list-group-item-text">Distance : 4400KM</p>
											<p class="list-group-item-text">Rating : ★★★★☆</p>
											<p class="list-group-item-text">PhoneNumber : 02 25578493</p>
										</div>
										<div class="pull-right" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">信義</h4>
											<p class="list-group-item-text">11 Bao"an Street</p>
											<p class="list-group-item-text">保安街11號</p>
											<p class="list-group-item-text">Datong District, 台北市 103</p>
											<p class="list-group-item-text">Taiwan</p>
										</div>
										<div class="clearfix"></div>
									</a>
		       				</div>
					    </div>
					<!-------------------------------------- body end -------------------------------------->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="close()">關閉</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->
	
</body>
</html>
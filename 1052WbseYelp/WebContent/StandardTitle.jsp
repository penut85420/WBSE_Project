<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Yelp Bla Bla</title>
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
<script>
	var arr=[];
	for(var i=0;i<50;i++){
		arr[i]=1;
	}
</script>
</head>
<body>	
	<div class="col-md-12">
		
		<!-- 最上面的那一列 -->
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom:0;margin-top:0;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
				</button> <a class="navbar-brand" href="HomepageUI.jsp">Yelp Bla Bla</a>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a id="modal-collect" href="#modal-container-collect" role="button" class="btn" data-toggle="modal" id="collect">
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
	<div class="modal fade" id="modal-container-collect" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="close()">×</button>
					<h4 class="modal-title" >
					<!-------------------------------------- title start -------------------------------------->
						已收藏列表
					<!-------------------------------------- title end -------------------------------------->
					</h4>
				</div>
				<div class="modal-body">
					<div>
						<!-------------------------------------- body start -------------------------------------->
						<div class="row">
						
						<!--  -->
						<c:set var="count" value="0" scope="page" />
 						<c:forEach items="${sessionScope.showCollect}" var="element">
							<div class="col-md-1">
										<div class="pull-left" id="${count}" onclick="test(this.id)" name="${element.getBusinessID()}" style="color:red;cursor:pointer;">
											<h1>❤</h1>
										</div>
										<c:choose>
										<c:when test="${count>=0}">
										
										</c:when>
										</c:choose>
							</div>
					    	<div class="col-md-11">
									<a href="detailCollectUI.jsp?count=${count}&lat=${element.getLatitude()}&lng=${element.getLongitude()}" class="list-group-item">
										<div class="pull-left">
											<img class="img-thumbnail" src="${element.getImageURL()}" style="float:left;height:70px;width:70px;">
										</div>
										<div class="pull-left" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">Name : ${element.getBusinessID()}</h4>
											<p class="list-group-item-text">Rating : ${element.getRating()}</p>
											<p class="list-group-item-text">PhoneNumber : ${element.getPhone()}</p>
										</div>
										<div class="pull-right" style="margin-left:1vw;text-overflow:ellipsis;">
											<h4 class="list-group-item-heading">  ${element.getLocation().getDisplayAddress()}</h4>
										</div>
										<div class="clearfix"></div>
									</a>
		       				</div>
		       	
		       				
		       			<c:set var="count" value="${count + 1}" scope="page"/>
						</c:forEach>
		       				<!--${element.getReview().get(0).getReview()}  -->
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
	<script>
	
	  function test(th){
	    if(arr[th]==1){
	    	$("#"+th).css("color", "black");
	    	console.log($("#"+th).attr('name')+"fafefaf");
	    	arr[th]=0;
	    	$.ajax({
				type : "post",
				cache : false,
				url : "yelp.do",
				data : {
					collect : $("#"+th).attr('name'),
					collectmethod : 2
				},
				dataType : "json",
				success : function(response) {	
					location.reload();
				},
				error : function() {
					console.log("ajax失敗");
				}
			});
	    }
	    else{
	    	$("#"+th).css("color", "red");
	    	arr[th]=1;
	    	$.ajax({
				type : "post",
				cache : false,
				url : "yelp.do",
				data : {
					collect : $("#"+th).attr('name'),
					collectmethod : 1
				},
				dataType : "json",
				success : function(response) {	
					location.reload();
				},
				error : function() {
					console.log("ajax失敗");
				}
			});
	    }
	  } 

		$("#collect").click(
				function(){
					$.ajax({
						url : "show.do",
						method : "post",
						data : {
						},
						dataType : "json",
		
						success : function(response) {		
							if (response == "success") {
								location.reload();
							}
						},
						error : function() {
							console.log("錯誤訊息");
						}
					});
				}
		);
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 模板套用 -->
<jsp:include page="StandardTitle.jsp" ></jsp:include>

<script>
$(document).ready(function() {
	if (document.cookie == "1") {
		$('#modal-show').click();
	}
	/*前置*/
	$.getScript("js/modalGenerator.js");	//取得modalGenerator.js
	$("body").append(
			"	<a id='modal-1' href='#modal-container-1' role='button' class='btn' data-toggle='modal' >"+
			"	</a>");
	/*搜尋列表*/
	$("#search").click(function(e) {
		//$.getScript("js/search.js");	//取得search.js//暫時先不用
	});
	
	/*near預設值*/
	$("#near").val("Taipei Taiwan");
	
	$("#search").click(function(e) {
		document.cookie = "1";
		$("#modal-container-search").attr("aria-hidden","true")
		e.preventDefault();
		$.ajax({
			type: "post",
			cache: false,
			url: "yelp.do",
			data: {
				key : $("#id").val(),
				location: $("#near").val(),
				search : "1"
			},
			dataType: "json",
			success: function(response) {	
				if (response == "success") console.log("API創立成功");
				else console.log("API創立失敗");
				document.location.href="HomepageUI.jsp";
			}, error: function() {
				console.log("ajax失敗");
			}
		});
	});
});

</script>

</head>
<body>

	<div class="col-md-12">
	<!-- 撰寫區 -->
	<!-- ======================================================================================================================================================= -->
		
		<div class="row" style="text-align:center;margin-top:25vh;">
	    </div>

	    <div class="col-md-4"></div>
	    <div class="col-md-2">
		    <div class="input-group" style="margin-bottom: 1vh;">
				<span class="input-group-addon" style="background-color:#2D9AB7;color: #ffffff;border:1px solid #ffffff;">Find</span>
				<input type="text" class="form-control input-lg" name="key" id="id" placeholder="Starbucks?" />
			</div>
		</div>
		<div class="col-md-2">
		    <div class="input-group" style="margin-bottom: 1vh;">
				<span class="input-group-addon" style="background-color:#2D9AB7;color: #ffffff;border:1px solid #ffffff;">Near</span>
				<input type="text" class="form-control input-lg" name="key" id="near" placeholder="Taipei Taiwan" />
			</div>
		</div>
		<div class="col-md-12" style="text-align:center;margin-top:5vh;">
			<a id="modal-search" href="#modal-container-search" role="button" class="btn">
				<button type='submit' id="search" class='btn btn-default' style="font-weight:bold;margin:0;width:20vw;">
					<h5>search</h5>
				</button>
			</a>
	    </div>
		<div class="col-md-12" style="text-align:center;margin-top:5vh;visibility: hidden;">
			<a id="modal-show" href="#modal-container-search" role="button" class="btn" data-toggle='modal'>
				<button type='submit' id="search" class='btn btn-default' style="font-weight:bold;margin:0;width:20vw;">
					<h5>Show</h5>
				</button>
			</a>
	    </div>
   		<!--  <a href="userCollect.jsp">To Collect</a> -->
   		
	<!-- ======================================================================================================================================================= -->
	</div>
	
	
	<!-- modal start -->
	<div class="modal fade" id="modal-container-search" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="close();document.cookie='0'">×</button>
					<h4 class="modal-title">
					<!-------------------------------------- title start -------------------------------------->
						搜尋結果列表
					<!-------------------------------------- title end -------------------------------------->
					</h4>
				</div>
				<div class="modal-body">
					<div>
						<!-------------------------------------- body start -------------------------------------->
						<div class="row">
				    	<div class="col-md-12">
		       				<div class="list-group">
								<!--<a href="detailSearchUI.jsp" class="list-group-item">
									<div class="pull-left">
										<img class="img-thumbnail" src="picture/logo.png" style="float:left;height:70px;width:70px;">
									</div>
									<div class="pull-left" style="margin-left:1vw;text-overflow:ellipsis;">
										<h4 class="list-group-item-heading">Name : </h4>
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
								</a>-->
								<c:set var="count" value="0" scope="page" />
 								<c:forEach items="${sessionScope.yelp}" var="element">
								<a href="detailSearchUI.jsp" class="list-group-item">
									<div class="pull-left">
										<img class="img-thumbnail" src="${element.getImageURL()}" style="float:left;height:70px;width:70px;">
									</div>
									
									<div class="pull-left" style="margin-left:1vw;text-overflow:ellipsis;">
										<h4 class="list-group-item-heading">Name : ${element.getBusinessID().toString()}</h4>
										<p class="list-group-item-text">Distance : ${element.getDistance()}</p>
										<p class="list-group-item-text">Rating : ${element.getRating()}</p>
										<p class="list-group-item-text">PhoneNumber : ${element.getPhone()}</p>
									</div>
									<div class="pull-right" style="margin-left:1vw;text-overflow:ellipsis;">
										<!--<h4 class="list-group-item-heading">信義</h4>-->
										<p class="list-group-item-text">${element.getLocation().getDisplayAddress()}</p>
									</div>
									
									<div class="clearfix"></div>
									<c:set var="count" value="${count + 1}" scope="page"/>
									</c:forEach>
								</a>
							</div>
	       				</div>
				    </div>
					
					<!-------------------------------------- body end -------------------------------------->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="close(); document.cookie='0'">關閉</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->

	
</body>
</html>
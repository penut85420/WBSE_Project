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

<!-- 模板套用 -->
<jsp:include page="StandardTitle.jsp" ></jsp:include>

<script>
$(document).ready(function() {
	/*前置*/
	$.getScript("js/modalGenerator.js");	//取得modalGenerator.js
	$("body").append(
			"	<a id='modal-1' href='#modal-container-1' role='button' class='btn' data-toggle='modal' >"+
			"	</a>");
	/*搜尋列表*/
	$("#search").click(function(e) {
		$.getScript("js/search.js");	//取得search.js
	});
	
	/*near預設值*/
	$("#near").val("Taipei Taiwan");
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
			<button type='submit' id="search" class='btn btn-default' style="font-weight:bold;margin:0;width:20vw;"><h5>search</h5></button>
	    </div>
   		<!--  <a href="userCollect.jsp">To Collect</a> -->
   		
	<!-- ======================================================================================================================================================= -->
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>

<!-- 模板套用 -->
<jsp:include page="StandardTitle.jsp" ></jsp:include>

<style>
*{
	color:black;
}

</style>


</head>
<body>

<div class="col-md-12">
<!-- 撰寫區 -->
<!-- ======================================================================================================================================================= -->
	<div class="row">
		<div class="col-md-12" style="margin-top:5vh;"></div>
	</div>
	
	<!-- 主要 -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div style="text-overflow:ellipsis;text-align:left;">
				<h1>星巴克-信義區-4</h1>
				<h4 style="margin-top:6vh;">Rating : ★★★★☆</h4>
				<h4 style="margin-top:3vh;">PhoneNumber : 02 25578493</h4>
				<h4 style="margin-top:3vh;">Address : 200基隆市仁愛區愛二路45號</h4>
				<button type='submit' id="collect" class='btn btn-default' style="font-weight:bold;width:15vw;margin-top:3vh;"><h5>❤收藏</h5></button>
			</div>			
		</div>
		<div class="col-md-6"  style="text-align:center;">
			<div style="text-overflow:ellipsis;">
				<img class="img-thumbnail" src="picture/logo.png" style="float:left;height:40vh;width:40vw;">
			</div>
		</div>
	</div>
		
	
	<!-- 一條線 -->
	<div class="row">		
		<div class="col-md-1"></div>
		<div class="col-md-10" style="background-color:#DDDDDD; height:1px;margin-top:5vh;margin-bottom:5vh;">
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<!-- 位置 -->	
	<div class="row">	
		<div class="col-md-1"></div>
		<div class="col-md-2" style="text-align:left;">
			<h2>位置</h2>
		</div>
		<div class="col-md-9"></div>
	</div>
	
	
	<div class="row">	
		<div class="col-md-1"></div>
		<div class="col-md-10" style="text-align:left;">
			<iframe width='100%' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=基隆市仁愛區愛二路45號&z=16&output=embed&t='></iframe>
		</div>
		
		<div class="col-md-1"></div>
	</div>
		 
<!-- ======================================================================================================================================================= -->
</div>		

</body>
</html>
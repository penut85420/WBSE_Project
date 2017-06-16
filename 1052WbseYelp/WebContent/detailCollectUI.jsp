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

<script>
var heart=1;	//1紅色愛心 0白色愛心

/*變換愛心顏色*/
$(document).ready(function() {
	$("#heart").click(function(e) {
		if(heart==0){
			$("#heart").css("color", "white");
			heart = 1;
		}
		else if(heart==1){
			$("#heart").css("color", "red");
			heart = 0;
		}
	});
});
</script>

<%
	request.setCharacterEncoding("UTF-8");
	String count=request.getParameter("count");
	System.out.println(count);
%>
</head>
<body>

<div class="col-md-12">
<!-- 撰寫區 -->
<!-- ======================================================================================================================================================= -->
	<div class="row">
		<div class="col-md-12" style="margin-top:5vh;"></div>
	</div>
	<c:set var="count" value="0"></c:set>
	<c:set var="cou" value="<%=count %>"></c:set>
	<!-- 主要 -->
	<c:forEach items="${sessionScope.showCollect}" var="element" varStatus="loopCounter">
			
			<c:if test="${count == cou}">
	<div class="row" style="color:white;margin-top:2vh;">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div style="text-overflow:ellipsis;text-align:left;">
			
			
					<h1>${element.getBusinessID()}&nbsp;&nbsp;<span id="heart" style="color:white;cursor:pointer;">❤</span></h1>
					<h5 style="margin-top:6vh;">Rating : ${element.getRating()}</h5>
					<h5 style="margin-top:3vh;">PhoneNumber : ${element.getPhone()}</h5>
					<h5 style="margin-top:3vh;">Address : ${element.getLocation().getDisplayAddress()}</h5>
				<!--  <button type='submit' id="collect" class='btn btn-default' style="font-weight:bold;width:15vw;margin-top:3vh;"><h5>❤收藏</h5></button> -->
				
			</div>			
		</div>
		<div class="col-md-6"  style="text-align:center;">
			<div style="text-overflow:ellipsis;">
				<img class="img-thumbnail" src="${element.getImageURL()}" style="float:left;height:60vh;width:35vw;">
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
	<div class="row" style="color:white;">	
		<div class="col-md-1"></div>
		<div class="col-md-2" style="text-align:left;text-decoration:underline;">
			<h2>位置</h2>
		</div>
		<div class="col-md-9"></div>
	</div>
	
	<div class="row" style="margin-top:3vh;">	
		<div class="col-md-1"></div>
		<div class="col-md-10" style="text-align:left;">
			<iframe width='100%' frameborder='0' scrolling='no' src='http://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=基隆市仁愛區愛二路45號&z=16&output=embed&t='></iframe>
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<!-- 一條線 -->
	<div class="row">		
		<div class="col-md-1"></div>
		<div class="col-md-10" style="background-color:#DDDDDD; height:1px;margin-top:5vh;margin-bottom:5vh;">
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<!-- 評論 -->	
	<div class="row" style="color:white;">	
		<div class="col-md-1"></div>
		<div class="col-md-2" style="text-align:left;text-decoration:underline;">
			<h2>評論</h2>
		</div>
		<div class="col-md-9"></div>
	</div>
	
	
	<div class="row" style="color:white;margin-top:3vh;">	
		<div class="col-md-1"></div>
		<div class="col-md-10" style="text-align:left;">
			${element.getReview().get(0).getUserName()}<br>
			<span style="color:yellow;">Rating: ${element.getReview().get(0).getRating()}
			</span>&nbsp;&nbsp;${element.getReview().get(0).getTime()}<br>
			${element.getReview().get(0).getReview()}<br><br>
			
			${element.getReview().get(1).getUserName()}<br>
			<span style="color:yellow;">Rating: ${element.getReview().get(1).getRating()}
			</span>&nbsp;&nbsp;${element.getReview().get(1).getTime()}<br>
			${element.getReview().get(1).getReview()}<br><br>
			
			${element.getReview().get(2).getUserName()}<br>
			<span style="color:yellow;">Rating: ${element.getReview().get(2).getRating()}
			</span>&nbsp;&nbsp;${element.getReview().get(2).getTime()}<br>
			${element.getReview().get(2).getReview()}<br><br>
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<!-- 以免被最底下的灰色擋住 -->
	<br><br><br><br>
	</c:if>
	<c:set var="count" value="${count+1 }"></c:set>
	</c:forEach>
<!-- ======================================================================================================================================================= -->
</div>		

</body>
</html>
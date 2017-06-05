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
<title>SearchPage</title>
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
</head>
<body>
	<a href="Homepage.jsp">To homepage</a>
 		<c:forEach items="${sessionScope.yelp}" var="element">
 		<table border=3 rules="all">
 				<tr><td colspan=2>
    			<input type="button" class="collect" name="collect" value="${element.getBusinessID()}" />
				</td>
				<tr><td>BussinessID</td><td>${element.getBusinessID()}</td></tr>
				<tr><td>Name</td><td>${element.getName()}</td></tr>
				<tr><td>Image</td><td><img width=200 src="${element.getImageURL()}"/></td></tr>
				<tr><td>Isclosed</td><td>${element.getIsClosed()}</td></tr>
				<tr><td>Rating</td><td>${element.getRating()}</td></tr>
				<tr><td>URL</td><td>${element.getURL()}</td></tr>
				<tr><td>ReviewCount</td><td>${element.getReviewCount()}</td></tr>
				<tr><td>Latitude</td><td>${element.getLatitude()}</td></tr>
				<tr><td>Longitude</td><td>${element.getLongitude()}</td></tr>
				<tr><td>Price</td><td>${element.getPrice()}</td></tr>
				<tr><td>Phonenumber</td><td>${element.getPhone()}</td></tr>
				<tr><td>Distance</td><td>${element.getDistance()}</td></tr>
				<tr><td>Review</td><td>${sessionScope.yelpReview}</td></tr>
		</table><br><br>
		</c:forEach>
<script>
$(document).ready(function() {
	$(".collect").click(function(e) {
		e.preventDefault();
		$.ajax({
			type : "post",
			cache : false,
			url : "yelp.do",
			data : {
				collect : $(this).val()
			},
			dataType : "json",

			success : function(response) {	
				if(response=="success"){
					alert("新增成功!");
				}
				else
					alert("新增失敗!");
			},
			error : function() {
				console.log("ajax失敗");
			}
		});
	});
});
</script>
</body>
</html>
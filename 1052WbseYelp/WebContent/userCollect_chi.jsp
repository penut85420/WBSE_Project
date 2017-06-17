<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>userCollect</title>
<!--<script src="js/map.js"></script>-->
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>


<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>userCollect</title>
</head>
<body>
	<c:set var="count" value="0" scope="page" />
 		<c:forEach items="${sessionScope.showCollect}" var="element">
 		<table border=3 rules="all">
 		
 				<tr><td colspan=2>	
				<tr><td>Name</td><td>${element.getName()}</td></tr>
				<tr><td>Image</td><td><img width=200 src="${element.getImageURL()}"/></td></tr>
				<tr><td>Rating</td><td><div id="rate${count}"></div>${element.getRating()}星星</td></tr>
				
				<tr><td>Review</td><td>${sessionScope.yelpReview}</td></tr>	
				
				<form action="detail.jsp" method="POST">
				<input type="show" value="${element.getBusinessID()}" name="ID">
				<input type="show" value="${element.getLatitude()}" name="lat">
				<input type="show" value="${element.getLongitude()}" name="lng">
				<tr><td>More</td><td><input type="submit" value="click me" id="detail"/></td></tr>
				</form>
		</table>
		<br><br>
		<c:set var="count" value="${count + 1}" scope="page"/>
		</c:forEach>
	<a href="Homepage.jsp">To mainpage</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="org.json.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<tr><td>Rating</td><td><div id="rate${count}"></div>${element.getRating()}</td></tr>
				<c:choose>
				<c:when test="${element.getRating()>=0 }">
				<script>
				$(function () {
					  $("#rate${count}").rateYo({
					    rating: "${element.getRating()}"
					  }); 
					});
				</script>
				</c:when>
				</c:choose>
				<tr><td>Review</td><td>${sessionScope.yelpReview}</td></tr>
				<form action="detail.jsp" method="POST">
				<input type="hidden" value="${element.getBusinessID()}" name="ID">
				<input type="hidden" value="${element.getLatitude()}" name="lat">
				<input type="hidden" value="${element.getLongitude()}" name="lng">
				<tr><td>More</td><td><input type="submit" value="click me" id="detail"/></td></tr>
				</form>
		</table>
		<br><br>
		<c:set var="count" value="${count + 1}" scope="page"/>
		</c:forEach>
	<a href="Homepage.jsp">To mainpage</a>
</body>
</html>
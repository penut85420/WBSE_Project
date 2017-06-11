<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.*" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

<title>shop details</title>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String ID=request.getParameter("ID");
	String shopLat=request.getParameter("lat");
	String shopLng=request.getParameter("lng");
%>
<script>
function initialize() {
	var map;
	var marker;
	var shopLattitude=<%=shopLat%>;
	var shopLongitude=<%=shopLng%>;
	console.log(shopLattitude);
	console.log(shopLongitude);
	var pos={
		lat:shopLattitude,
		lng:shopLongitude
	}
  	var mapOptions = {
	    zoom:18,
	    center: pos
	  };
  	marker = new google.maps.Marker({
  	    map: map,
  	    position: pos
  	  });
  map = new google.maps.Map(document.getElementById("map"),mapOptions);
  marker.setMap(map);
}
</script>
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDgyJiejsXuJcizTtM6g_WTWd2tXFP06w&callback=initialize&v=3.exp"></script>
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
</head>
<body>
	<c:forEach items="${sessionScope.yelp}" var="element" varStatus="loopCounter">
			<c:set var="clickID" value="<%=ID %>"></c:set>
			<c:if test="${sessionScope.yelp[loopCounter.count-1].getBusinessID() eq clickID}">
	 		<table border=3 rules="all">
	 				<tr><td colspan=2>
	    			<input type="button" class="collect" name="collect" value="${element.getBusinessID()}" />
					</td>
					<tr><td>BussinessID</td><td><div id="id">${element.getBusinessID()}</div></td></tr>
					<tr><td>Name</td><td>${element.getName()}</td></tr>
					<tr><td>Image</td><td><img width=200 src="${element.getImageURL()}"/></td></tr>
					<tr><td>Isclosed</td><td>${element.getIsClosed()}</td></tr>
					<tr><td>Rating</td><td><div id="rateYo"></div>${element.getRating()}</td></tr>
					<script>
					$(function () {
						  $("#rateYo").rateYo({
						    rating: "${element.getRating()}"
						  }); 
						});
					</script>
					<tr><td>URL</td><td>${element.getURL()}</td></tr>
					<tr><td>ReviewCount</td><td>${element.getReviewCount()}</td></tr>
					<tr><td>Latitude</td><td>${element.getLatitude()}</td></tr>
					<tr><td>Longitude</td><td>${element.getLongitude()}</td></tr>
					<form action="map.jsp" method="post">
					<input type="hidden" name="lat" value="${element.getLatitude()}">
					<input type="hidden" name="lng" value="${element.getLongitude()}">
					<tr><td>map</td><td><div id="map" style="height:300px; width:500px"></div><input type="submit" value="大地圖"/></td></tr>
					</form>
					<tr><td>Price</td><td>${element.getPrice()}</td></tr>
					<tr><td>Phonenumber</td><td>${element.getPhone()}</td></tr>
					<tr><td>Distance</td><td>${element.getDistance()}</td></tr>
					<tr><td>Review</td><td>${sessionScope.yelpReview}</td></tr>
			</table>
			<br><br>
		</c:if>
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
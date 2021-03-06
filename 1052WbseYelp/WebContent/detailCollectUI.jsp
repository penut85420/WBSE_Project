<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->

<!-- 模板套用 -->
<jsp:include page="StandardTitle.jsp" ></jsp:include>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
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
	String shopLat=request.getParameter("lat");
	String shopLng=request.getParameter("lng");
	System.out.println(count);
%>

<script>
	var poss;
    var shopLattitude=<%=shopLat%>;
	var shopLongitude=<%=shopLng%>;
	console.log(shopLattitude);
	console.log(shopLongitude);
	var pos={
		lat:shopLattitude,
		lng:shopLongitude
	}
	function initMap() {
		var map=new google.maps.Map(document.getElementById('map'),{
			center:pos,
			zoom:18
		});
	
		var marker;
		var directionsDisplay=new google.maps.DirectionsRenderer({draggable:true,map:map});
		var directionsService=new google.maps.DirectionsService();
		directionsDisplay.setMap(map);
		directionsDisplay.addListener('directions_changed',function(){
			computeTotalDistance(directionsDisplay.getDirections());
			},false);
		var direcbutton=document.getElementById("direction");
		direcbutton.addEventListener("click",directing,false);
		
		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				poss={
						lat:position.coords.latitude,
						lng:position.coords.longitude
				};
				
				marker=new google.maps.Marker({
					position:poss,
					map:map
				});
				
				startLng=position.coords.longitude;
				startLat=position.coords.latitude;
			})
		}
		
		var shopMarker=new google.maps.Marker({
			position:pos,
			map:map
		});
		
		function directing(){
			var selectedMode=document.getElementById("mode").value;
			var request={
				origin:poss,
				destination:pos,
				travelMode:google.maps.TravelMode[selectedMode]
			};
			
			directionsService.route(request,function(result,status){
				if(status== 'OK'){
					directionsDisplay.setDirections(result);
				}else{
					modalGenerator("發生錯誤", "無法計算適合的路線");
				}
			});
			computeTotalDistance(directionsDisplay.getDirections());
		}
		
		function computeTotalDistance(result){
			var total=0;
			var myroute=result.routes[0];
			for(var i=0;i<myroute.legs.length;i++){
				total+=myroute.leg[i].distance.value;
			}
			total=total/1000;
			document.getElementById("total").innerHTML="total distance"+total+"km";
		}
	}
</script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDgyJiejsXuJcizTtM6g_WTWd2tXFP06w&callback=initMap&v=3.exp"></script>
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>

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
					<h5 style="margin-top:6vh;">Rating :
					<div id="rateYo"></div>
					<script>
					$(function () {
						  $("#rateYo").rateYo({
						    rating: "${element.getRating()}"
						  }); 
						});
					</script></h5>
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
		<div class="col-md-8">	
			<div class="pull-right">
				<select class="form-control" style="width:20vw;text-align:center;text-align-last:center;" id="mode">
					<option value="DRIVING">Driving</option>
					<option value="WALKING">Walking</option>
					<option value="BICYCLING">Bicycling</option>
					<option value="TRANSIT">Transit</option>
				</select>
					<button type='submit' class='btn btn-default' style="font-weight:bold;margin:0;width:20vw;" id="direction">
					<h5>路線規劃</h5>
				</button>
				<div id="total"></div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<div class="row" style="margin-top:3vh;">	
		<div class="col-md-1"></div>
		<div class="col-md-10" style="text-align:left;">
			<div id="map" style="height:300px; width:100%;"></div>
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
			${element.getReview().get(0).getUserName()}&nbsp;&nbsp;&nbsp;&nbsp;${element.getReview().get(0).getTime()}<br>
			<span style="color:yellow;" id="rateYo2">Rating:
			<script>
					$(function () {
						  $("#rateYo2").rateYo({
						    rating: "${element.getReview().get(0).getRating()}"
						  }); 
						});
					</script>
			</span>
			${element.getReview().get(0).getReview()}<br><br>
			
			${element.getReview().get(1).getUserName()}&nbsp;&nbsp;&nbsp;&nbsp;${element.getReview().get(1).getTime()}<br>
			<span style="color:yellow;" id="rateYo3">
			<script>
					$(function () {
						  $("#rateYo3").rateYo({
						    rating: "${element.getReview().get(1).getRating()}"
						  }); 
						});
					</script>
			</span>
			${element.getReview().get(1).getReview()}<br><br>
			
			${element.getReview().get(2).getUserName()}&nbsp;&nbsp;&nbsp;&nbsp;${element.getReview().get(2).getTime()}<br>
			<span style="color:yellow;" id="rateYo4">
			<script>
					$(function () {
						  $("#rateYo4").rateYo({
						    rating: "${element.getReview().get(2).getRating()}"
						  }); 
						});
					</script>
			</span>
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
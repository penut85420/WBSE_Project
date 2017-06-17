<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
var map;
function initialize() {
  var mapOptions = {
    zoom:18,
    center: new google.maps.LatLng(25.04, 121.33)
  };
  
  if (navigator.geolocation) {//自動定位
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,//得到裝置位置的經緯度
          lng: position.coords.longitude
        };
		
		marker = new google.maps.Marker({//在目前位置放上標記
			position: pos,
			map: map
		});
		
		startLng=position.coords.longitude//存放起始位置經緯度
		startLat=position.coords.latitude;

        map.setCenter(pos);//地圖中心設為目前位置
      })
    }
  
  map = new google.maps.Map(document.getElementById('map'),
      mapOptions);
}


google.maps.event.addDomListener(window, 'load', initialize);
</script>
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDgyJiejsXuJcizTtM6g_WTWd2tXFP06w&callback=initMap&v=3.exp">
    </script>
</head>
<body>
 <div id="map" style="height:300px; width:500px"></div>
</body>
</html>
<!DOCTYPE html>
<html>
  <head>
    <title>MapTest</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 80%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    <% 
	    String ID=request.getParameter("ID");
		String shopLat=request.getParameter("lat");
		String shopLng=request.getParameter("lng");
    %>
  </head>
  <body>
    <div id="map"></div>
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
        var map = new google.maps.Map(document.getElementById('map'), {//在網頁上放上地圖物件
          center: pos,//預設的地圖中心為台北市中心
          zoom: 18//地圖顯示大小，值越大越詳細
        });
		
		var marker;
		var directionsDisplay= new google.maps.DirectionsRenderer( {draggable: true,map: map});//顯示路線規劃
		var directionsService = new google.maps.DirectionsService();//路線規劃
		directionsDisplay.setMap(map);//路線畫在MAP上
		directionsDisplay.addListener('directions_changed', function() {//當路線改變，重新計算距離
			computeTotalDistance(directionsDisplay.getDirections());
		},false);
		var direcbutton=document.getElementById("direction");//路線規劃按鈕
		direcbutton.addEventListener("click",directing,false);
		
		
		if (navigator.geolocation) {//自動定位
	          navigator.geolocation.getCurrentPosition(function(position) {
	            poss = {
	              lat: position.coords.latitude,//得到裝置位置的經緯度
	              lng: position.coords.longitude
	            };
				
				marker = new google.maps.Marker({//在目前位置放上標記
					position: poss,
					map: map
				});
				
				startLng=position.coords.longitude//存放起始位置經緯度
				startLat=position.coords.latitude;
	          })
	        }
		
		var shopMarker=new google.maps.Marker({
				map:map,
				position:pos
			});
		
		function directing(){//路線規劃
			var selectedMode = document.getElementById("mode").value;//選擇交通方式
			console.log(selectedMode);
			var request = {//包一個請求物件給路線規劃API
				origin: poss,//起點
				destination: pos,//終點
				travelMode: google.maps.TravelMode[selectedMode]//交通方式
			};

			directionsService.route(request, function(result, status) {
				if (status == 'OK') {
					directionsDisplay.setDirections(result);
				}else{
					window.alert("Cannot plan a good route");
				}
			});
			computeTotalDistance(directionsDisplay.getDirections());//計算距離
		}
		
		function computeTotalDistance(result) {//計算路徑距離
			var total = 0;
			var myroute = result.routes[0];
			for (var i = 0; i < myroute.legs.length; i++) {//分段計算後加總
				total += myroute.legs[i].distance.value;
			}
			total = total / 1000;//將單位換成公里
			document.getElementById("total").innerHTML = "total distance:"+total + "km";
			}
		
    }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDDgyJiejsXuJcizTtM6g_WTWd2tXFP06w&callback=initMap&v=3.exp">
    </script>
	<form action="#">
		<select id="mode">
			<option value="DRIVING">Driving</option>
			<option value="WALKING">Walking</option>
			<option value="BICYCLING">Bicycling</option>
			<option value="TRANSIT">Transit</option>
		</select>
		<input type="button" id="direction" value="Route planning"/>
		<div id="total"></div>
	</form>
  </body>
</html>
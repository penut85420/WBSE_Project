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


</head>
<body>

<div class="col-md-12">
<!-- 撰寫區 -->
<!-- ======================================================================================================================================================= -->
	<div class="row">
		<div class="col-md-12" style="margin-top:5vh;"></div>
	</div>
	
	<!-- 主要 -->
	<div class="row" style="color:white;margin-top:2vh;">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<div style="text-overflow:ellipsis;text-align:left;">
				<h1>星巴克-信義區-4&nbsp;&nbsp;<span id="heart" style="color:white;cursor:pointer;">❤</span></h1>
				<h5 style="margin-top:6vh;">Rating : ★★★★☆</h5>
				<h5 style="margin-top:3vh;">PhoneNumber : 02 25578493</h5>
				<h5 style="margin-top:3vh;">Address : 200基隆市仁愛區愛二路45號</h5>
				<!--  <button type='submit' id="collect" class='btn btn-default' style="font-weight:bold;width:15vw;margin-top:3vh;"><h5>❤收藏</h5></button> -->
			</div>			
		</div>
		<div class="col-md-6"  style="text-align:center;">
			<div style="text-overflow:ellipsis;">
				<img class="img-thumbnail" src="picture/logo.png" style="float:left;height:60vh;width:35vw;">
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
			<span style="font-size:2em;">蔡</span>佳靜<br>
			<span style="color:yellow;">★★★★☆</span>&nbsp;&nbsp;06/04/2017<br>
			很適合大型聚餐20人左右為佳<br><br>
			
			<span style="font-size:2em;">H</span>siu Kuei Tsai<br>
			<span style="color:yellow;">★★★☆☆</span>&nbsp;&nbsp;05/31/2017<br>
			很喜歡去吃，肉品質很棒。 但是希望針對6歲以下兒童能有不同的優惠， 因為帶兩個小朋友去，小一女生食量不大的多少會吃一些。 最小的雖然未滿六歲(身高比較高)食量小也需要收費250元， 媽咪荷包有點傷心~~~~謝謝。 上次錯過兒童專案，不然一定要去吃!!<br><br>
			
			<span style="font-size:2em;">B</span>onnie Zang<br>
			<span style="color:yellow;">★☆☆☆☆</span>&nbsp;&nbsp;11/22/2016<br>
			昨天午餐在「胡弄壽喜燒」覺得男服務生很親切，讓我和朋友度過一個愉悅的一天 有些小建議：調味料（醬汁、湯頭 可分兩種更好） 因為我們覺的太鹹了些。<br><br>
		</div>
		<div class="col-md-1"></div>
	</div>
	
	<!-- 以免被最底下的灰色擋住 -->
	<br><br><br><br>
		 
<!-- ======================================================================================================================================================= -->
</div>		

</body>
</html>
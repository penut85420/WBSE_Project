<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HomePage</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- Main Container -->
<div class="container"> 
  <!-- Navigation -->
  <header> <a href="">
    <h4 class="logo">FOODSEARCH</h4>
  </a>
    <nav>
      <ul>
        <li>HOME</li>
        <li>LOGOUT</li>
      </ul>
    </nav>
  </header>
  <!-- Hero Section -->
  <!-- About Section -->
  <!-- Stats Gallery Section -->
  <!-- Parallax Section -->
  
  <!-- More Info Section -->
  <footer> </footer>
  <section class="banner">
    <h2 class="parallax"></h2>
       <div style="text-align:center;">     
   <input type="text" name="key" id="id" style="font-size: 30px;" placeholder="Starbucks?">
   </div>  
 
    <div>
      <form>
      </form>
    </div>
    <div class="button">search</div>
  </section>
  <!-- Footer Section -->
  
  <!-- Copyrights Section -->
  <div class="copyright">&copy;2017 - <strong>FoodSearch</strong></div>
</div>
<!-- Main Container Ends -->
<script>
$("#id").val('${sessionScope.yelp}');
$(document).ready(function() {
	$(".button").click(function(e) {
		e.preventDefault();
		$.ajax({
			type : "post",
			cache : false,
			url : "yelp.do",
			data : {
				key : $("#id").val()
			},
			dataType : "json",

			success : function(response) {	
				if(response=="success")
					console.log("API創立成功");
				else
					console.log("API創立失敗");
				window.location.reload();
			},
			error : function() {
				console.log("ajax失敗");
				window.location.reload();
			}
		});
	});
});
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>YelpAPI</title>
</head>
<body>
	<input type="text" id="key"/>
	<input type="button" id="search" value="search"/>
	<p id="yel"></p>
<script>
$(document).ready(function() {
	$("#search").click(function(e) {
		e.preventDefault();
		$.ajax({
			type : "post",
			cache : false,
			url : "yelp.do",
			data : {
				key : $("#key").val()
			},
			dataType : "json",

			success : function(response) {	
				if(response=="success")
					console.log("API創立成功");
				else
					console.log("API創立失敗");
				$("#yel").val('${sessionScope.yelp}');
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
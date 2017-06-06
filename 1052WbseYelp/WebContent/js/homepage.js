
$(document).ready(function() {
	$.ajax({
		type : "post",
		cache : false,
		url : "collect.do",
		data : {
		},
		dataType : "json",
		success : function(response) {	
			if(response=="success"){
				console.log("收藏創立成功");
			}
			else
				console.log("收藏創立失敗");
		},
		error : function() {
			console.log("ajax失敗");
		}
	});
	$(".button").click(function(e) {
		e.preventDefault();
		$.ajax({
			type : "post",
			cache : false,
			url : "yelp.do",
			data : {
				key : $("#id").val(),
				search : "1"
			},
			dataType : "json",
			success : function(response) {	
				if(response=="success"){
					console.log("API創立成功");
					
				}
				else
					console.log("API創立失敗");
				document.location.href="searchPage.jsp";
			},
			error : function() {
				console.log("ajax失敗");
			}
		});
	});
});

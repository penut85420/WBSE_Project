		var heart=0;	//1紅色愛心 0黑色愛心
		
		/*收藏列表*/
		modalGenerator("已收藏列表",
				"<div class='row'>"+
				"	<div class='col-md-1'>"+
				"				<div class='pull-left' id='heart' style='color:red;cursor:pointer;'>"+
				"					<h1>❤</h1>"+
				"				</div>"+
				"	</div>"+
			    "	<div class='col-md-11'>"+
				"			<a href='searchUI.jsp' class='list-group-item'>"+
				"				<div class='pull-left'>"+
				"					<img class='img-thumbnail' src='picture/logo.png' style='float:left;height:70px;width:70px;'>"+
				"				</div>"+
				"				<div class='pull-left' style='margin-left:1vw;text-overflow:ellipsis;'>"+
				"					<h4 class='list-group-item-heading'>Name : 星巴克-信義區-4</h4>"+
				"					<p class='list-group-item-text'>Distance : 4400KM</p>"+
				"					<p class='list-group-item-text'>Rating : ★★★★☆</p>"+
				"					<p class='list-group-item-text'>PhoneNumber : 02 25578493</p>"+
				"				</div>"+
				"				<div class='pull-right' style='margin-left:1vw;text-overflow:ellipsis;'>"+
				"					<h4 class='list-group-item-heading'>信義</h4>"+
				"					<p class='list-group-item-text'>11 Bao'an Street</p>"+
				"					<p class='list-group-item-text'>保安街11號</p>"+
				"					<p class='list-group-item-text'>Datong District, 台北市 103</p>"+
				"					<p class='list-group-item-text'>Taiwan</p>"+
				"				</div>"+
				"				<div class='clearfix'></div>"+
				"			</a>"+
       			"	</div>"+
			    "</div>");
		
		/*變換愛心顏色*/
		$("#heart").click(function(e) {
			if(heart==0){
				$("#heart").css("color", "black");
				heart = 1;
			}
			else if(heart==1){
				$("#heart").css("color", "red");
				heart = 0;
			}
		});
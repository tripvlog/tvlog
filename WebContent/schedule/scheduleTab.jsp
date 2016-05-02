<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var staticNum = 1;
function test(){
	var colCount = document.getElementById('count').value;
	if(staticNum < colCount){
		add_col();
		staticNum = colCount;
	}else{
		del_col();
		staticNum = colCount;
	}
}
function add_col() 
{
	var colCount = document.getElementById('count').value;
	var stock_table = document.getElementById('stock_table');
	var stock_tbody = document.getElementById('stock_tbody');
	var stock_tr = null;
	var stock_td = null;
	var stock_x = 0;
	var stock_y = 0;
	var msg = document.getElementById('msg');
	
    var stock_tbody_tr = stock_table.getElementsByTagName('tr');
	for (i=0; i<stock_tbody_tr.length; i++) {
	    stock_td = document.createElement('td');
	    stock_tbody_tr[i].appendChild(stock_td);
	    stock_td.innerHTML='&nbsp;';
	}
}

function del_col()
{
	
	var stock_table = document.getElementById('stock_table');
    var stock_thead_tr = stock_table.getElementsByTagName('tr');
    var stock_thead_td = stock_table.getElementsByTagName('td');
   
    if (stock_thead_td.length > 2) {

        var stock_tbody_tr = stock_table.getElementsByTagName('tr');
        for (i=0; i<stock_tbody_tr.length; i++) {
            var tr_td = stock_tbody_tr[i].getElementsByTagName('td');
            stock_tbody_tr[i].deleteCell(tr_td.length-1);
        }
    }
}
</script>
<style type="text/css">
	#tabtest{
		width:565px;
		height:65px;
		font-size:30px;
	}
	.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
		color:#ffffff;
    	background-color:#47C83E;
    }
</style>
<title>트립블로그</title>
</head>
<body>
<!-- 참고 사이트 : http://zzznara2.tistory.com/593 -->
<div class="container">
&nbsp;
	<form action="" method="post" class="plan-intro" align="left">
				<div class="container-fluid" >
					<div class="row" >
						<input type="text" id="planMessage" class="form-control plan-brief" placeholder="일정에 대한 간단한 설명" maxlength="300" value="" />
         				<textarea class="form-control"  id="planDetailMessage" placeholder="일정에 대한 자세한 설명"  maxlength="20000"></textarea>
					</div>
					&nbsp;
					<div class="row" id="startschedule">
						<div class="col-md-1" id="tripstart">여행시작일</div>
						<div class="col-md-1">일</div>
						<div class="col-md-1">명</div>
						<div class="col-md-1">여행단계</div>
						<div class="col-md-1"></div>
						<div class="col-md-1">여행테마</div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
						<div class="col-md-1"></div>
					</div>
					<div class="row" id="startschedule">
						<div class="col-md-1" id="tripstart"><input id="tourStartDay" type="date" name="date" class="form-control hasDatepicker"  size="10" /></div>
						<div class="col-md-1"><input type="number" name="count" id="count" value="1" onchange="test()" min="1" class="form-control" size="8" /></div>
						<div class="col-md-1"><input type="number"  class="form-control" min="1" value="1" id="persons" /></div>
						<div class="col-md-2"><input type="radio" name="step" />여행 전 <input type="radio" name="step" />여행 후</div>
						<div class="col-md-6"><input type="checkbox" value="theme" /> 나홀로여행
											  <input type="checkbox" value="theme" /> 친구와 함께 
											  <input type="checkbox" value="theme" /> 가족과 함께
											  <input type="checkbox" value="theme" /> 단체여행
											  <input type="checkbox" value="theme" /> 패키지 여행 
											  <input type="checkbox" value="theme" /> 커플 </div>
					</div>
				</div>
	</form>
	&nbsp;
	<ul id="myTab" class="nav nav-pills" role="tablist">
	  <li role="presentation" id="tabtest" class="active" align="center"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true" ><i class="fa fa-list" aria-hidden="true"></i><b> 스토리</b></a></li>
	  <li role="presentation" id="tabtest" class="pause" align="center"><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false"><i class="fa fa-calendar" aria-hidden="true"></i><b> 지도 / 일정표</b></a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	    <p>탭1</p>
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">  
	    <div class="container">
			<form method=post action="">
			<p></p>
			<table id='stock_table' class="table table-bordered" border=1>
	 			<tr><td width="100" rowspan="2">1시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	  			<tr><td rowspan="2">2시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">3시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">4시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">5시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">6시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">7시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">8시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">9시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">10시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">11시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">12시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">13시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">14시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">15시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">16시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">17시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">18시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">19시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">20시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">21시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">22시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">23시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>
	   			<tr><td rowspan="2">24시</td><td>&nbsp;</td></tr>
	   			<tr><td>&nbsp;</td></tr>    
			</table>
			</form>
		</div>
	  </div>
	</div>
</div>
</body>
</html>
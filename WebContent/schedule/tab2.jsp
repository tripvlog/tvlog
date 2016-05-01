<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script>
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
	function add_input(name)
	{
  		var inp = document.createElement('input');
   	 	inp.setAttribute('type', 'text');
    	inp.setAttribute('size', '10');
    	inp.setAttribute('name', name);
    	stock_td.appendChild(inp);
}
</script>
<title>트립블로그</title>
</head>
<body>
<!-- 참고 사이트 : http://zzznara2.tistory.com/593 -->
<div class="container">
	<ul id="myTab" class="nav nav-tabs" role="tablist">
	  <li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">스토리</a></li>
	  <li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">지도 / 일정표</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	    <p>탭1</p>
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	  <form class="plan-intro" >
          <input type="text" id="planMessage" class="form-control plan-brief" placeholder="일정에 대한 간단한 설명" maxlength="300" value="" />
          <textarea class="form-control"  id="planDetailMessage" placeholder="일정에 대한 자세한 설명"  maxlength="20000"></textarea>
          <!-- 여행소개 -->
          <div class="plan-edit-info">
            <div class="day-step-theme">
              <div class="days">
                <h6>여행시작일 </h6>
                <input id="tourStartDay" type="text" class="form-control date-start-picker" value="2016-05-07" style="width:75px; cursor: pointer;background-color: white;" readonly="true"/>
                <h6>일</h6>
                <input type="number" min="1" max="60" class="form-control" value="5" id="maxDay" style="width:50px;"/>
                <h6>명</h6>
                <input type="number"  class="form-control" min="1" value="1" id="persons" style="width:50px;"/>
                <h6>여행단계</h6>
                <div class="btn-group" data-toggle="buttons">
                	<label class="btn active">
                  		<input type="radio" name="isTourAfter" id="isTourAfter" value="false"> <span>여행 전</span>
                	</label>
                	<label class="btn ">
                  		<input type="radio" name="isTourAfter" id="isTourAfter" value="true"> <span>여행 후</span>
                	</label>
              	</div>
              	<h6>여행테마</h6>            
                	<span class="selected" data-theme="0">나홀로 여행</span>            
                	<span class="unselected" data-theme="1">친구와 함께</span>             
                	<span class="unselected" data-theme="2">가족과 함께</span>         
                	<span class="selected" data-theme="3">단체여행</span>         
                	<span class="unselected" data-theme="4">패키지 여행</span>         
                	<span class="selected" data-theme="26">커플</span>   
              </div>
          </div><!-- more-info-con -->
        </form>
	  
	    <div class="container">
			<form method=post action="">
			<input type="number" name="count" id="count" value="1" onchange="add_col()"/>
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
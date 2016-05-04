<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

function del_col() {
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
function scheduleSave() {
	//저장하기 버튼 누르면 보여줄 화면
}
</script>
<style type="text/css">
	#tabtest{    /* 스토리, 지도/일정 탭 */
		width:470px;
		height:65px;
		font-size:30px;
	}
	.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {   /* 스토리, 지도/일정 탭 - 마우스 오버 색상 지정 */
		color:#ffffff;
    	background-color:#47C83E;
    }
    #container-fluid{   /* 오른쪽 그룹 */
    	padding:15px 15px;
    	Border-radius:10px;
    	background-color:#FFFFFF;
    }
    #myTab{   /* 스토리, 지도/일정 탭 - 배경색 지정*/
    	background-color:#FFFFFF;
    	Border-radius:10px;
    } 
    #row1{    /* 일정에 대한 간단한 설명 */
    	margin:0px;
    	padding:0px 0px;
    }
    #row2{    /* 일정에 대한 자세한 설명  */
    	margin:0px;
    	padding:0px 0px;
    }
    body{    /* 전체 배경 색상 */
    	background-color:#EAEAEA;
    }
    #btn-group{    /* 왼쪽 버튼 그룹1 */
    	width:185px;
    	Border-radius:10px;
    }
    #btn-group2{   /* 왼쪽 버튼 그룹2 */
  	    width:182px;
    	Border-radius:10px;
    	margin:0px;
    	padding:0px 0px;
    }
</style>
<title>트립블로그</title>
</head>
<body>
<!-- 참고 사이트 : http://zzznara2.tistory.com/593 -->
<div class="container" id="container">
<div>title</div>
&nbsp;
	<div class="row" id="containerTwo">
		<!-- 왼쪽 버튼 그룹 - 저장, 방문명소 -->
		<div class="col-md-2" id="savecontainer">
			<div id="btn-group" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg" id="scheduleSave" style="WIDTH:81pt" onclick="scheduleSave()"><i class="fa fa-floppy-o" aria-hidden="true"></i><center> 저장하기</center></button>
				<button type="button" class="btn btn-default btn-lg" style="WIDTH:55pt"><i class="fa fa-times" aria-hidden="true"></i><center> 취소</center></button>
			</div>
			<p></p>
			<div id="btn-group2" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg btn-block"><i class="fa fa-map-marker" aria-hidden="true"></i> 방문명소</button>
				<button type="button" class="btn btn-default btn-lg btn-block"><i class="fa fa-krw" aria-hidden="true"></i> 여행가계부</button>
				<button type="button" class="btn btn-default btn-lg btn-block"><i class="fa fa-check-square-o" aria-hidden="true"></i> 체크리스트</button>
			</div>
		</div>
		<!-- 오른쪽 그룹 - 일정 -->
		<div class="col-md-10" id="schedulecontainer" >
		<!-- 여행 소개 -->
		<form action="" method="post" class="plan-intro" align="left">
		<div class="container-fluid" id="container-fluid">
			<div class="row" id="row1">
				<input type="text" id="planMessage" class="form-control plan-brief" placeholder="일정에 대한 간단한 설명" maxlength="300" value="" />
         	</div>
         	<div class="row" id="row2">
         		<br /><textarea class="form-control"  id="planDetailMessage" placeholder="일정에 대한 자세한 설명"  maxlength="20000"></textarea>
			</div>
			&nbsp;
			<div class="row" id="startschedule">
				<div class="col-md-1" id="tripstart"><b>여행시작</b></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"><b>일</b></div>
				<div class="col-md-1"><b>명</b></div>
				<div class="col-md-1"><b>여행단계</b></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"><b>여행테마</b></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
			</div>
			<div class="row" id="startschedule">
				<div class="col-md-2" id="tripstart"><input id="tourStartDay" type="date" name="date" class="form-control hasDatepicker"  size="10"/></div>
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
	<!-- 스토리 탭 -->
	<div id="myTabContent" class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	    <p>탭1</p>
	</div>
	<!-- 지도/일정 탭 -->
	<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">  
	    <div class="tableContainer">
			<form method=post action="">
			<p></p>
			<table id='stock_table' class="table table-bordered" border=1>
	 			<tr bgcolor="#000000"><td width="100"><font color="#FFFFFF">ALL</font></td><td>&nbsp;</td></tr>
				<c:forEach var="i" begin="1" end="24" step="1">
					<tr><td rowspan="2">${i }시 </td><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
				</c:forEach>
			</table>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
</div>
</body>
</html>
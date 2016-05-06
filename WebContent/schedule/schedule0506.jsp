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
    #budget-tab{
    	list-style-type:none;
   		margin:0;
    	padding:0;
    }
    #b-tab-li{    /* 가계부 메뉴 */
		margin: 0 0 0 0;
    	padding: 0 0 0 0;
    	border : 0;
    	float: left;
	}
	#tab-li {     /* 체크리스트 메뉴 */
    	margin: 0 0 0 0;
    	padding: 0 0 0 0;
    	border : 0;
    	float: left;
	}
	#totalCost{
		list-style:none; 
	}
	#checklist-tab{
		list-style:none; 
		font-size:20px;
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
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#budget"><i class="fa fa-krw" aria-hidden="true"></i> 여행가계부</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#checklistmodal"><i class="fa fa-check-square-o" aria-hidden="true"></i> 체크리스트</button>
			</div>
			
			<!-- 가계부 모달 팝업 -->
	<div class="modal fade" id="budget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  	<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="budget">여행 가계부</h4>
	      		</div>
	      		<div class="modal-body">
	      			<div class="budget">
	     				<div class="tab-pane plantab de" id="budget">
	     					<div class="budget">
	     						<!-- STR_START : 가계부 tab 목록 -->
	     						<ul class="nav budget-tab" id="budget-tab">
	     							<!-- 체크리스트 메뉴 -->
	     							<li id="b-tab-li" class="active" style="margin-right:0;">
	     								<a target="_self" href="#b-tab1" class="btn mylist" data-toggle="tab" aria-expanded="true">전체 비용</a>
	     							</li>
	     							<li id="b-tab-li">
	     								<a target="_self" href="#b-tab2" class="btn" data-toggle="tag">일일 지출</a>
	     							</li>
	     							<li id="b-tab-li">
	     								<a target="_self" href="#b-tab3" class="btn" data-toggle="tag">방문 명소</a>
	     							</li>
	     						</ul>
	     					</div>
	     				</div>
	     			</div>
					<div class="tab-pane active" id="b-tab1">
	     				<ul class"tasks" id="totalCost">
	     					<li class="totalCost" id="totalCost1_0" data-tabid="1" data-itemid="0">
	     						<i class="fa fa-plane" aria-hidden="true"></i>  항공료
	     					</li>
	     					<li class="totalCost" id="totalCost1_1" data-tabid="1" data-itemid="1">
	     						<i class="fa fa-bus" aria-hidden="true"></i>  교통
	     					</li>
	     					<li class="totalCost" id="totalCost1_2" data-tabid="1" data-itemid="2">
	     						<i class="fa fa-hospital-o" aria-hidden="true"></i>  숙박
	     					</li>
	     					<li class="totalCost" id="totalCost1_3" data-tabid="1" data-itemid="3">
	     						<i class="fa fa-ticket" aria-hidden="true"></i>  입장료
	     					</li>
	     					<li class="totalCost" id="totalCost1_4" data-tabid="1" data-itemid="4">
	     						<i class="fa fa-spoon" aria-hidden="true"></i>  음식
	     					</li>
	     					<li class="totalCost" id="totalCost1_5" data-tabid="1" data-itemid="5">
	     						<i class="fa fa-gamepad" aria-hidden="true"></i>  오락
	     					</li>
	     					<li class="totalCost" id="totalCost1_6" data-tabid="1" data-itemid="6">
	     						<i class="fa fa-shopping-cart" aria-hidden="true"></i>  쇼핑
	     					</li>
	     					<li class="totalCost" id="totalCost1_7" data-tabid="1" data-itemid="7">
	     						<i class="fa fa-map-marker" aria-hidden="true"></i>  기타
	     					</li>
	     				</ul>				
	     			</div>
	     			<div class="tab-pane" id="b-tab2">
	     				<ul class"tasks" id="onedayBudget">
	     					<li class="totalCost" id="totalCost1_0" data-tabid="1" data-itemid="0">
	     						<i class="fa fa-calendar" aria-hidden="true"></i>  Day 1
	     					</li>
	     				</ul>				
	     			</div>
	     			<div class="tab-pane" id="b-tab3">
	     				<ul class"tasks" id="famousPlace">
	     					<li class="famousPlace" id="famousPlace1_0" data-tabid="1" data-itemid="0">
	     						<i class="fa fa-camera" aria-hidden="true"></i>  관광지
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_1" data-tabid="1" data-itemid="1">
	     						<i class="fa fa-hospital-o" aria-hidden="true"></i>  숙박
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_2" data-tabid="1" data-itemid="2">
	     						<i class="fa fa-spoon" aria-hidden="true"></i>  음식점
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_3" data-tabid="1" data-itemid="3">
	     						<i class="fa fa-shopping-cart" aria-hidden="true"></i>  쇼핑
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_4" data-tabid="1" data-itemid="4">
	     						<i class="fa fa-gamepad" aria-hidden="true"></i>  오락
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_5" data-tabid="1" data-itemid="5">
	     						<i class="fa fa-futbol-o" aria-hidden="true"></i>  액티비티
	     					</li>
	     					<li class="famousPlace" id="famousPlace1_6" data-tabid="1" data-itemid="6">
	     						<i class="fa fa-bus" aria-hidden="true"></i>  교통
	     					</li>
	     				</ul>				
	     			</div>
	      		</div>
	      		<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	<!-- 체크리스트 모달 팝업 -->
	<div class="modal fade" id="checklistmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  	<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	      		<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<!-- 모달 제목 -->
						<h4 class="modal-title" id="myModalLabel">체크 리스트</h4>
	      		</div>
	      		<!-- 모달 안에 내용 넣기 -->
	     		<div class="modal-body">
	     			<div class="checklist">
	     				<div class="tab-pane plantab de" id="checklist">
	     					<div class="checklist">
	     						<!-- STR_START : checklist tab 목록 -->
	     						<ul class="nav checklist-tab" id="checklist-tab">
	     							<!-- 체크리스트 메뉴 -->
	     							<li id="tab-li" class="active" style="margin-right:0;">
	     								<a target="_self" href="#ch-tab1" class="btn mylist" data-toggle="tab" aria-expanded="true">My List</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab2" class="btn" data-toggle="tag">출국</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab3" class="btn" data-toggle="tag">해변여행</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab4" class="btn" data-toggle="tag">배낭여행</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab5" class="btn" data-toggle="tag">비상약</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab6" class="btn" data-toggle="tag">전자제품</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab7" class="btn" data-toggle="tag">세면도구</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab8" class="btn" data-toggle="tag">화장품</a>
	     							</li>
	     							<li id="tab-li">
	     								<a target="_self" href="#ch-tab9" class="btn" data-toggle="tag">스쿠버 장비</a>
	     							</li>
	     						</ul>
	     						<!-- 여기에 모달 안에 내용 쓰는 곳 --><!-- 각 버튼마다 나타나는 화면 정의 -->
	     						<div class="tab-content checklist-con" id="tab-content">
	     							<!-- My List -->
	     							<div class="tab-pane" id="ch-tab1">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="exp1">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i>
	     											<span> 완료한 아이템들은 체크 하세요!</span>
												</p>
											</li>
											<li class="new-list">
												<form>
													<input class="form-control" type="text" id="todoName" placeholder="새로운 체크리스트" maxlength="100">
													<button class="btn btn-primary" id="checklist-add-btn">추가</button>
												</form>
											</li>					     										
	     								</ul>
	     							</div>
	     							<!-- 출국 -->
	     							<div class="tab-pane active" id="ch-tab2">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="exp1">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i>
	     											<span>체크한 아이템들은 'My List'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all">
	     										<div class="task" id="checkAll" data-tabid="2">
	     											<input type="checkbox" id="checkAll2"><strong> ALL</strong><br />				
	     										</div>
	     									</li>
	     									<li>
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="0">     
	     											<input type="checkbox" id="todoItem2_0"> 여권(유효기간 확인)<br />
	     										</div>	     											
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="1">     
	     											<input type="checkbox" id="todoItem2_1"> 여권사본<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="2">
	     									      	<input type="checkbox" id="todoItem2_2"> 여권용 사진2매<br />
	     									    </div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="3">     
	     											<input type="checkbox" id="todoItem2_3"> 항공권  <br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="4">
	     										    <input type="checkbox" id="todoItem2_4"> 현지화폐(환전)  <br />
	     										</div>
	     									</li>
	     									<li>
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="5">
	     										    <input type="checkbox" id="todoItem2_5"> 비상금(원화,현지화폐) <br />
	     									    </div>
	     									</li>
	     									<li>
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="6">
	     										    <input type="checkbox" id="todoItem2_6"> 현지 비상연락처<br />
	     										</div>
	     									</li>
	     									<li>
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="7">
	     										    <input type="checkbox" id="todoItem2_7"> 숙박/투어 바우처<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="2" data-itemid="8">     
	     											<input type="checkbox" id="todoItem2_8"> 여행자보험<br />
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 해변여행 -->
	     							<div class="tab-pane" id="ch-tab3">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i>
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="3">   
	     											<input type="checkbox" id="todoItem3"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="0">     
	     											<input type="checkbox" id="todoItem3_0"> 자외선 차단제<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="1">     
	     											<input type="checkbox" id="todoItem3_1"> 수영복<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="2">     
	     											<input type="checkbox" id="todoItem3_2"> 선글라스<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="3"> 
	     											<input type="checkbox" id="todoItem3_3"> 모자<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="4">   
	     											<input type="checkbox" id="todoItem3_4"> 샌들 또는 아쿠아샌들<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="5">     
	     											<input type="checkbox" id="todoItem3_5"> 얇은 긴 소매 옷<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="6">     
	     											<input type="checkbox" id="todoItem3_6"> 비치타월/스포츠타월<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="3" data-itemid="7"> 
	     										    <input type="checkbox" id="todoItem3_7"> 방수팩<br />  
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 배낭여행 -->
	     							<div class="tab-pane" id="ch-tab4">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i>
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="4">   
	     											<input type="checkbox" id="todoItem4"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="0">     
	     											<input type="checkbox" id="todoItem4_0"> 배낭<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="1">     
	     											<input type="checkbox" id="todoItem4_1"> 운동화<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="2">     
	     											<input type="checkbox" id="todoItem4_2"> 샌달<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="3">     
	     											<input type="checkbox" id="todoItem4_3"> 물통<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="4">     
	     											<input type="checkbox" id="todoItem4_4"> 허리전대<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="5">     
	     											<input type="checkbox" id="todoItem4_5"> 휴대용 칼<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="6">     
	     											<input type="checkbox" id="todoItem4_6"> 나침반<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="7">     
	     											<input type="checkbox" id="todoItem4_7"> 실바늘<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="8">     
	     											<input type="checkbox" id="todoItem4_8"> 응급용품<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="9">     
	     											<input type="checkbox" id="todoItem4_9"> 손수건<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="10">     
	     											<input type="checkbox" id="todoItem4_10"> 우비<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="11">     
	     											<input type="checkbox" id="todoItem4_11"> 손톱깍이<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="12">     
	     											<input type="checkbox" id="todoItem4_12"> 망원경<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="13">     
	     											<input type="checkbox" id="todoItem4_13"> 다용도칼<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="14">     
	     											<input type="checkbox" id="todoItem4_14"> 미니가위<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="15">  
	     											<input type="checkbox" id="todoItem4_15"> 우산<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="16"> 
	     										   <input type="checkbox" id="todoItem4_16"> 머그컵<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="17">     
	     											<input type="checkbox" id="todoItem4_17"> 휴대용 버너<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="18">     
	     											<input type="checkbox" id="todoItem4_18"> 코펠<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="4" data-itemid="19">     
	     											<input type="checkbox" id="todoItem4_19"> 손거울<br /> 
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 비상약 -->
	     							<div class="tab-pane" id="ch-tab5">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i>
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="5"> 
	     											<input type="checkbox" id="todoItem5"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="0">     
	     											<input type="checkbox" id="todoItem5_0"> 종합 감기약<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="1">     
	     											<input type="checkbox" id="todoItem5_1"> 복합 연고제<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="2">     
	     											<input type="checkbox" id="todoItem5_2"> 파스<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="3">  
	     										    <input type="checkbox" id="todoItem5_3"> 일회용 밴드<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="4">  
	     											<input type="checkbox" id="todoItem5_4"> 소독약<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="5">
	     										    <input type="checkbox" id="todoItem5_5"> 두통약<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="6">     
	     											<input type="checkbox" id="todoItem5_6"> 소화제<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="7"> 
	     										    <input type="checkbox" id="todoItem5_7"> 지사제<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="8">  
	     										    <input type="checkbox" id="todoItem5_8"> 여성용품<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="9">
	     										    <input type="checkbox" id="todoItem5_9"> 복용중인 약(처방)<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="5" data-itemid="10">
	     										    <input type="checkbox" id="todoItem5_10"> 아스피린<br />  
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 전자제품 -->
	     							<div class="tab-pane" id="ch-tab6">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i> 
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="6">   
	     											<input type="checkbox" id="todoItem6"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="0">     
	     											<input type="checkbox" id="todoItem6_0"> 카메라<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="1">     
	     											<input type="checkbox" id="todoItem6_1"> 배터리/충전기/메모리<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="2">     
	     											<input type="checkbox" id="todoItem6_2"> 리더기<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="3">     
	     											<input type="checkbox" id="todoItem6_3"> 고용량 USB(백업용)<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="4">     
	     											<input type="checkbox" id="todoItem6_4"> 노트북 또는 랩톱<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="6" data-itemid="5">     
	     											<input type="checkbox" id="todoItem6_5"> 멀티어댑터<br />  
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 세면도구 -->
	     							<div class="tab-pane" id="ch-tab7">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i> 
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="7">   
	     											<input type="checkbox" id="todoItem7"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="0">     
	     											<input type="checkbox" id="todoItem7_0"> 치약<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="1">     
	     											<input type="checkbox" id="todoItem7_1"> 칫솔<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="2">     
	     											<input type="checkbox" id="todoItem7_2"> 수건<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="3">     
	     											<input type="checkbox" id="todoItem7_3"> 샴푸<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="4">     
	     											<input type="checkbox" id="todoItem7_4"> 린스<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="5">     
	     											<input type="checkbox" id="todoItem7_5"> 면도기<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="7" data-itemid="6">     
	     											<input type="checkbox" id="todoItem7_6"> 거품비누<br /> 
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 화장품 -->
	     							<div class="tab-pane" id="ch-tab8">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i> 
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="8">   
	     											<input type="checkbox" id="todoItem8"><strong> ALL</strong><br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="0">     
	     											<input type="checkbox" id="todoItem8_0">스킨로션<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="1">     
	     											<input type="checkbox" id="todoItem8_1">헤어로션<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="2">     
	     											<input type="checkbox" id="todoItem8_2">바디로션<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="3">     
	     											<input type="checkbox" id="todoItem8_3">화장솜<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="4">     
	     											<input type="checkbox" id="todoItem8_4">마스크팩<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="5">     
	     											<input type="checkbox" id="todoItem8_5">빗<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="6">     
	     											<input type="checkbox" id="todoItem8_6">면봉<br />
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="7">
	     										    <input type="checkbox" id="todoItem8_7">화장클렌저<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="8" data-itemid="8">  
	     											<input type="checkbox" id="todoItem8_8">클렌징 티슈<br />
	     										</div>
	     									</li>
	     								</ul>
	     							</div>
	     							<!-- 스쿠버 장비 -->
	     							<div class="tab-pane" id="ch-tab9">
	     								<ul class="tasks"  id="checklist-tab">
	     									<li class="expl">
	     										<p>
	     											<i class="fa fa-check" aria-hidden="true"></i> 
	     											<span>체크한 아이템들은 'My list'에서 볼 수 있습니다.</span>
	     										</p>
	     									</li>
	     									<li class="all" id="all"> 
	     										<div class="task " id="checkAll" data-tabid="9">   
	     											<input type="checkbox" id="todoItem9"><strong> ALL</strong><br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="0">     
	     											<input type="checkbox" id="todoItem9_0"> 마스크와 스노클<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="1">     
	     											<input type="checkbox" id="todoItem9_1"> 로그북<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="2">    
	     											<input type="checkbox" id="todoItem9_2"> 감압표<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="3">     
	     											<input type="checkbox" id="todoItem9_3"> 호흡기 셋트<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="4">     
	     											<input type="checkbox" id="todoItem9_4"> 부력자켓<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="5">     
	     											<input type="checkbox" id="todoItem9_5"> 웻슈트<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="6">  
	     										    <input type="checkbox" id="todoItem9_6"> 드라이슈트<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="7">     
	     											<input type="checkbox" id="todoItem9_7"> 다이빙 부츠<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="8">     
	     											<input type="checkbox" id="todoItem9_8"> 오리발<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="9">     
	     											<input type="checkbox" id="todoItem9_9"> 다이빙 랜턴<br />  
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="10">  
	     											<input type="checkbox" id="todoItem9_10"> 다이빙 칼<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="11">  
	     											<input type="checkbox" id="todoItem9_11"> 다이빙 컴퓨터, 시계<br /> 
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="12">     
	     											<input type="checkbox" id="todoItem9_12"> 수중 카메라 하우징<br />   
	     										</div>
	     									</li>
	     									<li>  
	     										<div class="task " id="todoItem" data-tabid="9" data-itemid="13">
	     										    <input type="checkbox" id="todoItem9_13"> 액세서리(장갑, 후드,SMB,슬레이트,쉐이커, 포인터,릴,김서림 방지제)<br />  
	     										</div>
	     									</li>
	     								</ul>
	     							</div>		
	     						</div>						
	     					</div>
 	     				</div>
	     			</div>
	     		</div>
	     		<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
	      		</div>
	     	</div>   				
		</div>	
	</div>
		</div>
		<!-- 왼쪽 그룹 끝 -->
		
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
	<!-- 오른쪽 그룹 끝 -->
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <div class="budget">
	<ul id="budget-tab" class="nav nav-pills" role="tablist">
	  <li id="b-tab-li" role="presentation" class="active"><a data-target="#b-tab1" id="b-tab1-tab" role="tab" data-toggle="tab" aria-controls="b-tab1" aria-expanded="true">전체 비용</a></li>
	  <li id="b-tab-li" role="presentation" class=""><a data-target="#b-tab2" role="tab" id="b-tab2-tab" data-toggle="tab" aria-controls="b-tab2" aria-expanded="false">일일 지출</a></li>
	  <li id="b-tab-li" role="presentation" class=""><a data-target="#b-tab3" role="tab" id="b-tab3-tab" data-toggle="tab" aria-controls="b-tab3" aria-expanded="false">방문 명소</a></li>
	</ul>
	<!-- 각 탭을 눌렀을 때 동작하는 내용 -->
	<div id="budgetTab" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="b-tab1" aria-labelledby="b-tab1-tab">
	    <ul class="tasks" id="totalCost">
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
	  <div role="tabpanel" class="tab-pane fade" id="b-tab2" aria-labelledby="b-tab2-tab">
	      <ul class="tasks" id="b-tab2-ul">
	     	  <li class="totalCost" id="totalCost1_0" data-tabid="1" data-itemid="0">
	       		  <i class="fa fa-calendar" aria-hidden="true"></i>  Day 1
	      	  </li>
	      </ul>
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="b-tab3" aria-labelledby="b-tab3-tab">
	  	  <ul class="tasks" id="b-tab3-ul">
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
</div>
</body>
</html>
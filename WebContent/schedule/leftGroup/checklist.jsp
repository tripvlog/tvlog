<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="checklist">
	<ul id="checklist-tab" class="nav nav-pills" role="tablist">
	  <li id="ch-tab-li" role="presentation" class="active"><a data-target="#ch-tab1" id="ch-tab1-tab" role="tab" data-toggle="tab" aria-controls="ch-tab1" aria-expanded="true">My List</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab2" role="tab" id="ch-tab2-tab" data-toggle="tab" aria-controls="ch-tab2" aria-expanded="false">출국</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab3" role="tab" id="ch-tab3-tab" data-toggle="tab" aria-controls="ch-tab3" aria-expanded="false">해변여행</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab4" role="tab" id="ch-tab4-tab" data-toggle="tab" aria-controls="ch-tab4" aria-expanded="false">배낭여행</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab5" role="tab" id="ch-tab5-tab" data-toggle="tab" aria-controls="ch-tab5" aria-expanded="false">비상약</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab6" role="tab" id="ch-tab6-tab" data-toggle="tab" aria-controls="ch-tab6" aria-expanded="false">전자제품</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab7" role="tab" id="ch-tab7-tab" data-toggle="tab" aria-controls="ch-tab7" aria-expanded="false">세면도구</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab8" role="tab" id="ch-tab8-tab" data-toggle="tab" aria-controls="ch-tab8" aria-expanded="false">화장품</a></li>
	  <li id="ch-tab-li" role="presentation" class=""><a data-target="#ch-tab9" role="tab" id="ch-tab9-tab" data-toggle="tab" aria-controls="ch-tab9" aria-expanded="false">스쿠버 장비</a></li>
	</ul>
	<div id="checklistTab" class="tab-content">
	  <!-- My List -->
	  <div role="tabpanel" class="tab-pane fade active in" id="ch-tab1" aria-labelledby="ch-tab1-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab2" aria-labelledby="ch-tab2-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab3" aria-labelledby="ch-tab3-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab4" aria-labelledby="ch-tab4-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab5" aria-labelledby="ch-tab5-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab6" aria-labelledby="ch-tab6-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab7" aria-labelledby="ch-tab7-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab8" aria-labelledby="ch-tab8-tab">
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
	  <div role="tabpanel" class="tab-pane fade" id="ch-tab9" aria-labelledby="ch-tab9-tab">
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
</body>
</html>
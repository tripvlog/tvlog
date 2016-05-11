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
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/tvlog/schedule/schedule.js"></script>
<title>트립블로그</title>
</head>
<body>
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
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#famousplace"><i class="fa fa-map-marker" aria-hidden="true"></i> 방문명소</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#budget"><i class="fa fa-krw" aria-hidden="true"></i> 여행가계부</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#checklist"><i class="fa fa-check-square-o" aria-hidden="true"></i> 체크리스트</button>
			</div>

<!-- 방문명소 Modal -->
<div class="modal fade" id="famousplace" tabindex="-1" role="dialog" aria-labelledby="famousplaceModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="famousplaceModalLabel">방문 명소</h4>
      </div>
      <div class="modal-body">
       <!-- 모달내용 -->
       
      <!-- 탭시작 -->
       <jsp:include page="leftGroup/famousplace.jsp" />
       <!-- 탭 끝 --> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- 가계부 Modal -->
<div class="modal fade" id="budget" tabindex="-1" role="dialog" aria-labelledby="budgetModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="budgetModalLabel">여행 가계부</h4>
      </div>
      <div class="modal-body">
       <!-- 모달내용 -->
       
      <!-- 탭시작 -->
      <jsp:include page="leftGroup/budget.jsp" />
       <!-- 탭 끝 -->    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- 체크리스트 Modal -->
<div class="modal fade" id="checklist" tabindex="-1" role="dialog" aria-labelledby="checklistModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="checklistModalLabel">체크 리스트</h4>
      </div>
      <div class="modal-body">
       <!-- 모달내용 -->
       
      <!-- 탭시작 -->
       <jsp:include page="leftGroup/checklist.jsp" /> 
       <!--  탭 끝 -->    
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
				<div class="col-md-2" id="tripstart"><b>여행시작</b></div>
				<div class="col-md-1"><b>일</b></div>
				<div class="col-md-1"><b>명</b></div>
				<div class="col-md-2"><b>여행단계</b></div>
				<div class="col-md-6"><b>여행테마</b></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
				<div class="col-md-1"></div>
			</div>
			<div class="row" id="startschedule">
				<div class="col-md-2" id="tripstart"><input id="tourStartDay" type="date" name="date" class="form-control hasDatepicker"  size="10"/></div>
				<div class="col-md-1"><input type="number" name="count" id="count" value="1" onchange="test()" min="1" class="form-control"/></div>
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
	<!-- 지도 시작 -->
	<br />
	<jsp:include page="schedule-map.jsp" /> 
	<br />
	<!-- 지도 끝 -->

		<!-- 지도/일정표의 테이블 -->
	    <div class="tableContainer">
			<form method=post action="">
			
			<p></p>
			<table id='stock_table' class="table table-bordered" border="2">
				<tr><td width="100" >ALL</td><td>&nbsp;</td></tr>

				<c:forEach var="i" begin="1" end="24" step="1" varStatus="k">
					<tr><td rowspan="2">${i}시</td><td  id="1_${i}" onmouseover="aa(${i});" onmouseout="bb(${i});"><i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${i}"></i></td></tr>
	   				<tr><td onmouseover="aa(${i}${i});" onmouseout="bb(${i}${i});"  id="1_${i}_30"><i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${i}${i}"></i></td></tr>
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

<!-- 세부일정 등록  -->
	<div class="modal fade" id="detail-craete" tabindex="-1" role="dialog" aria-labelledby="detail-craete" aria-hidden="true">
    		<div class="modal-dialog" >
    		<div class="modal-content" id="modalSize">
      		<div class="modal-header" >
		    	<form action="/tvlog/schedule/schedule-detail.trip" method="post">
				<div class="panel panel-success" >
					<div class="trf-detail">
						<div class="from-to">
							<div class="from-to-fl transport-from-div">
								<label for="from_0">출발지</label>
								<input type="text" id="from_0" class="form-control transport-from-input" data-idx="0" value="">
							</div>
							<i class="fa fa-arrow-right"></i>
							<div class="from-to-fl transport-to-div">
								<label for="to_0" style="width:53px;">도착지</label>
								<input type="text" id="to_0" class="form-control transport-to-input" data-idx="0" value="">
							</div>
						</div>
						<div class="memo">
							<label for="memo">메모</label>
							<input type="text" id="memo_0" class="form-control transport-memo-input" value="">
						</div>
						<div class="detail-cost">
							<label for="budget">비용</label>
							<input type="text" id="budget" class="form-control transport-cost-input" value="0" maxlength="13" style="text-align: right;">
							<select class="currency-select transport-currency-select form-control">
								<option value="2">USD(미국)</option>
								<option value="1" selected="selected">KRW(한국)</option>
								<option value="0">EUR(유럽연합)</option>
									<option value="3">JPY(일본)</option>
									<option value="4">CNY(중국)</option>
									<option value="5">HKD(홍콩)</option>
									<option value="6">TWD(대만)</option>
									<option value="7">GBP(영국)</option>
									<option value="8">CAD(캐나다)</option>
									<option value="9">CHF(스위스)</option>
									<option value="10">SEK(스웨덴)</option>
									<option value="11">AUD(호주)</option>
									<option value="12">NZD(뉴질랜드)</option>
									<option value="13">CZK(체코)</option>
									<option value="14">TRY(터키)</option>
									<option value="15">MNT(몽골)</option>
									<option value="16">ILS(이스라엘)</option>
									<option value="17">DKK(덴마크)</option>
									<option value="18">NOK(노르웨이)</option>
									<option value="19">SAR(사우디아라비아)</option>
									<option value="20">KWD(쿠웨이트)</option>
									<option value="21">BHD(바레인)</option>
									<option value="22">AED(아랍에미리트)</option>
									<option value="23">JOD(요르단)</option>
									<option value="24">EGP(이집트)</option>
									<option value="25">THB(태국)</option>
									<option value="26">SGD(싱가포르)</option>
									<option value="27">MYR(말레이시아)</option>
									<option value="28">IDR(인도네시아)</option>
									<option value="29">QAR(카타르)</option>
									<option value="30">KZT(카자흐스탄)</option>
									<option value="31">BND(브루나이)</option>
									<option value="32">INR(인도)</option>
									<option value="33">PKR(파키스탄)</option>
									<option value="34">BDT(방글라데시)</option>
									<option value="35">PHP(필리핀)</option>
									<option value="36">MXN(멕시코)</option>
									<option value="37">BRL(브라질)</option>
									<option value="38">VND(베트남)</option>
									<option value="39">ZAR(남아프리카 공화국)</option>
									<option value="40">RUB(러시아)</option>
									<option value="41">HUF(헝가리)</option>
									<option value="42">PLN(폴란드)</option>
								</select>
							</div>
							<div class="memo">
								<input type="button" id="save" class="btn btn-success" data-dismiss="modal" value="저장하기" onclick="detailSave()">
								<input type="button" id="cancle" class="btn btn-cancle" value="취소">
							</div>
						</div>
					</div>
				</form>
			</div>
			</div>
			</div>
		</div>
</body>
</html>
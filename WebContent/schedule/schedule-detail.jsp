<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Bootstrap Uses a fixed left sidebar, that attaches after scrolling past a large top header. example snippet for Bootstrap." />

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="/tvlog/schedule/schedule.js"></script>

<script type="text/javascript">
	var objTd;
	function korea(id,icon){
		objTd = icon.parentNode;		
	}	

	
	$(document).ready(function() {
		var $body = $(document.body);
		var navHeight = $('.navbar').outerHeight(true) + 10;

		$body.scrollspy({
			target : '#leftCol',
			offset : navHeight
		});

	});
	
	
	 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
         (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
         m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
         })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
         ga('create', 'UA-40413119-1', 'bootply.com');
         ga('send', 'pageview');
</script>

<title>트립블로그</title>
</head>
<body>
<div class="container" id="container">
	<header class="navbar navbar-bright navbar-fixed-top" role="banner" id="top-banner">
		<div class="container">
			<div class="navbar-header">
				<!-- 상단 메뉴 시작 -->
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"></button>
							<a class="navbar-brand" href="#">Trip Blog</a>
						
							<ul class="nav navbar-nav">
								<li class="#about"><a href="#" id="navlink">여행일정 찾기</a></li>
								<li class="#about"><a href="#" id="navlink">명소 찾기</a></li>
								<li class="#about"><a href="#" id="navlink">커뮤니티</a></li>
								<li class="#about"><a href="#" id="navlink" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">일정 만들기</a></li>
								<li class="#about"><a href="#"></a>
							</ul>
				<!-- 상단 메뉴 끝 -->
			</div>
		</div>
	</header>
	<!-- 여행 일정 제목 들어갈 곳 -->
	<div id="masthead">
		<h1>${dto.s_title}</h1>
	</div>
	<!-- -----------일정만들기 --- 모달 시작 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content" id="modalSize">
							<div class="modal-header">
								<form action="" method="post">
									<div class="panel panel-success">
										<div class="panel-heading">
											<h3>
												새 일정 만들기
												</h2>
										</div>
										<div class="panel-body">
											<h4>여행 제목</h4>
											<input type="text" name="subject" class="form-control" placeholder="예 : 5박 6일 유럽 명소여행" />
										</div>
										<div class="panel-body">
											<h4>여행 단계</h4>
											<input type="radio" name="step" />여행 전 
											<input type="radio" name="step" />여행 후
										</div>
										<div class="panel-body" id="date">
											<h4>여행 시작날짜</h4>
											<input type="date" name="date" class="form-control hasDatepicker" size="10" />
										</div>
										<div class="panel-body">
											<h4>여행 테마</h4>
											<input type="checkbox" value="theme" /> 나홀로여행
											<input type="checkbox" value="theme" /> 친구와 함께 
											<input type="checkbox" value="theme" /> 가족과 함께 
											<input type="checkbox" value="theme" /> 단체여행 
											<input type="checkbox" value="theme" /> 패키지 여행 
											<input type="checkbox" value="theme" /> 커플
										</div>
										<div class="panel-body">
											<input type="submit" value="새 일정 만들기" class="btn btn-success" />
											<input type="button" value="취소" class="btn btn-warning" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- -----------일정만들기 --- 모달 끝 -->
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
		<form action="/tvlog/schedule/schedule-update.trip" method="post" class="plan-intro" align="left" name="scheduleUpdate" > 
			<input type="hidden" name="s_num" value="${dto.s_num}" />
		<div class="container-fluid" id="container-fluid">
			<div class="row" id="row1">
				<input type="text" id="planMessage" name="s_info" class="form-control plan-brief" placeholder="일정에 대한 간단한 설명" maxlength="300" value="" />
         	</div>
         	<div class="row" id="row2">
         		<br /><textarea class="form-control"  name="s_content" id="planDetailMessage" placeholder="일정에 대한 자세한 설명"  maxlength="20000"></textarea>
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
				<div class="col-md-2" id="tripstart"><input id="tourStartDay" type="date" name="s_startday" value="${dto.s_startday}" class="form-control hasDatepicker"  size="10"/></div>
				<div class="col-md-1"><input type="number" name="s_endday" id="count" value="1" onchange="test()" min="1" class="form-control"/></div>
				<div class="col-md-1"><input type="number"  name="s_membercount" class="form-control" min="1" value="1" id="persons" /></div>
				<div class="col-md-2">
					<c:if test="${dto.s_step == 0 }">
							<input type="radio" name="s_step" value="0" checked />여행 전 
							<input type="radio" name="s_step" value="1" />여행 후
					</c:if>
					<c:if test="${dto.s_step == 1 }">
							<input type="radio" name="s_step" value="0" />여행 전 
							<input type="radio" name="s_step" value="1" checked />여행 후
					</c:if>
				</div>
				<div class="col-md-6">
					<c:forTokens var="theme" items="${dto.s_theme}" delims=",">
						<input type="checkbox" value="${theme}" name="s_theme" checked /> 나홀로여행
					</c:forTokens>
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
	<iframe src="/tvlog/schedule/schedule-map.jsp" name="map" width="940" height="410" ALLOWTRANSPARENCY="false"frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	<br />
	<!-- 지도 끝 -->
	
		<!-- 지도/일정표의 테이블 -->
	    <div class="tableContainer">
			<form method=post action="">
			
			<p></p>
			<table id='stock_table' class="table table-bordered" border="2">
				<tr><td width="100" >ALL</td><td>&nbsp;</td></tr>

				<c:forEach var="i" begin="1" end="24" step="1" varStatus="k">
					<tr><td rowspan="2">${i}시</td><td  id="1_${i}" onmouseover="aa(${i});" onmouseout="bb(${i});">
						<i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${i}" whatever="1_${i}" data-toggle="modal" data-target="#detail-create"></i>
						</td>
					</tr>
	   				<tr><td onmouseover="aa(${i}${i});" onmouseout="bb(${i}${i});"  id="1_${i}_30">
	   						<i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${i}${i}" whatever="1_${i}_30" data-toggle="modal" data-target="#detail-create" onclick="korea('1_${i}_30',this);"></i>
	   					</td>
	   				</tr>
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
	<!-- 모달 팝업 -->
		<div class="modal fade" id="detail-create" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h class="modal-title" id="myModalLabel">Modal title</h6>
					</div>
					<!-- 모달 내용 -->
					<div class="modal-body">
						<!-- 탭 시작 -->
						<div class="container2">
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a
									data-target="#transport" id="transport-tab" role="tab"
									data-toggle="tab" aria-controls="home" aria-expanded="true">교통</a></li>
								<li role="presentation" class=""><a data-target="#place"
									role="tab" id="place-tab" data-toggle="tab"
									aria-controls="profile" aria-expanded="false">장소</a></li>
								<li role="presentation" class=""><a data-target="#memo"
									role="tab" id="memo-tab" data-toggle="tab"
									aria-controls="profile" aria-expanded="false">메모</a></li>
							</ul>
							
							<div id="myTabContent" class="tab-content">
								<!-- 교통 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade active in" id="transport" aria-labelledby="transport-tab">
								<form action="" method="post">
								<br />
								<div id="row22">
									<div class="col-md-20" >
										<ul id="transportUl">
											<li id="transportLi"><button id="btn1" onclick="btnicon1()"><i class="fa fa-plane fa-2x" aria-hidden="true"></i><br/>비행기</button></li>
											<li id="transportLi"><button id="btn2" onclick="btnicon2()"><i class="fa fa-train fa-2x" aria-hidden="true"></i><br/>기  차</button></li>
											<li id="transportLi"><button id="btn3" onclick="btnicon3()"><i class="fa fa-subway fa-2x" aria-hidden="true"></i><br/>지하철</button></li>
											<li id="transportLi"><button id="btn4" onclick="btnicon4()"><i class="fa fa-bus fa-2x" aria-hidden="true"></i><br/>버  스</button></li>
											<li id="transportLi"><button id="btn5" onclick="btnicon5()"><i class="fa fa-road fa-2x" aria-hidden="true"></i><br/>도  보</button></li>
											<li id="transportLi"><button id="btn6" onclick="btnicon6()"><i class="fa fa-taxi fa-2x" aria-hidden="true"></i><br/>택  시</button></li>
											<li id="transportLi"><button id="btn7" onclick="btnicon7()"><i class="fa fa-ship fa-2x" aria-hidden="true"></i><br/> 배 </button></li>
											<li id="transportLi"><button id="btn8" onclick="btnicon8()"><i class="fa fa-car fa-2x" aria-hidden="true"></i><br/>자가용</button></li>
											<li id="transportLi"><button id="btn9" onclick="btnicon9()"><i class="fa fa-bicycle fa-2x" aria-hidden="true"></i><br/>기  타</button></li>
										</ul>
									</div>
								<div id="row33">
									<div class="col-md-20">
											<div class="trf-fields">
												<fieldset id="transport-fieldset-0">
													<div class="trf-detail">
															<table width="550" height="200" align="center">
																<tr>
																	<td id="btnicon"></td>
																	<td>출발지 <input type="text" id="from_0" class="form-control transport-from-input" value="" style="width: 95%;"></td>
																	<td>도착지 <input type="text" id="to_0" class="form-control transport-to-input" value=""style="width: 95%;"></td>
																</tr>
																<tr>
																	<td>메모</td>
																	<td colspan="2"><input type="text" id="memo_0"
																		class="form-control transport-memo-input" value="" style="width:98%;"></td>
																</tr>
																<tr>
																	<td>비용</td>
																	<td><input type="text" id="budget" class="form-control transport-cost-input" value="0" maxlength="13" style="text-align:right;width:95%"></td>
																	<td><select class="currency-select transport-currency-select form-control" style="width:95%">
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
																	</td>
																</tr>
															</table>
														</div>
												</fieldset>
											</div>
										</div>
								</div>
							</div>
							<br />
							<input type="submit" class="btn btn-success" value="저장">
							</form>	
								</div>
								<!-- 교통 탭 끝 -->

								<!-- 장소 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade" id="place" aria-labelledby="place-tab">
								<form action="" method="post">	<br />
									<iframe src="/tvlog/schedule/schedule-detail-select-map.jsp" name="map" width="570" height="405" ALLOWTRANSPARENCY="false"></iframe> 
									<div id="mylocation"></div>
									<br />
									<input type="submit" class="btn btn-success" value="저장">
								</form>
								</div>
								<!-- 장소 탭 끝 -->

								<!-- 메모 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade" id="memo" aria-labelledby="memo-tab">
								<form action="" method="post">	
									<br />
									<div class="row" id="row2">
         								<textarea class="form-control"  id="memo" placeholder="메모를 입력하세요"  maxlength="20000"></textarea>
         								<br />
									</div>
									<input type="submit" class="btn btn-success" value="저장">
								</form>
								</div>
								<!-- 메모 탭 끝 -->
							</div>
							<!-- 탭 끝 -->
						</div>
						<!-- 모달 내용 끝 -->
				</div>
			</div>
		</div>
		<!-- 모달 끝 -->
</body>
</html>
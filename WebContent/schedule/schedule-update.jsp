<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
	#navlink:hover{
    	color : #6B9900;
    	font-weight : bold;
    	font-size : 120%;
    }		
	body { padding-top: 2px; }
	#content{ width: 1200px; }
</style>
<script type="text/javascript">
	var objTd;
	function korea(id,icon){
		objTd = icon.parentNode;		
	}	
	
	function detailSave(form){
		tdid = objTd.getAttribute('id');
		 $.ajax({
	 	        type: "post",
	 	        url : "/tvlog/schedule/schedule-detail-transport.trip",
	 	       data: {	// url 페이지도 전달할 파라미터
	 	    	    sd_tdid : tdid, 
	 	    	    s_num : $('#s_num').val(),
	 	    	    sd_status : $('#sd_status').val(),
	 	    	    sd_startpoint : $('#from_0').val(),
		        	sd_endpoint  : $('#to_0').val(),
		        	sd_memo  : $('#memo_0').val(),
		        	sd_budget  : $('#money').val(),
		        	sd_budgetselect : $('#budgetselect').val(),
		        	sd_transport : $('#selectTransport').val()
		        },
	 	        success: success,	// 페이지요청 성공시 실행 함수
	 	        error: whenError	//페이지요청 실패시 실행함수
	      	});	
	}
	function success(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
		objTd.innerHTML=aaa;
        
    }
    function whenError(){
        alert("Error");
    }
	
    
    function detailMapSave(){
    	tdid = objTd.getAttribute('id');
		 $.ajax({
	 	        type: "post",
	 	        url : "/tvlog/schedule/schedule-detail-Map.trip",
	 	        data: {	// url 페이지도 전달할 파라미터
	 	    	    sd_tdid : tdid, 
	 	    	    s_num : $('#s_num').val(),
	 	    	   	sd_startpoint : $('#placename').val(),
	 	    	    sd_status : $('#sd_status1').val(),
		        	sd_map : $('#latlng').val()
		        },
	 	        success: success,	// 페이지요청 성공시 실행 함수
	 	        error: whenError	//페이지요청 실패시 실행함수
	      	});	
    }
    
    
    function detailpopup(sd_num){
    	 url = "/tvlog/schedule/schedule-detail-updatepopup.trip?sd_num="+sd_num;
         // 새로운 윈도우를 엽니다.
         open(url, "schedule-detail-updatepopup", 
         "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=750, height=600");
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
<body >
<jsp:include page="/main/header.jsp" />
<div class="container" id="container">
	
	<!-- 여행 일정 제목 들어갈 곳 -->
	<div id="masthead">
		<p>${dto.s_title}</p>
	</div>
	<!-- -----------일정만들기 --- 모달 시작 -->

	<!-- -----------일정만들기 --- 모달 끝 -->
&nbsp;
	<div class="row" id="containerTwo">
		<!-- 왼쪽 버튼 그룹 - 저장, 방문명소 -->
		<div class="col-md-2" id="savecontainer">
			<div id="btn-group" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg" id="scheduleSave" style="WIDTH:81pt" onclick="scheduleSave()"><i class="fa fa-floppy-o" aria-hidden="true"></i><center> 저장하기</center></button>
				<button type="button" class="btn btn-default btn-lg" style="WIDTH:55pt" onclick="window.location='/tvlog/schedule/schedule-content.trip?s_num=${dto.s_num}'"><i class="fa fa-times" aria-hidden="true"></i><center> 취소</center></button>
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
				<input type="text" id="planMessage" name="s_info" class="form-control plan-brief" placeholder="일정에 대한 간단한 설명" maxlength="300" value="${dto.s_info}" />
         	</div>
         	<div class="row" id="row2">
         		<br /><textarea class="form-control"  name="s_content" id="planDetailMessage" placeholder="일정에 대한 자세한 설명"  maxlength="20000">${dto.s_content}</textarea>
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
				<div class="col-md-2" id="tripstart"><input id="tourStartDay" type="date" name="s_startday" value="${dto.s_startday}" class="form-control hasDatepicker"  size="10"/>	</div>
				<div class="col-md-1"><input type="number" name="s_endday" id="count" value="${dto.s_endday}" onchange="test()" min="1" class="form-control"/></div>
				<div class="col-md-1"><input type="number"  name="s_membercount" class="form-control" min="1" value="${dto.s_membercount }" id="persons" /></div>
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
				<tr><td width="100" >ALL</td><td>1 Day</td>
					<c:forEach var="i" begin="2" end="${dto.s_endday}" step="1" varStatus="k">
						<td>${i} Day</td>
					</c:forEach>
				</tr>

				<c:forEach var="i" begin="1" end="24" step="1" varStatus="k">
					<tr><td rowspan="2">${i}시</td>
						<c:forEach var="j" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
							<td  id="${j}_${i}" onmouseover="aa(${j},${i});" onmouseout="bb(${j},${i});">
								<c:set var="tdid" value="${j}_${i}" />
								<c:set var="doneLoop" value="false" />
								<c:forEach items="${detaillist}" var="detailDTO" varStatus="status">
									<c:if test="${not doneLoop}"> 
										<c:if  test="${detailDTO.sd_tdid ==  tdid}">
											<div id="detail-content" onclick="detailpopup('${detailDTO.sd_num}')">
												<c:if test="${detailDTO.sd_status == 0}">
													${detailDTO.sd_startpoint}
													<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
										    		${detailDTO.sd_endpoint} <br /> 
									    		</c:if>
									    		<c:if test="${detailDTO.sd_status == 1}">
													지도 : ${detailDTO.sd_map}
									    		</c:if>
									    		<c:if test="${detailDTO.sd_status == 2}">
													메모 : ${detailDTO.sd_memo}
									    		</c:if>
								    		</div>
											<c:set var="doneLoop" value="true"/> 
										</c:if>
									</c:if>
								</c:forEach>
								<c:if test="${not doneLoop}"> 		
									<i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${j}${i}" whatever="${j}_${i}" data-toggle="modal" data-target="#detail-create" onclick="korea('${j}_${i}',this);"></i>
									<c:set var="doneLoop" value="false"/> 
								</c:if>
							</td>
						</c:forEach>
					</tr>
	   				<tr>
	   				<c:forEach var="j" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
		   				<td id="${j}_${i}_30" onmouseover="aa(${j},${i}${i});" onmouseout="bb(${j},${i}${i});"  >
		   						<c:set var="tdid" value="${j}_${i}_30" />
		   						<c:set var="doneLoop" value="false" />
								<c:forEach items="${detaillist}" var="detailDTO" varStatus="status">
									<c:if test="${not doneLoop}"> 
										<c:if  test="${detailDTO.sd_tdid ==  tdid}">
											<div id="#detail-content" onclick="detailpopup('${detailDTO.sd_num}')">
												<c:if test="${detailDTO.sd_status == 0}">
													${detailDTO.sd_startpoint}
													<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
										    		${detailDTO.sd_endpoint} <br /> 
									    		</c:if>
									    		<c:if test="${detailDTO.sd_status == 1}">
													지도 : ${detailDTO.sd_map}
									    		</c:if>
									    		<c:if test="${detailDTO.sd_status == 2}">
													메모 : ${detailDTO.sd_memo}
									    		</c:if>
								    		</div>
											<c:set var="doneLoop" value="true"/> 
										</c:if>
									</c:if>
								</c:forEach>
								<c:if  test="${not doneLoop}">
									<i class="fa fa-plus-circle" aria-hidden="true" style="visibility:hidden;" id="plus${j}${i}${i}" whatever="${j}_${i}_30" data-toggle="modal" data-target="#detail-create" onclick="korea('${j}_${i}_30',this);"></i>
									<c:set var="doneLoop" value="false"/> 
								</c:if>
		   					</td>
		   				</c:forEach>
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
								<li role="presentation" class="active"><a data-target="#transport" id="transport-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">교통</a></li>
								<li role="presentation" class=""><a data-target="#place" role="tab" id="place-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">장소</a></li>
								<li role="presentation" class=""><a data-target="#memo" role="tab" id="memo-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">메모</a></li>
							</ul>
							
							<div id="myTabContent" class="tab-content">
								<!-- 교통 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade active in" id="transport" aria-labelledby="transport-tab">
								<form action="/tvlog/schedule/schedule-detail-time.trip" method="post">
								<input type="hidden" id="s_num" name="s_num" value="${dto.s_num}" />
								<input type="hidden" id="sd_status" name="sd_status" value="0" />
								<br />
								<div id="row22">
									<div class="col-md-20" >
										<ul id="transportUl">
											<li id="transportLi"><i id="btn1" onclick="btnicon1('fa fa-plane fa-2x')" class="fa fa-plane fa-2x" aria-hidden="true"></i><br/>비행기</li>
											<li id="transportLi"><i id="btn2" onclick="btnicon2('fa fa-train fa-2x')" class="fa fa-train fa-2x" aria-hidden="true"></i><br/>기  차</li>
											<li id="transportLi"><i id="btn3" onclick="btnicon3('fa fa-subway fa-2x')" class="fa fa-subway fa-2x" aria-hidden="true"></i><br/>지하철</li>
											<li id="transportLi"><i id="btn4" onclick="btnicon4('fa fa-subway fa-2x')" class="fa fa-subway fa-2x" aria-hidden="true"></i><br/>버  스</li>
											<li id="transportLi"><i id="btn5" onclick="btnicon5('fa fa-road fa-2x')" class="fa fa-road fa-2x" aria-hidden="true"></i><br/>도  보</li>
											<li id="transportLi"><i id="btn6" onclick="btnicon6('fa fa-taxi fa-2x')" class="fa fa-taxi fa-2x" aria-hidden="true"></i><br/>택  시</li>
											<li id="transportLi"><i id="btn7" onclick="btnicon7('fa fa-ship fa-2x')" class="fa fa-ship fa-2x" aria-hidden="true"></i><br/>&nbsp; 배 </li>
											<li id="transportLi"><i id="btn8" onclick="btnicon8('fa fa-car fa-2x')" class="fa fa-car fa-2x" aria-hidden="true"></i><br/>자가용</li>
											<li id="transportLi"><i id="btn9" onclick="btnicon9('fa fa-bicycle fa-2x')" class="fa fa-bicycle fa-2x" aria-hidden="true"></i><br/>기  타</li>
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
																	<td>출발지 <input type="text" id="from_0" name="sd_startpoint" class="form-control transport-from-input" value="" style="width: 95%;"></td>
																	<td>도착지 <input type="text" id="to_0" name="sd_endpoint" class="form-control transport-to-input" value=""style="width: 95%;"></td>
																</tr>
																<tr>
																	<td>메모</td>
																	<td colspan="2"><input type="text" id="memo_0" name="sd_memo" class="form-control transport-memo-input" value="" style="width:98%;"></td>
																</tr>
																<tr>
																	<td>비용</td>
																	<td><input type="text" id="money" name="budget" class="form-control transport-cost-input" value="0" maxlength="13" style="text-align:right;width:95%"></td>
																	<td><select class="currency-select transport-currency-select form-control" style="width:95%">
																			<option value="2">USD(미국)</option>
																			<option value="1" selected="selected">KRW(한국)</option>
																			<option value="0">EUR(유럽연합)</option>
																			<option value="3">JPY(일본)</option>
																			<option value="4">CNY(중국)</option>
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
							<input type="button" class="btn btn-success"  data-dismiss="modal" value="저장" onclick="detailSave(this);">
							</form>	
								</div>
								<!-- 교통 탭 끝 -->

								<!-- 장소 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade" id="place" aria-labelledby="place-tab">
									<form action="" method="post">	<br />
										<iframe src="/tvlog/schedule/schedule-detail-select-map.jsp" name="map" width="570" height="405" ALLOWTRANSPARENCY="false"></iframe>
										<input type="hidden" id="sd_status1" name="sd_status" value="1" /> 
										<div id="mylocation"></div>
										<br />
										<input type="button" class="btn btn-success" data-dismiss="modal" value="저장" onclick="detailMapSave();">
									</form>
								</div>
								<!-- 장소 탭 끝 -->

								<!-- 메모 탭 시작 -->
								<div role="tabpanel" class="tab-pane fade" id="memo" aria-labelledby="memo-tab">
								<form action="" method="post">	
									<br />
									<div class="row" id="row2">
         								<textarea class="form-control" name="sd_memo" id="memo" placeholder="메모를 입력하세요"  maxlength="20000"></textarea>
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
	</div>
		<!-- 모달 끝 -->
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
<body id="mainBody">
<jsp:include page="/main/header.jsp" />
<div class="container" id="container">	
	<!-- 여행 일정 제목 들어갈 곳 -->
	<div id="masthead">
		<p id="p1">${dto.s_title}</p>
	</div>
	<!-- 체크리스트 시작 -->
	<!-- 왼쪽 버튼 그룹 - 저장, 방문명소 -->
	<div id="savecontainer">
		<c:if test="${sessionScope.memId == dto.s_writer}">
			<button type="button"  id="scheduleSave"  onclick="window.location='/tvlog/schedule/schedule-detailUpdate.trip?s_num=${dto.s_num}'"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>일정 수정</button>
			<button type="button" id="scheduleSave" data-toggle="modal" data-target="#range">
			<c:if test="${dto.s_range ==1}">
				<i class="fa fa-unlock" aria-hidden="true"></i>전체
			</c:if>
			<c:if test="${dto.s_range ==2}">
				<i class="fa fa-user" aria-hidden="true"></i>밴드
			</c:if>
			<c:if test="${dto.s_range ==3}">
				<i class="fa fa-users" aria-hidden="true"></i>친구
			</c:if>
			<c:if test="${dto.s_range ==4}">
				<i class="fa fa-lock" aria-hidden="true"></i> 비공개
			</c:if>	
		</button>
		</c:if>
		<c:if test="${sessionScope.memId != dto.s_writer}">
			<button type="button"  id="scheduleSave"  onclick="window.location='/tvlog/main/findSchedule.trip'"><i class="fa fa-search" aria-hidden="true"></i>일정 찾기</button>
			<button type="button" id="scheduleSave">
			<c:if test="${dto.s_range ==1}">
				<i class="fa fa-unlock" aria-hidden="true"></i>전체
			</c:if>
			<c:if test="${dto.s_range ==2}">
				<i class="fa fa-user" aria-hidden="true"></i>밴드
			</c:if>
			<c:if test="${dto.s_range ==3}">
				<i class="fa fa-users" aria-hidden="true"></i>친구
			</c:if>
			<c:if test="${dto.s_range ==4}">
				<i class="fa fa-lock" aria-hidden="true"></i> 비공개
			</c:if>	
		</button>
		</c:if>
		
		<button type="button" id="scheduleSave" data-toggle="modal" data-target="#famousplace"><i class="fa fa-map-marker" aria-hidden="true"></i> 방문명소</button>
		<button type="button" id="scheduleSave" data-toggle="modal" data-target="#budget"><i class="fa fa-krw" aria-hidden="true"></i> 여행가계부</button>
		<button type="button" id="scheduleSave" data-toggle="modal" data-target="#checklist"><i class="fa fa-check-square-o" aria-hidden="true"></i> 체크리스트</button>
	</div>
	<!-- 공개설정 Modal -->
	<div class="modal fade" id="range"  tabindex="-1" role="dialog" aria-labelledby="rangeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        	<h4 class="modal-title" id="checklistModalLabel">공개 범위 설정</h4>
				</div>
				<div class="modal-body">
					<button type="button" class="range"><i class="fa fa-unlock" aria-hidden="true"></i>전 체</button>
					<button type="button" class="range"><i class="fa fa-users" aria-hidden="true"></i>친 구</button>
					<button type="button" class="range"><i class="fa fa-user" aria-hidden="true"></i>밴 드</button>
					<button type="button" class="range"><i class="fa fa-users" aria-hidden="true"></i>친구 & 밴드</button>
					<button type="button" class="range"><i class="fa fa-lock" aria-hidden="true"></i> 비공개</button>
			    </div>
			    <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> 
<!-- 방문명소 Modal -->
	<div class="modal fade"  id="famousplace" tabindex="-1" role="dialog" aria-labelledby="famousplaceModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        			<h4 class="modal-title" id="famousplaceModalLabel">방문 명소</h4>
      			</div>
      			<div class="modal-body">
      				<!-- 탭시작 -->
       				<%@include file="leftGroup/famousplace.jsp" %>
       				<!-- 탭 끝 --> 
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
   				<!-- 탭시작 -->
   					<%@include file="leftGroup/budget.jsp" %>
       			<!-- 탭 끝 -->    
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
					<!-- 탭시작 -->
					<jsp:include page="leftGroup/checklist.jsp" /> 
					<!--  탭 끝 -->    
			    </div>
			    <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> 
<!-- 체크리스트 끝 -->



<!-- 오른쪽 그룹 - 일정 -->
	<div class="col-md-10" id="schedulecontainer" >
		<!-- 여행 소개 -->
		<form action="/tvlog/schedule/schedule-update.trip" method="post" class="plan-intro" align="left" name="scheduleUpdate" > 
			<input type="hidden" name="s_num" value="${dto.s_num}" />
			<div class="container-fluid" id="container-fluid">
				<div class="row" id="row1">
					${dto.s_info}
         		</div>
         		<div class="row" id="row2">
         			<br />${dto.s_content}
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
					<div class="col-md-2" id="tripstart">
						${dto.s_startday}
					</div>
					<div class="col-md-1">${dto.s_endday}일 </div>
					<div class="col-md-1">${dto.s_membercount} 명</div>
					<div class="col-md-2">
						<c:if test="${dto.s_step == 0}">여행전</c:if>
						<c:if test="${dto.s_step == 1}">여행후</c:if>
					</div>
					<div class="col-md-6">
						${dto.s_theme}
					</div>
				</div>
			</div>
		</form>
	&nbsp;
		<!-- 텝시작(스토리 / 지도&일정)  -->
		<div id="tabMain">
			<ul id="myTab" class="nav nav-pills" role="tablist">
				<li role="presentation" id="tabtest" class="active" align="center"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true" ><i class="fa fa-list" aria-hidden="true"></i><b> 스토리</b></a></li>
			    <li role="presentation" id="tabtest" class="pause" align="center"><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false"><i class="fa fa-calendar" aria-hidden="true"></i><b> 지도 / 일정표</b></a></li>
			</ul>
		</div>
		<!-- 스토리 탭 -->
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	    		<div id="schedule">
	    			<c:forEach var="i" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
	    				DAY - ${i} <br />
		    			<c:forEach items="${detaillist}" var="detailDTO" >
		    				<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == i}">
		    					<c:if test="${detailDTO.sd_status==0}">
			    					<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
			    					<label style="background-color:#fffff;">${detailDTO.sd_startpoint}</label>
			    					<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									${detailDTO.sd_endpoint} 
									<br />
								</c:if> 
								<c:if test="${detailDTO.sd_status==1}">
									<i class="fa fa-map-marker" aria-hidden="true"></i>
									${detailDTO.sd_startpoint}
									<br />
								</c:if>
		    				</c:if> 
		    			</c:forEach>
		    		</c:forEach>
	    		</div>
			</div>
		<!-- 지도/일정 탭 -->
			<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab"> 
			<!-- 지도 시작 -->
				<br />
				<iframe src="/tvlog/schedule/schedule-map.jsp" name="map" width="100%" height="410" ALLOWTRANSPARENCY="false"frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				<br />
			<!-- 지도 끝 -->
			<!-- 지도/일정표의 테이블 -->
			    <div class="tableContainer">
					<form method=post action="">
						<p></p>
						<table id='stock_table' class="table table-bordered" border="2">
							<tr>
								<td width="100" >ALL</td><td>1 Day</td>
								<c:forEach var="i" begin="2" end="${dto.s_endday}" step="1" varStatus="k">
									<td>${i} Day</td>
								</c:forEach>
							</tr>
							<c:forEach var="i" begin="1" end="24" step="1" varStatus="k">
								<tr><td rowspan="2">${i}시</td>
									<c:forEach var="j" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
										<td id="${j}_${i}" onmouseover="aa(${j},${i});" onmouseout="bb(${j},${i});">
											<c:set var="tdid" value="${j}_${i}" />
											<c:set var="doneLoop" value="false" />
											<c:forEach items="${detaillist}" var="detailDTO" varStatus="status">
												<c:if test="${not doneLoop}"> 
													<c:if  test="${detailDTO.sd_tdid ==  tdid}">
														<div id="#detail-content" data-toggle="modal" data-target="#detailview${status.count}">
															<c:if test="${detailDTO.sd_status == 0}">
																${detailDTO.sd_startpoint}
																<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
													    		${detailDTO.sd_endpoint} <br /> 
												    		</c:if>
												    		<c:if test="${detailDTO.sd_status == 1}">
																<i class="fa fa-map-marker" aria-hidden="true"></i>
																${detailDTO.sd_startpoint}
												    		</c:if>
												    		<c:if test="${detailDTO.sd_status == 2}">
																메모 : ${detailDTO.sd_memo}
											    			</c:if>
										    			</div>
										    			<div class="modal fade" id="detailview${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    												<div class="modal-dialog" >
																<div class="modal-content" id="modalSize">
																	<div class="modal-header" >
																		<div class="panel panel-success" >
																			<div class="panel-body" >
																				<c:if test="${detailDTO.sd_status == 0}">
																					출발 : ${detailDTO.sd_startpoint} 	
																					<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
											    									도착 : ${detailDTO.sd_endpoint} <br />
											    									메모 : ${detailDTO.sd_memo} <br />
											    									비용 : ${detailDTO.sd_budget}
										    									</c:if>
										    									<c:if test="${detailDTO.sd_status == 1}">
											    									<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${detailDTO.sd_map}" name="map" width="370" height="205" ALLOWTRANSPARENCY="false"></iframe>
											    								</c:if>
											    								<c:if test="${detailDTO.sd_status == 2}">
											    									메모 : ${detailDTO.sd_memo}
											    								</c:if>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>	
														<c:set var="doneLoop" value="true"/> 
													</c:if>
												</c:if>
											</c:forEach>
											<c:if test="${not doneLoop}"> 		
												<c:set var="doneLoop" value="false"/> 
											</c:if>
										</td>
									</c:forEach>
								</tr>
			   					<tr>
			   						<c:forEach var="j" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
				   						<td id="${j}_${i}_30" onmouseover="aa(${j},${i}${i});" onmouseout="bb(${j},${i}${i});">
				   							<c:set var="tdid" value="${j}_${i}_30" />
				   							<c:set var="doneLoop" value="false" />
											<c:forEach items="${detaillist}" var="detailDTO">
												<c:if test="${not doneLoop}"> 
													<c:if  test="${detailDTO.sd_tdid ==  tdid}">
														<div id="#detail-content" data-toggle="modal" data-target="#detailview${status.count}">
															<c:if test="${detailDTO.sd_status == 0}">
																${detailDTO.sd_startpoint}
																<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
												    			${detailDTO.sd_endpoint} <br /> 
											    			</c:if>
											    			<c:if test="${detailDTO.sd_status == 1}">
											    				<i class="fa fa-map-marker" aria-hidden="true"></i>
																${detailDTO.sd_startpoint}
											    			</c:if>
											    			<c:if test="${detailDTO.sd_status == 2}">
																메모 : ${detailDTO.sd_memo}
												    		</c:if>
											    		</div>
										    			<div class="modal fade" id="detailview${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    												<div class="modal-dialog" >
																<div class="modal-content" id="modalSize">
																	<div class="modal-header" >
																		<div class="panel panel-success" >
																			<div class="panel-body" >
																				<c:if test="${detailDTO.sd_status == 0}">
																					출발 : ${detailDTO.sd_startpoint} 	
																					<i id="btn1" class="${detailDTO.sd_transport}" aria-hidden="true"></i>
												    								도착 : ${detailDTO.sd_endpoint} <br />
												    								메모 : ${detailDTO.sd_memo} <br />
												    								비용 : ${detailDTO.sd_budget}
											    								</c:if>
										    									<c:if test="${detailDTO.sd_status == 1}">
										    										<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${detailDTO.sd_map}" name="map" width="370" height="205" ALLOWTRANSPARENCY="false"></iframe>
										    									</c:if>
										    									<c:if test="${detailDTO.sd_status == 2}">
										    										메모 : ${detailDTO.sd_memo}
										    									</c:if>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>	
														<c:set var="doneLoop" value="true"/> 
													</c:if>
												</c:if>
											</c:forEach>
											<c:if  test="${not doneLoop}">
												
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


	<!-- 세부일정 등록  -->
	<!-- 모달 팝업 -->
	<div class="modal fade" id="detail-create" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h6 class="modal-title" id="myModalLabel">Modal title</h6>
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
																	<td colspan="2"><input type="text" id="memo_0" class="form-control transport-memo-input" value="" style="width:98%;"></td>
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
	</div>
	<!-- 모달 끝 -->
</body>
</html>
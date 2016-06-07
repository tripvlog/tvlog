<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
function updateDetail(form){
	objTd = form.sd_tdid.value;
	$.ajax({
        type: "post",
        url : "/tvlog/schedule/schedule-detail-scheduleUpdate.trip",
        data: {	// url 페이지도 전달할 파라미터
    	    sd_num : form.sd_num.value,
    	    sd_status : $('#sd_status').val(),
    	    sd_startpoint : form.sd_startpoint.value,
       		sd_endpoint  : form.sd_endpoint.value,
       		sd_memo  : form.sd_memo.value,
       		sd_budget  : form.sd_budget.value,
       		sd_transport : $('#selectTransport').val()
       },
       success: success,	// 페이지요청 성공시 실행 함수
       error: whenError	//페이지요청 실패시 실행함수
 	});
}
function success(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
	opener.document.getElementById(objTd).innerHTML=aaa;
	self.close();
}
function whenError(){
    alert("Error");
}
</script>
</head>
<div id="detail-create">
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
							<form action="/tvlog/schedule/schedule-detail-time.trip" method="post">
								<input type="hidden" id="s_num" name="s_num" value="${dto.s_num}" />
								<input type="hidden" id="sd_num" name="sd_num" value="${dto.sd_num}" />
								<input type="hidden" id="sd_status" name="sd_status" value="0" />
								<input type="hidden" id="sd_tdid" name="sd_status" value="${dto.sd_tdid}" />
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
																<td id="btnicon"><i class="${dto.sd_transport}" aria-hidden="true"></i>
																	<input type="hidden" id="selectTransport" name="sd_transport" value="${dto.sd_transport}" />
																</td>
																<td>출발지 <input type="text" id="from_0" name="sd_startpoint" class="form-control transport-from-input" value="${dto.sd_startpoint}" style="width: 95%;"></td>
																<td>도착지 <input type="text" id="to_0" name="sd_endpoint" class="form-control transport-to-input" value="${dto.sd_endpoint}"style="width: 95%;"></td>
															</tr>
															<tr>
																<td>메모</td>
																<td colspan="2"><input type="text" id="memo_0" name="sd_memo" class="form-control transport-memo-input" value="${dto.sd_memo}" style="width:98%;"></td>
															</tr>
															<tr>
																<td>비용</td>
																<td><input type="text" id="money" name="sd_budget" class="form-control transport-cost-input" value="${dto.sd_budget}" maxlength="13" style="text-align:right;width:95%"></td>
																<td>
																	<select class="currency-select transport-currency-select form-control" style="width:95%">
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
								<input type="button" class="btn btn-success"  data-dismiss="modal" value="저장" onclick="updateDetail(this.form);">
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
         							<textarea class="form-control" name="sd_memo" id="memo" placeholder="메모를 입력하세요"  maxlength="20000">${dto.sd_memo}</textarea>
         							<br />
								</div>
								<input type="button" class="btn btn-success" value="저장" onclick="updateDetail(this.form)">
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
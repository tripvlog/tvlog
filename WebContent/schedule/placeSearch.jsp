<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>트래블로그</title>
<style>
	.schedule-content{
		width : 200px; 
		height: 100px; 
		padding-top : 50px;
		border-radius:10px; 
		margin-bottom:10px;  
		opacity: 1;
		font-size: 20px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}

</style>

</head>
<body>
<div class="container" id="container">
		<div>
		<c:if test="${placeCount > 0 }">
			<div id="post">
			<table width="400px">
				<c:forEach begin="0" end="${(fn:length(place) + 2) / 3 - 1}" var="row">
					<tr>
					    <c:forEach begin="0" end="2" var="col">
					        <c:set var="scheduleDTO" value="${place[row * 3 + col]}"/>
					        <c:if test="${not empty scheduleDTO}">
					        	<td>
					        		<div class="schedule-content"  data-toggle="modal" data-target="#scheduleModal${scheduleDTO.sd_num}"  style="background-image:url('/tvlog/img/schedule/${scheduleDTO.sd_orgfile}'); background-size: 100% 100%" >
						        		${scheduleDTO.sd_startpoint}	    
					        		</div>
					        		<div class="modal fade" id="scheduleModal${scheduleDTO.sd_num}"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							    	<div class="modal-dialog modal-lg" >
							    		<div class="modal-content" >
							      			<div class="modal-header" >
												<div class="panel panel-success" >
													<div class="panel-heading">
														<h3>${scheduleDTO.sd_startpoint}</h3>
													</div>
													<div class="panel-body" id="scheduleContent">
														<c:if test="${scheduleDTO.sd_orgfile =='schedule-img.png'}">
															<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${scheduleDTO.sd_map}" name="map" width="100%" height="400" ALLOWTRANSPARENCY="false"></iframe>
														</c:if>
														<c:if test="${scheduleDTO.sd_orgfile !='schedule-img.png'}">
															<img src="/tvlog/img/schedule/${scheduleDTO.sd_orgfile}" width="100%" /> <br />
															<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${scheduleDTO.sd_map}" name="map" width="100%" height="400" ALLOWTRANSPARENCY="false"></iframe>
														</c:if>
													</div>
													<div class="panel-body"> 
														<input type="hidden" id="1cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_num}" />
														<input type="hidden" id="2cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.s_num}" />
														<input type="hidden" id="3cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_startpoint}" />
														<input type="hidden" id="4cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_endpoint}" />
														<input type="hidden" id="5cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_memo}" />
														<input type="hidden" id="6cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_transport}" />
														<input type="hidden" id="7cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_orgfile}" />
														<input type="hidden" id="8cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_savfile}" />
														<input type="hidden" id="9cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_budget}" />
														<input type="hidden" id="10cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_map}" />
														<input type="hidden" id="11cho${scheduleDTO.sd_num}" name="sd_num" value="${scheduleDTO.sd_range}" />
														<input type="hidden" id="12cho${scheduleDTO.sd_num}" name="sd_num" value="2" />
														
														<input type="button" value="등 록" class="btn btn-warning" data-dismiss="modal" onclick="placeSave('${scheduleDTO.sd_num}')" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
					        	</td>
					        </c:if>
					    </c:forEach>
					</tr>
				</c:forEach>
			</table>
			</div>
		</c:if>
		<c:if test="${placeCount == 0 }">
			<h2>등록된 일정이 없습니다..!!</h2>
		</c:if>
		</div>
</div>
</body>
</html>
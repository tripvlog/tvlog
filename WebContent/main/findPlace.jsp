<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/projcet/postboard/common/css/css.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>트래블로그</title>
<style>
	.schedule-content{
		width : 370px; 
		height: 150px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px;  
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}
	#mainImg {
	width: 1140px;
	min-height: 270px;
	background-size : 1140px;
	background-image : url('/tvlog/img/findPlace/place.jpg');
	text-align: center;
	position:relative; 
	}
	#mainImg #p1{
	font-size : 50px;	
	font-weight: bold;
	color: #FFFFFF;
	position:absolute;
	width:600px; left:0; right:0; margin-left:auto; margin-right:auto;
	height:40px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto;
	}
	#mainImg #p2{
	font-size : 20px;	
	font-weight: bold;
	position:absolute;
	width:600px; left:0; right:0; margin-left:420px; margin-right:auto;
	height:30px; top: 0; bottom:0; margin-top:180px; margin-bottom:auto;
	}
	
	#main2{
		font-size : 15px;
		margin-top: :20px;
		margin-bottom: :20px;
		border-bottom : 2px solid #BDBDBD;
	}
</style>
</head>
<body id="mainBody">
<jsp:include page="/main/header.jsp"></jsp:include>
<div class="container" id="container">
		<div id="mainImg">
			<p id="p1">
				추천 명소
			</p>
		</div>
		
		<div id="main2">
			<h3>등록된 명소 : ${count}개</h3>
		</div>
		
		<div>
		<br />
		<c:if test="${count > 0 }">
			<div id="post">
			<table width="1140px">
				<c:forEach begin="0" end="${(fn:length(scheduleList) + 2) / 3 - 1}" var="row">
					<tr>
					    <c:forEach begin="0" end="2" var="col">
					        <c:set var="scheduleDTO" value="${scheduleList[row * 3 + col]}"/>
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
														${scheduleDTO.sd_memo}
														<br />
														<c:if test="${scheduleDTO.sd_orgfile =='schedule-img.png'}">
															<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${scheduleDTO.sd_map}" name="map" width="100%" height="400" ALLOWTRANSPARENCY="false"></iframe>
														</c:if>
														<c:if test="${scheduleDTO.sd_orgfile !='schedule-img.png'}">
															<img src="/tvlog/img/schedule/${scheduleDTO.sd_orgfile}" width="100%" /> <br />
															<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${scheduleDTO.sd_map}" name="map" width="100%" height="400" ALLOWTRANSPARENCY="false"></iframe>
														</c:if>
													</div>
													<div class="panel-body">
														<input type="button" value="close" class="btn btn-warning" data-dismiss="modal" />
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
		<c:if test="${scheduleCount == 0 }">
			<h2>등록된 일정이 없습니다..!!</h2>
		</c:if>
		</div>
</div>
</body>
</html>
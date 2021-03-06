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
	background-size : 1140px 600px;
	background-image : url('/tvlog/img/schedule/schedule-list.jpg');
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
<script>
	function goSearch(){
		var keyword = document.getElementById("search").value;
		if(keyword == ""){
			alert("키워드를 입력하세요");
		}else{
			window.location="/tvlog/schedule/schedule-search.trip?keyword="+keyword;
		}
	}
</script>
<body id="mainBody">
	<jsp:include page="/main/header.jsp" />
	<div class="container" id="container">	
		<!-- 여행 이지미  제목 들어갈 곳 -->
		<div id="mainImg">
			<p id="p1">
				여행 일정 찾기
			</p>
			<div class="row" id="p2">
				<div class="col-sm-6">
	   				<div class="input-group">
				    	<span class="input-group-addon">
							<i class="fa fa-search" aria-hidden="true"></i>
						</span>
						<input type="text" id="search" class="form-control" onkeypress="if( event.keyCode==13 ){goSearch();}">
					</div><!-- /input-group -->
				</div><!-- /.col-sm-6 -->
			</div>
		</div>
		
		<div id="main2">
			
			<h3>공개된 일정 : ${scheduleCount}개</h3>

		</div>
		
		<div>
		<br />
		<c:if test="${scheduleCount > 0 }">
			<div id="post">
			<table width="1140px">
				<c:forEach begin="0" end="${(fn:length(scheduleList) + 2) / 3 - 1}" var="row">
					<tr>
					    <c:forEach begin="0" end="2" var="col">
					        <c:set var="scheduleDTO" value="${scheduleList[row * 3 + col]}"/>
					        <c:if test="${not empty scheduleDTO}">
					        	<td>
					        		<div class="schedule-content" style="background-image:url('/tvlog/img/schedule/${scheduleDTO.s_mainimg}');" onclick="window.location='/tvlog/schedule/schedule-content.trip?s_num=${scheduleDTO.s_num}'">
						        		${scheduleDTO.s_title}	    
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
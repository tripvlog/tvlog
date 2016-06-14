<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>트래블로그</title>
		<style>
			.content-list{
				width : 370px; 
				height: 150px; 
				padding-top : 30px;
				border-radius:10px; 
				margin-top:10px;
				margin-bottom:10px; 
				margin-right:10px;
				opacity: 1;
				font-size: 25px; 
				font-weight: bold;
				text-align: center; 
				color: #ffffff;
				background-color: #BCE55C;
			}
		</style>
	</head>
	<body>
		<jsp:include page="/main/header.jsp" /><br />
		<div class="container">
			<div id="theGrid" class="main">
				<div class="content-list" onclick="window.location='/tvlog/admin/postManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Post All Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${postAllCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/postDayManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Post Day Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${postDayCount} </span>
						</div>
					
				</div>
				<div class="content-list" onclick="window.location='/tvlog/admin/scheduleManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Schedule All Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${scheduleAllCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/scheduleDayManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Schedule Day Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${scheduleDayCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/bandManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Band All Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${bandAllCount} </span>
						</div>
				</div>
						
				<div class="content-list" onclick="window.location='/tvlog/admin/bandDayManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Band Day Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${bandDayCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/memberManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Member Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${memberAllCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/diaryManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Diary All Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${diaryAllCount} </span>
						</div>
				</div>
				
				<div class="content-list" onclick="window.location='/tvlog/admin/diaryManagement.trip'" style="float: left;">
						<h2 class="title title--preview"> Diary Day Count</h2>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${diaryDayCount} </span>
						</div>
				</div>
			</div>
		</div>
	</body>
</html>
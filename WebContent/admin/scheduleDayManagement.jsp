<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
	<c:if test="${scheduleDayCount != 0}">
	<!-- 오늘 올라온 일정 검색 -->
	<h3>오늘 올라온 일정 검색 (${scheduleDayCount} 개)</h3>
	<table class="table" style="width:1140px"  cellspacing="0" cellpadding="2">
		<tr align="center" class="active">
			<td>일정 번호</td>
			<td>일정 작성자</td>
			<td>여행 제목</td>
			<td>여행 시작일</td>
			<td>여행 끝난일</td>
			<td>일정 공개범위</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.s_num}</td>
			<td>${list.s_writer}</td>
			<td>${list.s_title}</td>
			<td>${list.s_startday}</td>
			<td>${list.s_endday}</td>
			<td>${list.s_range}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 오늘 올라온 일정 검색 끝 -->
	</c:if>
	<c:if test="${scheduleDayCount == 0}">
		<h3>오늘 올라온 일정 검색 (${scheduleDayCount} 개)</h3>
		오늘 올라온 일정이 없습니다.
	</c:if>
</div>
</body>
</html>
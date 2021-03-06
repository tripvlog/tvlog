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
	<c:if test="${postDayCount != 0}">
	<!-- 오늘 올라온 포스트 검색 -->
	<h3>오늘 올라온 포스트 (${postDayCount} 개)</h3>
	<table class="table" style="width:1140px"  cellspacing="0" cellpadding="2">
		<tr align="center" class="active">
			<td>포스트 번호</td>
			<td>작성자</td>
			<td>포스트 제목</td>
			<td>포스트 등록 날짜</td>
			<td>좋아요</td>
			<td>포스트 공개 범위</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.no}</td>
			<td>${list.id}</td>
			<td>${list.subject}</td>
			<td>${list.regdate}</td>
			<td>${list.good}</td>
			<td>${list.p_public}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 오늘 올라온 포스트 검색 끝 -->
	</c:if>
	<c:if test="${postDayCount == 0}">
		<h3>오늘 올라온 포스트 (${postDayCount} 개)</h3>
		오늘 올라온 포스트가 없습니다.
	</c:if>
</div>
</body>
</html>
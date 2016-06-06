<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
</head>
<body>
<div id="totalDiv">
	<!-- 일기 검색 -->
	<h4>모든 일기 검색 (${diaryAllCount} 개)</h4>
	<table width="1300" border="1" cellspacing="0" cellpadding="2" >
		<tr align="center">
			<td>일기 번호</td>
			<td>일기 작성자</td>
			<td>일기 제목</td>
			<td>일기 내용</td>
			<td>일기 위치</td>
			<td>일기 공개범위</td>
			<td>일기 등록 날짜</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.diary_num}</td>
			<td>${list.diary_writer}</td>
			<td>${list.diary_title}</td>
			<td>${list.diary_content}</td>
			<td>${list.diary_location}</td>
			<td>${list.diary_range}</td>
			<td>${list.diary_reg}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 일기 검색 끝 -->
</div>
</body>
</html>
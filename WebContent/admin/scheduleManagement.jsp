<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>트래블로그</title>
</head>
<body>
<div id="totalDiv">
	<!-- 스케줄 검색 -->
	<h4>모든 스케줄 검색 (${scheduleAllCount} 개)</h4>
	<table width="1200" border="1" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td>일정 번호</td>
			<td>일정 작성자</td>
			<td>여행 제목</td>
			<td>여행 시작일</td>
			<td>여행 끝난일</td>
			<td>여행 테마</td>
			<td>일정 이미지</td>
			<td>일정 공개범위</td>
			<td>여행 단계</td>
			<td>여행 정보</td>
			<td>여행 내용</td>
			<td>여행 인수</td>
			<td>일정 등록 날짜</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.s_num}</td>
			<td>${list.s_writer}</td>
			<td>${list.s_title}</td>
			<td>${list.s_startday}</td>
			<td>${list.s_endday}</td>
			<td>${list.s_theme}</td>
			<td>${list.s_mainimg}</td>
			<td>${list.s_range}</td>
			<td>${list.s_step}</td>
			<td>${list.s_info}</td>
			<td>${list.s_content}</td>
			<td>${list.s_memberCount}</td>
			<td>${list.s_regdate}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 스케줄 검색 끝 -->
</div>


</body>
</html>
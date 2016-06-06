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
	<!-- 밴드 검색 -->
	<h4>모든 밴드 검색 (${bandAllCount} 개)</h4>
	<table width="800" border="1" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td>밴드 ID</td>
			<td>밴드 이름</td>
			<td>밴드장</td>
			<td>밴드 이미지</td>
			<td>밴드 소개</td>
			<td>밴드 공개범위</td>
			<td>밴드 등록날짜</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.band_id}</td>
			<td>${list.band_name}</td>
			<td>${list.band_leader}</td>
			<td>${list.band_img}</td>
			<td>${list.band_intro}</td>
			<td>${list.band_range}</td>
			<td>${list.band_reg}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 포스트 검색 끝 -->
</div>
</body>
</html>
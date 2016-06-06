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
	<!-- 회원 검색 -->
	<h4>모든 회원 검색 (${memberAllCount} 개) </h4>
	<table width="600" border="1" cellspacing="0" cellpadding="2" >
		<tr align="center">
			<td>프로필 사진</td>
			<td>ID</td>
			<td>닉네임</td>
			<td>도메인</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td><img src="/tvlog/img/member/${list.path}" width="50" height="50" style="align:center"></td>
			<td>${list.id}</td>
			<td>${list.name}</td>
			<td>${list.domain}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 회원 검색 끝 -->
</div>

</body>
</html>
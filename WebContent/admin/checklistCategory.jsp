<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/tvlog/schedule/schedule.js"></script>
<style>
	#totalDiv{
		padding:20px;
	}
</style>
</head>
<body>
<div id="totalDiv">
	<!-- 카테고리 검색 -->
	<h4>현재 카테고리</h4>
	<table width="600" border="1" cellspacing="0" cellpadding="2">
		<tr>
			<td>카테고리 번호</td>
			<td>카테고리 이름</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.cl_num}</td>
			<td>${list.cl_name}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 카테고리 검색 끝 -->
	
	<br />
	<br />
	
	<!-- 카테고리 추가 -->
	<h4>카테고리 추가</h4>
	<form action="checklistCateAdd.trip" method="post">
		추가할 카테고리 이름 : <input type="text" name="cl_name">
		<input type="submit" value="추가" name="checklistCateAdd">
	</form>
	<!-- 카테고리 추가 끝 -->
	
	<br />
	<br />
	
	<!-- 카테고리 삭제 -->
	<h4>카테고리 삭제</h4>
	<form action="checklistCateDel.trip" method="post">
		삭제할 카테고리 이름 : <input type="text" name="cl_name">
		<input type="submit" value="삭제" name="checklistCateDel">
	</form>
	<!-- 카테고리 삭제 끝 -->
	
</div>
</body>
</html>
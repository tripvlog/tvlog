<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<script>
	function itemlocation(cl_num) {
		window.location="/tvlog/admin/checklistItem.trip?cl_num="+cl_num;
	}
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 8.2%;">
		<!-- 카테고리 검색 -->
		<h3>현재 카테고리</h3>
		<table class="table" style="width:600px" cellspacing="0" cellpadding="2">
			<tr class="active" >
				<td>카테고리 번호</td>
				<td>카테고리 이름</td>
				<td>항목 추가</td>
			</tr>
			<c:forEach var="list" items="${list}">
			<tr>
				<td>${list.cl_num}</td>
				<td>${list.cl_name}</td>
				<td><input type="button" value="항목추가" onClick="itemlocation('${list.cl_num}')"></td>
			</tr>
			</c:forEach>
		</table>
		<!-- 카테고리 검색 끝 -->
		
		<br />
		<br />
		
		<!-- 카테고리 추가 -->
		<h3>카테고리 추가</h3>
		<form action="/tvlog/admin/checklistCateAdd.trip" method="post">
			추가할 카테고리 이름 : <input type="text" name="cl_name">
			<input type="submit" value="추가" name="checklistCateAdd">
		</form>
		<!-- 카테고리 추가 끝 -->
		
		<br />
		<br />
		
		<!-- 카테고리 삭제 -->
		<h3>카테고리 삭제</h3>
		<form action="/tvlog/admin/checklistCateDel.trip" method="post">
			삭제할 카테고리 이름 : 
			<select name="cl_num">
				<c:forEach var="list" items="${list}">
					<option value="${list.cl_num}">${list.cl_name}</option>
					
				</c:forEach>
			</select>
			
			<input type="submit" value="삭제" name="checklistCateDel">
		</form>
		<!-- 카테고리 삭제 끝 -->
		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<script>
	function itemDellocation(ci_name, cl_num) {
		window.location="/tvlog/admin/checklistItem.trip?cl_num="+cl_num;
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" />
<div id="totalDiv"  style="margin-left: 8.2%;">
	<!-- 항목 검색 -->
	<h3>카테고리 안에 있는 항목</h3>
	<table class="table" style="width:600px" cellspacing="0" cellpadding="2">
		<tr class="active">
			<td>항목 번호</td>
			<td>항목 이름</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.ci_num}</td>
			<td>${list.ci_name}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 항목 검색 끝 -->
	
	<br />
	<br />
	
	<!-- 항목 추가 -->
	<h3>항목 추가</h3>
	<form action="/tvlog/admin/checklistItemAdd.trip" method="post">
		추가할 항목 이름 : <input type="text" name="ci_name">
		<input type="hidden" name="cl_num" value="${cl_num }">
		<input type="submit" value="추가" name="checklistItemAdd">
	</form>
	<!-- 항목 추가 끝 -->
	
	<br />
	<br />
	
	<!-- 항목 삭제 -->
	<h3>항목 삭제</h3>
	<form action="/tvlog/admin/checklistItemDel.trip" method="post">
		삭제할 항목 이름 : 
		<select name="ci_num">
			<c:forEach var="list" items="${list}">
				<option value="${list.ci_num}">${list.ci_name}</option>
			</c:forEach>
		</select>
		<input type="hidden" name="cl_num" value="${cl_num }">
		<input type="submit" value="삭제" name="checklistItemDel">
	</form>
	<!-- 항목 삭제 끝 -->
</div>
</body>
</html>
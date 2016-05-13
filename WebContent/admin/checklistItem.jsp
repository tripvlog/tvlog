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
<script>
	function itemDellocation(ci_name, cl_num) {
		window.location="/tvlog/checklistItem.trip?cl_num="+cl_num;
	}
</script>
<style>
	#totalDiv{
		padding:20px;
	}
</style>
</head>
<body>
<div id="totalDiv">
	<!-- 항목 검색 -->
	<h4>카테고리 안에 있는 항목</h4>
	<table width="600" border="1" cellspacing="0" cellpadding="2">
		<tr>
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
	<h4>항목 추가</h4>
	<form action="checklistItemAdd.trip" method="post">
		추가할 항목 이름 : <input type="text" name="ci_name">
		<input type="hidden" name="cl_num" value="${cl_num }">
		<input type="submit" value="추가" name="checklistItemAdd">
	</form>
	<!-- 항목 추가 끝 -->
	
	<br />
	<br />
	
	<!-- 항목 삭제 -->
	<h4>항목 삭제</h4>
	<form action="checklistItemDel.trip" method="post">
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
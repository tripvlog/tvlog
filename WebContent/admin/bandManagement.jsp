<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
<script>
	function deleteThis(band_id){
		var deleteThis = confirm("삭제하시겠습니까?");
		if(deleteThis == true){ 
			location.href="/tvlog/admin/bandDeleteManagement.trip?band_id="+band_id;
		}
		else if(deleteThis == false){
		}
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
		<c:if test="${bandAllCount != 0}">
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
				<td>삭제</td>
			</tr>
			<c:forEach var="list" items="${list}">
			<tr align="center">
				<td>${list.band_id}</td>
				<td>${list.band_name}</td>
				<td>${list.band_leader}</td>
				<td><img src="/tvlog/img/band/${list.band_img}" width="50" height="50" style="align:center"></td>
				<td>${list.band_intro}</td>
				<td>${list.band_range}</td>
				<td>${list.band_reg}</td>
				<td><input type="button" value="삭제" onclick="deleteThis('${list.band_id}')"></td>
			</tr>
			</c:forEach>
		</table>
		<!-- 밴드 검색 끝 -->
		</c:if>
		<c:if test="${bandAllCount == 0}">
			등록된 밴드가 없습니다.
		</c:if>
	</div>
</body>
</html>
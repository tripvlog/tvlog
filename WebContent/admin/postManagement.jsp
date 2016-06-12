<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
<script>
	function deleteThis(no){
		var deleteThis = confirm("삭제하시겠습니까?");
		if(deleteThis == true){ 
			location.href="/tvlog/admin/postDeleteManagement.trip?no="+no;
		}
		else if(deleteThis == false){
		}
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 8%;">
	<c:if test="${postAllCount != 0}">
	<!-- 포스트 검색 -->
	<h3>포스트 관리 (${postAllCount} 개)</h3>
	<table style="width:1140px"  cellspacing="0" cellpadding="2" class="table">
		<tr align="center" class="active">
			<td>포스트 번호</td>
			<td>작성자</td>
			<td>포스트 제목</td>
			<td>포스트 등록 날짜</td>
			<td>좋아요</td>
			<td>포스트 공개 범위</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.no}</td>
			<td>${list.id}</td>
			<td>${list.subject}</td>
			<td>${list.regdate}</td>
			<td>${list.good}</td>
			<td>${list.p_public}</td>
			<td><input type="button" value="삭제" onclick="deleteThis('${list.no}')"></td>
		</tr>
		</c:forEach>
	</table>
	<!-- 포스트 검색 끝 -->
	</c:if>
	<c:if test="${postAllCount == 0}">
		등록된 포스트가 없습니다.
	</c:if>
</div>
</body>
</html>
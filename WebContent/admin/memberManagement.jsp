<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
<script>
	function deleteThis(id){
		var deleteThis = confirm("삭제하시겠습니까?");
		if(deleteThis == true){ 
			location.href="/tvlog/admin/memberDeleteManagement.trip?id="+id;
		}
		else if(deleteThis == false){
		}
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
	<c:if test="${memberAllCount != 0}">
	<!-- 회원 검색 -->
	<h4>모든 회원 검색 (${memberAllCount} 개) </h4>
	<table width="600" border="1" cellspacing="0" cellpadding="2" >
		<tr align="center">
			<td>프로필 사진</td>
			<td>ID</td>
			<td>닉네임</td>
			<td>도메인</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td><img src="/tvlog/img/member/${list.path}" width="50" height="50" style="align:center"></td>
			<td>${list.id}</td>
			<td>${list.name}</td>
			<td>${list.domain}</td>
			<td><input type="button" value="삭제" onclick="deleteThis('${list.id}')"></td>
		</tr>
		</c:forEach>
	</table>
	<!-- 회원 검색 끝 -->
	</c:if>
	<c:if test="${memberAllCount == 0}">
		등록된 회원이 없습니다.
	</c:if>
</div>

</body>
</html>
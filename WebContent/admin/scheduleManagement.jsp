<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>트래블로그</title>
<script>
	function deleteThis(s_num){
		var deleteThis = confirm("삭제하시겠습니까?");
		if(deleteThis == true){ 
			location.href="/tvlog/admin/scheduleDeleteManagement.trip?s_num="+s_num;
		}
		else if(deleteThis == false){
		}
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
	<c:if test="${scheduleAllCount != 0}">
	<!-- 스케줄 검색 -->
	<h4>모든 스케줄 검색 (${scheduleAllCount} 개)</h4>
	<table width="1000" border="1" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td>일정 번호</td>
			<td>일정 작성자</td>
			<td>여행 제목</td>
			<td>여행 시작일</td>
			<td>여행 끝난일</td>
			<td>일정 공개범위</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.s_num}</td>
			<td>${list.s_writer}</td>
			<td>${list.s_title}</td>
			<td>${list.s_startday}</td>
			<td>${list.s_endday}</td>
			<td>${list.s_range}</td>
			<td><input type="button" value="삭제" onclick="deleteThis('${list.s_num}')"></td>
		</tr>
		</c:forEach>
	</table>
	<!-- 스케줄 검색 끝 -->
	</c:if>
	<c:if test="${scheduleAllCount == 0}">
		등록된 일정이 없습니다.
	</c:if>
</div>


</body>
</html>
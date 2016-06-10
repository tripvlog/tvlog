<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
<script>
	function deleteThis(diary_num){
		var deleteThis = confirm("삭제하시겠습니까?");
		if(deleteThis == true){ 
			location.href="/tvlog/admin/diaryDeleteManagement.trip?diary_num="+diary_num;
		}
		else if(deleteThis == false){
		}
	}
</script>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
	<c:if test="${diaryAllCount != 0}">
	<!-- 일기 검색 -->
	<h4>모든 일기 검색 (${diaryAllCount} 개)</h4>
	<table width="900" border="1" cellspacing="0" cellpadding="2" >
		<tr align="center">
			<td>일기 번호</td>
			<td>일기 작성자</td>
			<td>일기 제목</td>
			<td>일기 공개범위</td>
			<td>일기 등록 날짜</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.diary_num}</td>
			<td>${list.diary_writer}</td>
			<td>${list.diary_title}</td>
			<td>${list.diary_range}</td>
			<td>${list.diary_reg}</td>
			<td><input type="button" value="삭제" onclick="deleteThis('${list.diary_num}')"></td>
		</tr>
		</c:forEach>
	</table>
	<!-- 일기 검색 끝 -->
	</c:if>
	<c:if test="${diaryAllCount == 0}">
		등록된 일기가 없습니다.
	</c:if>
</div>
</body>
</html>
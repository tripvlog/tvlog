<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<title>트래블로그</title>
</head>
<body>
<jsp:include page="/main/header.jsp" />
	<div id="totalDiv" style="margin-left: 9%;">
		<h4>일기로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/diary/list.trip'"></h4>
		<c:if test="${myDiaryListCount != 0}">
			<h4>내가 작성한 일기 (${myDiaryListCount} 개)</h4>
			<table width="900" border="1" cellspacing="0" cellpadding="2" >
				<tr align="center">
					<td>일기 작성자</td>
					<td>일기 제목</td>
					<td>일기 등록 날짜</td>
				</tr>
				<c:forEach var="diaryDTO" items="${diary}">
				<tr align="center">
					<td>${diaryDTO.diary_writer}</td>
					<td>${diaryDTO.diary_title}</td>
					<td>${diaryDTO.diary_reg}</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${myDiaryListCount == 0}">
			등록된 일기가 없습니다.
		</c:if>
	</div>
</body>
</html>
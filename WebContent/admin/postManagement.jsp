<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>트래블로그</title>
</head>
<body>
<div id="totalDiv">
	<!-- 포스트 검색 -->
	<h4>모든 포스트 검색 (${postAllCount} 개)</h4>
	<table width="3500" border="1" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td>포스트 번호</td>
			<td>작성자</td>
			<td>?</td>
			<td>포스트 제목</td>
			<td>포스트 내용</td>
			<td>파일 원본</td>
			<td>파일 저장할 이름</td>
			<td>조회수</td>
			<td>좋아요</td>
			<td>포스트 등록 날짜</td>
			<td>?</td>
			<td>?</td>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr align="center">
			<td>${list.no}</td>
			<td>${list.id}</td>
			<td>${list.name}</td>
			<td>${list.subject}</td>
			<td>${list.content}</td>
			<td>${list.file_orgname}</td>
			<td>${list.file_savname}</td>
			<td>${list.readhit}</td>
			<td>${list.good}</td>
			<td>${list.regdate}</td>
			<td>${list.select_p}</td>
			<td>${list.p_public}</td>
		</tr>
		</c:forEach>
	</table>
	<!-- 포스트 검색 끝 -->
</div>
</body>
</html>
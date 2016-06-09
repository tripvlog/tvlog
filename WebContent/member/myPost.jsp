<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>트래블로그</title>
</head>
<body>
<jsp:include page="/main/header.jsp" /> 
	<div id="totalDiv" style="margin-left: 9%;">
		<h4>포스트로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/post/postList.trip'"></h4>
		<c:if test="${myPostListCount != 0}">
			<h4>내가 쓴 포스트 (${myPostListCount} 개)</h4>
			<table width="1000" border="1" cellspacing="0" cellpadding="2">
				<tr align="center">
					<td>작성자</td>
					<td>포스트 제목</td>
					<td>포스트 등록 날짜</td>
					<td>좋아요</td>
				</tr>
				<c:forEach var="post" items="${post}">
					<tr align="center">
						<td>${post.id}</td>
						<td>${post.subject}</td>
						<td>${post.regdate}</td>
						<td>${post.good}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${myPostListCount == 0}">
			등록한 포스트가 없습니다.
		</c:if>
	</div>
</body>
</html>
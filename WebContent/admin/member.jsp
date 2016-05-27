<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리</title>
</head>
<body>
<h2>회원 목록</h2>

<h4>일반 로그인 회원</h4>

<h4>페이스북 로그인 회원</h4>


<c:forEach var="list" items="${list}">
	<option value="${list.cl_num}">${list.cl_name}</option>
</c:forEach>






</body>
</html>
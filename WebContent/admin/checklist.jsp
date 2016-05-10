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
<style>
	#totalDiv{
		padding:20px;
	}
</style>

<title>트립블로그</title>

<body>
<div id="totalDiv">
	<h2>체크리스트 관리자 모드</h2>
	<br />
	<input type="button" value="카테고리 관리" onclick="javascript:window.location='checklistCategory.trip'">
	<input type="button" value="항목 관리" onclick="javascript:window.location='checklistItem.trip'">
</div>
</body>
</html>
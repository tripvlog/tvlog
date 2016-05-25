<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
       아이디${id }
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">마이페이지</a></li>
    <li class="divider"></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여행일정</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">여행일기</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">포스트</a></li>
    <li class="divider"></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/member/logout.jsp">로그아웃</a></li>
  </ul>
</div>
</body>
</html>
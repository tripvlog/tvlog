<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="famousplace">
	<ul id="famousplace-Tab" class="nav nav-pills" role="tablist">
	  <li role="presentation" class="active"><a data-target="#day1" id="day1-tab" role="tab" data-toggle="tab" aria-controls="day1" aria-expanded="true">Day 1</a></li>
	  <li role="presentation" class=""><a data-target="#day2" role="tab" id="day2-tab" data-toggle="tab" aria-controls="day2" aria-expanded="false">Day 2 (이건 일수에 따라 변화되게 바꿔야함)</a></li>
	</ul>
	<!-- 각 탭을 눌렀을 때 동작하는 내용 -->
	<div id="famousplaceTab" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="day1" aria-labelledby="day1-tab">
	    <p>1일차에 방문했던 명소</p>
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="day2" aria-labelledby="day2-tab">
	    <p>2일차에 방문했던 명소</p>
	  </div>
	</div>
</div>
</body>
</html>
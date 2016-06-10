<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>트래블로그</title>
<style>
	#container{
		margin-top: 7px;
	}
	#home-tab{
		width:568px;
	}
	#profile-tab{
		width:568px;
	}
</style>
</head>
<body>
	<jsp:include page="/main/header.jsp"></jsp:include>
	<div class="container" id="container">
	    <ul id="myTab" class="nav nav-pills" role="tablist">
	   	   <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="false">포스트</a></li>
	       <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="true">일기</a></li>
	  	</ul>
	  	<div id="myTabContent" class="tab-content">
	    	<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	     		 포스트 보여주기
	    	</div>
	    	<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	     		 일기 보여주기
	   		</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    	<head>
    		<meta charset="UTF-8">
    		<title>bootstrap test</title>
    		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    		<link rel="stylesheet" type="text/css" href="/jsmusic/webapp/user/mun/css/login.css"/> 
			<script src="/jsmusic/webapp/user/mun/js/facebook.js" type="text/javascript"></script>
			<script src="/jsmusic/webapp/user/mun/js/google.js" type="text/javascript"></script>
			<script src="/jsmusic/webapp/user/mun/js/login.js" type="text/javascript"></script>
    		<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
			<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
			<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
</head>
<body>
<c:if test="${sessionScope.memId != null}">
    	<nav class="navbar navbar-default" role="navigation">
    		<div class="container-fluid">
    			<div class="navbar-header" style="float: left;">
    				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
    				</button>
    				<a class="navbar-brand" href="#">Trip Blog</a>
    			</div>
    			<div class="collapse navbar-collapse"  style="float:left;">
    				<ul class="nav navbar-nav">
    					<li class="#about"><a href="#" id="navlink">여행일정 찾기</a></li>
    					<li class="#about"><a href="#" id="navlink">명소 찾기</a></li>
    					<li class="#about"><a href="#" id="navlink">커뮤니티</a></li>
    					<li class="#about"><a href="#" id="navlink"  data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">일정 만들기</a></li>  						
    				</ul>
    			</div>
    			<div class="collapse navbar-collapse"  style="float:right;">
    				<ul class="nav navbar-nav">
    					<li class="#about">
    						<div class="dropdown">
    							<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    								${sessionScope.memId} <span class="caret"></span>
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
    					</li>
    				</ul>
    			</div>
    		</div>
    	</nav>	
    	
    	
    	
    	<!-- -----------일정만들기 --- 모달  -->
    	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    		<div class="modal-dialog" >
    		<div class="modal-content" id="modalSize">
      		<div class="modal-header" >
		    	<form action="" method="post">
				<div class="panel panel-success" >
					<div class="panel-heading">
						<h3>새 일정 만들기</h3>
					</div>
					<div class="panel-body" >
						<h4>여행 제목</h4>
						<input type="text" name="subject" class="form-control"  placeholder="예 : 5박 6일 유럽 명소여행" />
					</div>
					<div class="panel-body">
						<h4>여행 단계</h4>
						<input type="radio" name="step" />여행 전
						<input type="radio" name="step" />여행 후
					</div>
					<div class="panel-body" id="date">
						<h4>여행 시작날짜</h4>
						<input type="date" name="date" class="form-control hasDatepicker"  size="10" />
					</div>
					<div class="panel-body">
						<h4>여행 테마</h4>
						<input type="checkbox" value="theme" /> 나홀로여행
						<input type="checkbox" value="theme" /> 친구와 함께 
						<input type="checkbox" value="theme" /> 가족과 함께
						<input type="checkbox" value="theme" /> 단체여행
						<input type="checkbox" value="theme" /> 패키지 여행 
						<input type="checkbox" value="theme" /> 커플 
					</div>
					<div class="panel-body">
						<input type="submit" value="새 일정 만들기"  class="btn btn-success" />
						<input type="button" value="취소" class="btn btn-warning"  />
					</div>
				</div>
				</form>
			</div>
			</div>
			</div>
		</div>
		</c:if>
		
</body>
</html>
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
    		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
			<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
			<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	window.fbAsyncInit = function() {
		FB.init({
			appId : '276172122723346',
			cookie : true, // 쿠키가 세션을 참조할 수 있도록 허용
			xfbml : true, // 소셜 플러그인이 있으면 처리
			version : 'v2.4' // 버전
		});
	};
	function facebooklogin() {
		FB
				.login(
						function(response) {
							if (response.authResponse) {
								FB
										.api(
												'/me',
												function(response) {
													document
															.getElementById('status').innerHTML = 'Thanks for logging in, '
															+ response.name
															+ '!'
															+ response.id
															+ '!!!'
															+ response.picture;
													window.location = "/tvlog/member/loginfbPro.trip?id="
															+ response.id;
												});
							} else {
								console
										.log('User cancelled login or did not fully authorize.');
							}
						}, {
							scope : "user_about_me,email"
						});
	}
</script>
<style type="text/css">
    			#navlink:hover{
    				color : #6B9900;
    				font-weight : bold;
    				font-size : 120%;
    			}
    			#date{
					width : 200px;
				}		
				#modalSize{
					width : 450px;
				}
			
    		</style>
    	</head>
    	<body> 
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
    					<li class="#about"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >로그인</button></li>
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
						<h3>새 일정 만들기</h2>
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
		
		
		<!-- 로그인 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  		<div class="modal-dialog modal-sm">
	    		<div class="modal-content">
	      			<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel" align="center">로그인</h4>
		
	     			</div>
	      			<div class="modal-body">
							<div id="status">
								<div id="fblogin" align="center"> 
									<form id ="fbform" action="#" method="post">
										<button id ="facebtn"  type="button" class="btn btn-primary" onclick="facebooklogin()" style="width:250;">	
										<i id ="facebookfont" class="fa fa-facebook-square"></i>facebook으로 로그인
										</button>
									</form>
								</div>
								<hr>
								<div id="normallogin" align="center">
									<form name="myform" action="/tvlog/member/loginPro.trip" method="post" onSubmit="return checkIt()">
										<INPUT type="text" name="id" size="31" maxlength="12" placeholder="아이디"><br/>
      									<INPUT type=password name="pw"  size="31" maxlength="12" placeholder="비밀번호"><br/>
								</div>
								<div align="right">
									<input type="button" value="아이디/비밀번호 찾기" class="btn btn-primary" style="margin-right:10" onclick="">
								</div>
							</div>
							<br />
	    					<div class="modal-footer" align="center">
	     						<input type="submit" class="btn btn-primary" value="로그인">
								<input type="button" class="btn btn-primary" value="회원가입" onclick="javascript:window.location='/tvlog/member/joinForm.trip'">
							</div>
							</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<c:if test="${sessionScope.memId != null}"></c:if>
		
		
		
		
		
    	</body>
    </html>
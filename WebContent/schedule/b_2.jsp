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
	
	function loginPlease(){
		alter("로그인 후에 이용하세요!");
	}
	
	//로그인할 때 아이디, 비밀번호 입력안한 경우 
	function checkIt(){
        if(!document.myform.id.value){
    
          alert("아이디를 입력하지 않으셨습니다.");
          document.myform.id.focus();
          return false;
        }
        if(!document.myform.passwd.value){
          alert("비밀번호를 입력하지 않으셨습니다.");
          document.myform.passwd.focus();
          return false;
        }
	
	//중복확인 버튼 클릭시 이벤트 
	function confirmClick(userinput){ 
	        if (userinput.id.value==""){
	            alert("아이디를 입력하세요");
	            return;
	        }
	        // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
	        url = "ConfirmId.trip?id=" + userinput.id.value ;   
	        // 새로운 윈도우를 엽니다.
	        open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
	}


	function confirmDomainClick(userinput){ 
	    if (userinput.domain.value==""){
	        alert("도메인을 입력하세요");
	        return;
	    }
	    // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
	    url = "ConfirmDomain.trip?domain=" + userinput.domain.value ;   
	    // 새로운 윈도우를 엽니다.
	    open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
	}



	//필수값(id, pw, pwchk)확인  
	function fsubmit(){
		if(document.userinput.id.value==""||document.userinput.pw.value==""||document.userinput.pw_chk.value==""||document.userinput.member_nm.value==""){
			alert("아이디, 패스워드는  필수 입력사항입니다.");
			return false;
		}else{
	    	return true;  // 정상적인 submit 진행                
		}
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
    	<!-- 로그인 전 -->
    	<c:if test="${sessionScope.memId == null}">
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
    					<li class="#about"><a href="javascript:loginPlease();" id="navlink">일정 만들기</a></li>  						
    				</ul>
    			</div>
    			<div class="collapse navbar-collapse"  style="float:right;">
    				<ul class="nav navbar-nav">
    					<li class="#about"><button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >로그인</button></li>
    				</ul>
    			</div>
    		</div>
    	</nav>	
    	
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
								<input type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-target="#joinmodal" value="회원가입">
							</div>
							</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 회원가입 모달 -->
		<div class="modal fade" id="joinmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel" align="center">회원가입</h4>
					</div>
					<div class="modal-body">
						<form method="post" action="/tvlog/member/joinPro.trip" name="userinput" onSubmit="return fsubmit()" enctype="multipart/form-data">
							<table align="center">
								<tr>
									<td width="130" height="35">사용자 ID</td>
									<td width="400"><input type="text" name="id" size="25" maxlength="12" placeholder="아이디">&nbsp;<input type = "button" value ="아이디 중복확인" onClick="confirmClick(this.form)"/></td>	</td>
								</tr>
								<tr>
									<td width="130" height="35"> 비밀번호</td>
									<td width="400"><input type="password" name="pw" size="25" maxlength="12"placeholder="비밀번호"></td>
								</tr>
								<tr>
									<td width="130" height="35">닉네임</td>
									<td width="400"><input type="text" name="name" size="25" maxlength="12" placeholder="닉네임"></td>
								</tr>
								<tr>
									<td width="130" height="35">도메인</td>
									<td width="400"><input type="text" name="domain" size="25" maxlength="12" placeholder="도메인">&nbsp;<input type = "button" value ="도메인 중복확인" onClick="confirmDomainClick(this.form)"/></td>		
								</tr>
								<tr>
									<td width="130" height="35">프로필 사진 등록</td>
									<td width="400"><input type="file" name="save"></td>
								</tr>
							</table>		
					</div>
					<div class="modal-footer">
						<button type="submit" name="confirm" class="btn btn-primary" >가입하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>


	</c:if>
    	
    	<!-- 로그인 후 -->
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
    						</li>
    					</div>
    				</div>
    			</ul>
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
		</c:if>
		
    	</body>
    </html>
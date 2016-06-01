<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    	<head>
    		<meta charset="UTF-8">
    		<title>bootstrap test</title>
    		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
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
		FB.login(function(response) {
			if (response.authResponse) {
				FB.api('/me',function(response) {
					document.getElementById('status').innerHTML = 'Thanks for logging in, '+ response.name+ '!'+ response.id+ '!!!'+ response.picture;
					window.location = "/tvlog/member/loginfbPro.trip?id="+ response.id;
				});
			} else {
				console.log('User cancelled login or did not fully authorize.');
			}
		},{scope : "user_about_me,email"});
	}
	
	function loginPlease(){
		alter("로그인 후에 이용하세요!");
	}
	
	//로그인할 때 아이디, 비밀번호 입력안한 경우 
	function begin(){
         document.myform.id.focus();
      }
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
	}
	
	//아이디 중복확인 버튼 클릭시 이벤트 
	function confirmClick(userinput){ 
	        if (userinput.id.value==""){
	            alert("아이디를 입력하세요");
	            return;
	        }
	        // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
	        url = "/tvlog/member/ConfirmId.trip?id=" + userinput.id.value ;   
	        // 새로운 윈도우를 엽니다.
	        open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
	}

	//도메인 중복확인 버튼 클릭시 이벤트
	function confirmDomainClick(userinput){ 
	    if (userinput.domain.value==""){
	        alert("도메인을 입력하세요");
	        return;
	    }
	    // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
	    url = "/tvlog/member/ConfirmDomain.trip?domain=" + userinput.domain.value ;   
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
	
	// 로그인 ajax
	function loginSubmit(){
	    $.ajax({
	        type: "post",
	        url : "/tvlog/member/loginPro.trip",
	        data: {	// url 페이지도 전달할 파라미터
	   			id : $('#loginId').val(),
	        	pw : $('#loginPw').val()
	        },
	        success: loginSuccess,	// 페이지요청 성공시 실행 함수
	        error: loginError	//페이지요청 실패시 실행함수
	 	});
	}
	function loginSuccess(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다.
	    $("#loginSpace").html(aaa);
	}
	function loginError(){
	    alert("Error");
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
    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="height:50px;">로그인</button>


	
    	<!-- 로그인 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" id="loginSpace">
	  		<div class="modal-dialog modal-sm">
	    		<div class="modal-content">
	      			<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel" align="center">로그인</h4>
		
	     			</div>
	      			<div class="modal-body">
							<div id="status">
								<div id="fblogin" align="center"> 
									<form id ="fbform" action="/tvlog/member/loginPro.trip" method="post">
										<button id ="facebtn"  type="button" class="btn btn-primary" onclick="facebooklogin()" style="width:250;">	
										<i id ="facebookfont" class="fa fa-facebook-square"></i> facebook으로 로그인
										</button>
									</form>
								</div>
								<hr>
								<div id="normallogin" align="center">
									<INPUT type="text" name="id" id="loginId" size="31" maxlength="12" placeholder="아이디"><br/>
      								<INPUT type=password name="pw" id="loginPw" size="31" maxlength="12" placeholder="비밀번호"><br/><br/>
								</div>
								<div align="right">
									<input type="button" value="비밀번호 찾기" class="btn btn-primary" style="margin-right:10" onclick="">
								</div>
							</div>
							<br />
	    					<div class="modal-footer" align="center">
	     						<input type="button" class="btn btn-primary" value="로그인" onclick="loginSubmit()">
								<input type="button" class="btn btn-primary" data-toggle="modal" data-dismiss="modal" data-target="#joinmodal" value="회원가입">
							</div>
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
					<form method="post" action="/tvlog/member/joinPro.trip" name="userinput" onSubmit="return fsubmit()" enctype="multipart/form-data">
					<div class="modal-body">
							<table style="align:center">
								<tr>
									<td width="130" height="35">사용자 ID</td>
									<td width="400"><input type="text" name="id" size="25" maxlength="12" placeholder="아이디">&nbsp;<input type = "button" value ="아이디 중복확인" onClick="confirmClick(this.form)"/></td>
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
							<hr>
							<button type="submit" name="confirm" class="btn btn-primary" style="align:right">가입하기</button>		
					</div>
					</form>
				</div>
			</div>
		</div>


	</c:if>
    	
    	<!-- 로그인 후 -->
    	<c:if test="${sessionScope.memId != null}">
    	
    	<div class="dropdown">
    		<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true" style="height:50px;">
    			${sessionScope.memId} <span class="caret"></span>
    		</button>
    		<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
				<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/member/myPage.trip">마이페이지</a></li>
				<li class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">여행일정</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">여행일기</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">포스트</a></li>
				<li class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/member/logout.trip">로그아웃</a></li>
			</ul>
		</div>
		</c:if>
		
    	</body>
    </html>
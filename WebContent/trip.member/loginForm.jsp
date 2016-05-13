<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="/jsmusic/webapp/user/mun/css/login.css"/> 
<script src="/jsmusic/webapp/user/mun/js/facebook.js" type="text/javascript"></script>
<script src="/jsmusic/webapp/user/mun/js/google.js" type="text/javascript"></script>
<script src="/jsmusic/webapp/user/mun/js/login.js" type="text/javascript"></script>
<script>
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
  

window.fbAsyncInit = function() {
  FB.init({
    appId      : '276172122723346',
    cookie     : true,  // 쿠키가 세션을 참조할 수 있도록 허용
    xfbml      : true,  // 소셜 플러그인이 있으면 처리
    version    : 'v2.4' // 버전
  });
  
};

  // 로그인이 성공한 다음에는 간단한 그래프API를 호출한다.
  // 이 호출은 statusChangeCallback()에서 이루어진다.
  function facebooklogin(){
	  FB.login(function(response) {
		  if (response.authResponse) {
			  FB.api('/me',  function(response) {
			      document.getElementById('status').innerHTML =
			        'Thanks for logging in, ' + response.name + '!'+response.id+'!!!'+response.picture;
			    });
		  } else {
			  console.log('User cancelled login or did not fully authorize.');
		  }
	  }, {scope: "user_about_me,email"} );
  
}
  function facebooklogout() {
	    FB.getLoginStatus( function(response) {
	        if (response.status === 'connected') 
	        {
	        	FB.logout(function(response) {
	        		console.log(response.status);
	        	});
	        } else if (response.status === 'not_authorized') {
	        } else {
	        }
	    });
	    
	}
</script>


<div class="container">
	<!-- 버튼 -->
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
	 로그인
	</button>

	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">로그인</h4>
		
<fb:login–button scope=“public_profile,email” onlogin=“checkLoginState();”>
</fb:login–button>
	      </div>
	      <div class="modal-body">
	     
<!DOCTYPE html>

   <script language="javascript">
 

     <!--
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
     -->
  </script>


<BODY onload="begin()">
<div id=“status”>




<!--
  아래는 소셜 플러그인으로 로그인 버튼을 넣는다.
  이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 클릭시 FB.login() 함수를 실행하게 된다.
-->

<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>

<div id="status">
</div>

<form id ="fbform" action="#" method="post">

				<div id="social" class="form-group">
					<button id ="facebtn"  type="button" class="btn btn-primary" onclick="facebooklogout()">	
					<i id ="facebookfont" class="fa fa-facebook-square"></i>logout</button>
				</div>
				
</form>

<form name="myform" action="loginPro.trip" method="post" onSubmit="return checkIt()">

      ID: <INPUT type="text" name="id" size="15" maxlength="12"><br/>
      PW: <INPUT type=password name="pw"  size="15" maxlength="12"><br/>





  </div>
	     <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<input type=button value="Join" class="btn btn-primary" onclick="javascript:window.location='joinForm.trip'">
		
		<input type="submit" class="btn btn-primary" value="Login">
	
	    </div>
</form>
</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/jsmusic/webapp/user/mun/css/login.css"/> 
<script src="/jsmusic/webapp/user/mun/js/facebook.js" type="text/javascript"></script>
<script src="/jsmusic/webapp/user/mun/js/google.js" type="text/javascript"></script>
<script src="/jsmusic/webapp/user/mun/js/login.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<c:if test="${sessionScope.memId !=null}">
${sessionScope.memId}님 로그인 되셨습니다!!!!!!!!!!!!!
</c:if>
<img src="/tvlog/img/member/${imgPath}" width="200" height="200">
<form action="/tvlog/member/logout.trip">
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
function facebooklogout() {

    FB.getLoginStatus( function(response) {
        if (response.status === 'connected') 
        {
        	FB.logout(function(response) {
        		window.location="/tvlog/member/logout.trip";
        		console.log(response.status);
        	});
        } else if (response.status === 'not_authorized') {
        } else {
        }
    });
}
function logout(){
	window.location="/tvlog/member/logout.trip";
}
</script>
<c:if test="${sessionScope.fb == 1 }">
	<input type="button" value="로그아웃" onclick="facebooklogout()">
</c:if>
<c:if test="${sessionScope.fb == 0 }">
	<input type="button" value="로그아웃" onclick="logout()">
</c:if>
</form>

<form action="/tvlog/member/deleteForm.trip">
<input type="submit" value="탈퇴">
</form>
<form action="/tvlog/member/modifyForm.trip" method="post">
<input type="button" value="수정">
</form>


<c:if test="${sessionScope.memId==null}">
<script>
alert("id&pw확인하세요");
history.go(-1);
</script>
</c:if>

<input type="button" value="확인 " onclick="javascript:window.location='main.trip'"/>
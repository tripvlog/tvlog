<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Bootstrap Uses a fixed left sidebar, that attaches after scrolling past a large top header. example snippet for Bootstrap." />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- CSS code from Bootply.com editor -->

<style type="text/css">
	#navlink:hover{
    	color : #6B9900;
    	font-weight : bold;
    	font-size : 120%;
    }		
	body {
		padding-top: 2px;
	}
	#content{
		width: 1200px;
	}

</style>

	<!-- JavaScript jQuery code from Bootply.com editor  -->

	<script type='text/javascript'> 
		$(document).ready(function() {
			var $body = $(document.body);
			var navHeight = $('.navbar').outerHeight(true) + 10;

			$body.scrollspy({
				target : '#leftCol',
				offset : navHeight
			});

		});
		
		function mainBody(){
	        $.ajax({
		        type: "post",
		        url : "/tvlog/member/loginForm.trip",
		       
		        success: mainSuccess,	// 페이지요청 성공시 실행 함수
		        error: mainError	//페이지요청 실패시 실행함수
	     	});
	    }
	    function mainSuccess(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
	        $("#loginSpace").html(aaa);
	        console.log(resdata);
	    }
	    function mainError(){
	        alert("Error");
	    }
	</script>

	<script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
          ga('create', 'UA-40413119-1', 'bootply.com');
          ga('send', 'pageview');
	</script>

</head>

<!-- HTML code from Bootply.com editor -->

<body onload="mainBody()" style="width:1200">
<div class="container">
	<!-- 상단 메뉴바 -->
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
    		<div class="collapse navbar-collapse"  style="float:right;" id="loginSpace">
    		</div>
    	</div>
    </nav>

	<div id="content">

	<!-- 메인 지도 -->
	<iframe src="/tvlog/main/cluster.jsp" name="map" width="1140" height="410" ALLOWTRANSPARENCY="false"frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>

	</div>

</div>	
</body>
</html>
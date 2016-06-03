<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
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
		margin: 0px;
	}
	.post-content{
		width : 370px; 
		height: 250px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px; 
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}
	#logo{
		width: 80px;
		height:50px;
		padding: 0;
		margin: 0;
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
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
    	<div class="container-fluid">
    		<div class="navbar-header" style="float: left;">
    			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
    			</button>
    			<a id="logo" class="navbar-brand" href="/tvlog/main/main.trip"><img src="/tvlog/img/logo/logo.png" style="width:80px;height:50px;margin=0;padding:0" ></a>
    		</div>
    		<div class="collapse navbar-collapse"  style="float:left;">
    			<ul class="nav navbar-nav">
    				<li class="#about"><a href="/tvlog/main/findSchedule.trip" id="navlink">여행일정 찾기</a></li>
    				<li class="#about"><a href="/tvlog/main/findPlace.trip" id="navlink">명소 찾기</a></li>
    				<li class="#about"><a href="/tvlog/band/b_list.trip" id="navlink">밴드</a></li>
    				<li class="#about"><a href="/tvlog/main/community.trip" id="navlink">커뮤니티</a></li>
    				<li class="#about"><a href="#" id="navlink"  data-toggle="modal" data-target="#scheduleModal" data-whatever="@mdo">일정 만들기</a></li>  						
    			</ul>
    		</div>
    		<div class="collapse navbar-collapse"  style="float:right;margin-top:20" id="loginSpace">
    		</div>
    	</div>
    </nav>
    
    <!-- -----------일정만들기 --- 모달  -->
    	<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    		<div class="modal-dialog" >
    		<div class="modal-content" id="modalSize">
      		<div class="modal-header" >
		    	<form action="/tvlog/schedule/schedule-new.trip" method="post">
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
						<input type="button" value="취소" class="btn btn-warning" data-dismiss="modal" />
					</div>
				</div>
				</form>
			</div>
			</div>
			</div>
		</div>

	<div id="content">

	<!-- 메인 지도 -->
	<iframe src="/tvlog/main/cluster.jsp" name="map" width="1140" height="410" ALLOWTRANSPARENCY="false"frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	
	</div>

	<div id="post">
		<h3 style="background-color:skyblue;">POST</h3>
		<table  width="1140px">
			<c:forEach begin="0" end="${(fn:length(postList) + 2) / 3 - 1}" var="row">
				<tr>
				    <c:forEach begin="0" end="2" var="col">
				        <c:set var="post" value="${postList[row * 3 + col]}"/>
				        <c:if test="${not empty post}">
				        <td  width="380px"> 
				        	<div class="post-content" style="background-image:url('${post.file_savname}');" onclick="window.location='/tvlog/post/postList.trip'">
				        		${post.subject }
				        	</div>
				        </td>
				        </c:if>
				    </c:forEach>	
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="band">
		<h3 style="background-color:green;">BAND</h3>
		<table  width="1140px">
			<c:forEach begin="0" end="${(fn:length(bandList) + 2) / 3 - 1}" var="row">
				<tr>
				    <c:forEach begin="0" end="2" var="col">
				        <c:set var="band" value="${bandList[row * 3 + col]}"/>
				        <c:if test="${not empty band}">
				        <td  width="380px">
				        	<div class="post-content" style="background-image:url('/tvlog/img/band/${band.band_img}');" onclick="window.location='/tvlog/band/b_view.trip?band_id=${band.band_id}'">
				        		${band.band_name }
				        	</div>
				        </td>
				        </c:if>
				    </c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	
</body>
</html>
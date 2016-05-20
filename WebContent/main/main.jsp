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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"  ></script>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- CSS code from Bootply.com editor -->

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
body {
	padding-top: 50px;
}

#masthead {
	min-height: 270px;
	background-color: #000044;
	color: #aaaacc;
}

#masthead h1 {
	font-size: 55px;
	line-height: 1;
}

#masthead .well {
	margin-top: 13%;
	background-color: #111155;
	border-color: #000033;
}

@media screen and (min-width: 768px) {
	#masthead h1 {
		font-size: 100px;
	}
}
#top-banner{
	background-color: #FFFFFF;
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

<body>
	<header class="navbar navbar-bright navbar-fixed-top" role="banner" id="top-banner">
		<div class="container">
			<div class="navbar-header">
				<!-- 상단 메뉴 시작 -->
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"></button>
							<a class="navbar-brand" href="#">Trip Blog</a>
						
							<ul class="nav navbar-nav">
								<li class="#about"><a href="#" id="navlink">여행일정 찾기</a></li>
								<li class="#about"><a href="#" id="navlink">명소 찾기</a></li>
								<li class="#about"><a href="#" id="navlink">커뮤니티</a></li>
								<li class="#about"><a href="#" id="navlink" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">일정 만들기</a></li>
								<li class="#about"><a href="#"></a>
							</ul>
				<!-- 상단 메뉴 끝 -->
			</div>
		</div>
	</header>
	<!-- 여행 일정 제목 들어갈 곳 -->
	<div id="masthead">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h3>
						여행 일정 제목
					</h3>
				</div>
			</div>
		</div>
	</div>

	<!-- Begin Body -->
	<div class="container">
		<div class="row">
			<div class="col-md-3" id="leftCol">
				<h3>왼쪽 그룹</h3>
				<br><br><br>131313<br>131<br>13<br>1<br>1<br>1<br>1<br><br><br><br><br><br>1<br>1<br><br><br><br>1<br><br><br>
			</div>
			<div class="col-md-9" id="mainCol">
				<h3>오른쪽 그룹</h3>
				<br><br><br>131313<br>131<br>13<br>1<br>1<br>1<br>1<br><br><br><br><br><br>1<br>1<br><br><br><br>1<br><br><br>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- -----------일정만들기 --- 모달  -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content" id="modalSize">
							<div class="modal-header">
								<form action="" method="post">
									<div class="panel panel-success">
										<div class="panel-heading">
											<h3>
												새 일정 만들기
												</h2>
										</div>
										<div class="panel-body">
											<h4>여행 제목</h4>
											<input type="text" name="subject" class="form-control"
												placeholder="예 : 5박 6일 유럽 명소여행" />
										</div>
										<div class="panel-body">
											<h4>여행 단계</h4>
											<input type="radio" name="step" />여행 전 <input type="radio"
												name="step" />여행 후
										</div>
										<div class="panel-body" id="date">
											<h4>여행 시작날짜</h4>
											<input type="date" name="date"
												class="form-control hasDatepicker" size="10" />
										</div>
										<div class="panel-body">
											<h4>여행 테마</h4>
											<input type="checkbox" value="theme" /> 나홀로여행 <input
												type="checkbox" value="theme" /> 친구와 함께 <input
												type="checkbox" value="theme" /> 가족과 함께 <input
												type="checkbox" value="theme" /> 단체여행 <input
												type="checkbox" value="theme" /> 패키지 여행 <input
												type="checkbox" value="theme" /> 커플
										</div>
										<div class="panel-body">
											<input type="submit" value="새 일정 만들기" class="btn btn-success" />
											<input type="button" value="취소" class="btn btn-warning" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
</body>
</html>
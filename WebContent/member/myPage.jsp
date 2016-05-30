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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
	#menuBar{		
		margin-bottom: 0px;
	}
	#profile {
		min-height: 270px;
		background-color: #BDBDBD;
		width:1140;
		height:410;
		margin-top:0px;
	}

</style>
<script>
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
</head>
<body onload="mainBody()" style="width:1200">
<div class="container">
	<div id="menuBar">
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
	</div>	
		
	<div id="profile">
	
	</div>
	
	<div id="myPageMenu">
		<ul id="myTab" class="nav nav-tabs" role="tablist">
	  		<li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">알림</a></li>
	  		<li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">친구</a></li>
	  		<li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">밴드</a></li>
	  		<li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">포스트</a></li>
	  		<li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">회원정보수정</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
	  		<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	 			첫번째 탭 내용
	 		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	  			두번째 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	  			세번째 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	  			네번째 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	  			네번째 탭 내용
	  		</div>
		</div>
	</div>
</div>	
</body>
</html>
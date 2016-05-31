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
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	#profile {
		min-height: 270px;
		background-image:url('/tvlog/img/member/myPageDefault.png');
		width:1140;
		height:410;
		margin-top:0px;
		text-align: center;
		position:relative; 
	}
	#profile p{
		position:absolute;
		width:200px; left:0; right:0; margin-left:auto; margin-right:auto;
		height:120px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; 
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
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
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
    </div>
    
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
						<input type="button" value="취소" class="btn btn-warning"  data-dismiss="modal"/>
					</div>
				</div>
				</form>
			</div>
			</div>
			</div>
		</div>
    
    
	<div id="profile">
		<p><img src="/tvlog/img/member/${dto.path}" width="100" height="100" style="align:center">
		<br /><font size="5">${dto.name}</font></p>
	</div>
	
	
	<div id="myPageMenu">
		<ul id="myTab" class="nav nav-tabs" role="tablist">
	  		<li role="presentation" class="active"><a data-target="#alarm" id="alarm-tab" role="tab" data-toggle="tab" aria-controls="alarm" aria-expanded="true">알     림</a></li>
	  		<li role="presentation" class=""><a data-target="#friend" role="tab" id="friend-tab" data-toggle="tab" aria-controls="friend" aria-expanded="false">친       구</a></li>
	  		<li role="presentation" class=""><a data-target="#band" role="tab" id="band-tab" data-toggle="tab" aria-controls="band" aria-expanded="false">밴        드</a></li>
	  		<li role="presentation" class=""><a data-target="#schedule" role="tab" id="schedule-tab" data-toggle="tab" aria-controls="schedule" aria-expanded="false">여 행 일 정</a></li>
	  		<li role="presentation" class=""><a data-target="#post" role="tab" id="post-tab" data-toggle="tab" aria-controls="post" aria-expanded="false">포  스  트</a></li>
	  		<li role="presentation" class=""><a data-target="#modify" role="tab" id="modify-tab" data-toggle="tab" aria-controls="modify" aria-expanded="false">회원 정보 수정</a></li>
		</ul>
		<div id="myTabContent" class="tab-content"> 
	  		<div role="tabpanel" class="tab-pane fade active in" id="alarm" aria-labelledby="alarm-tab" >
	 			알림 탭 내용
	 		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="friend" aria-labelledby="friend-tab">
	  			친구 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="band" aria-labelledby="band-tab">
	  			밴드 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="schedule" aria-labelledby="schedule-tab">
	  			여행일정 탭 내용
	  		</div>
	  		<div role="tabpanel" class="tab-pane fade" id="post" aria-labelledby="post-tab">
	  			포스트 탭 내용
	  			<form action="/tvlog/member/modifyForm.trip" method="post">
					<input type="submit" value="회원 정보 수정" id="memberModify">
				</form>
				<form action="/tvlog/member/deleteForm.trip">
					<input type="submit" value="회원 탈퇴" id="memberDelete">
				</form>
	  			
			</div>
		    <!-- 회원정보 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="modify" aria-labelledby="modify-tab"> 			
	  			<div class="col-sm-2">
					<ul id="myTab6" class="nav nav-pills nav-stacked" role="tablist">
						<li role="presentation" class="active"><a href="#memberModify" id="memberModify-tab6" role="tab" data-toggle="tab" aria-controls="memberModify" aria-expanded="false">회원 정보 수정</a></li>
						<li role="presentation" class=""><a href="#memberDelete" role="tab" id="memberDelete-tab6" data-toggle="tab" aria-controls="memberDelete" aria-expanded="true">회원 탈퇴</a></li>
					</ul>
				</div>
				<div class="col-sm-10">
					<div id="myTabContent6" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in" id="memberModify" aria-labelledby="memberModify-tab6">
							<%@ include file="/member/modifyForm.jsp" %>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="memberDelete" aria-labelledby="memberDelete-tab6">
							<%@ include file="/member/deleteForm.jsp" %>
						</div>
					</div>
				</div>
	  			
				
	  		</div>
		</div>
	</div>
</div>	
</body>
</html>
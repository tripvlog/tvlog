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
	<style type="text/css">
		#navlink:hover{
	    	color : #6B9900;
	    	font-weight : bold;
	    	font-size : 120%;
	    }		
		body { padding-top: 2px; }
		#content{ width: 1200px; }
		#logo{
			width: 80px;
			height:50px;
			padding: 0;
			margin: 0;
		}
	</style>
	<script type='text/javascript'> 
		$(document).ready(function() {
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "content",
			    sSkinURI: "/tvlog/diary/diary_editor/SmartEditor2Skin.html",
			    fCreator: "createSEditor2"
			});
			
			$("#savebutton").click(function(){
			    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			    $("#frm").submit();
			   
				})
				
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
</head>
<body onload="mainBody()" >
<div class="container">
	<!-- 상단 메뉴바 -->
	<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
    	<div class="container-fluid">
    		<div class="navbar-header" style="float: left;">
    			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
    			</button>
    			<a id="logo" class="navbar-brand" href="/tvlog/main/main.trip"><img src="/tvlog/img/logo/logo.png" style="width:80px;height:50px;margin=0;padding:0"></a>
    		</div>
    		<div class="collapse navbar-collapse"  style="float:left;">
    			<ul class="nav navbar-nav">
    				<li class="#about"><a href="/tvlog/main/findSchedule.trip" id="navlink">여행일정 찾기</a></li>
    				<li class="#about"><a href="/tvlog/main/findPlace.trip" id="navlink">명소 찾기</a></li>
    				<li class="#about"><a href="/tvlog/band/b_list.trip" id="navlink">밴드</a></li>
    				<li class="#about"><a href="/tvlog/post/postList.trip" id="navlink">포스트</a></li>
    				<li class="#about"><a href="/tvlog/main/community.trip" id="navlink">다이어리</a></li>
    				<li class="#about"><a href="#" id="navlink"  data-toggle="modal" data-target="#scheduleModal" data-whatever="@mdo">일정 만들기</a></li>  						
    				<!-- 관리자 로그인 -->
    				<c:if test="${sessionScope.memId == 'tripvlog05'}">
    					<li class="#about"><a href="/tvlog/admin/adminMain.trip" id="navlink">관리자</a></li>
    				</c:if>
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
								<input type="text" name="s_title" class="form-control"  placeholder="예 : 5박 6일 유럽 명소여행" />
							</div>
							<div class="panel-body">
								<h4>여행 단계</h4>
								<input type="radio" name="s_step" value="0" />여행 전
								<input type="radio" name="s_step" value="1" />여행 후
							</div>
							<div class="panel-body" id="date">
								<h4>여행 시작날짜</h4>
								<input type="date" name="s_startday" class="form-control hasDatepicker"  size="10" />
							</div>
							<div class="panel-body">
								<h4>여행 테마</h4>
								<input type="checkbox" name="s_theme" value="나홀로여행" /> 나홀로여행
								<input type="checkbox" name="s_theme"  value="친구와 함" /> 친구와 함께 
								<input type="checkbox" name="s_theme"  value="가족과 함께" /> 가족과 함께
								<input type="checkbox" name="s_theme"  value="단체여행" /> 단체여행
								<input type="checkbox" name="s_theme"  value="패키지 여행" /> 패키지 여행 
								<input type="checkbox" name="s_theme"  value="커플" /> 커플 
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
</div>	
</body>
</html>
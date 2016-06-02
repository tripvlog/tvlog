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
		background-image:url('/tvlog/img/myPage/myPageDefault.png');
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
	  		<!-- 알림 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade active in" id="alarm" aria-labelledby="alarm-tab" >
	 			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />111<br /><br /><br />111<br /><br /><br /><br /><br /><br />11111<br /><br /><br /><br /><br />5555<br /><br /><br /><br /><br />1111<br /><br /><br /><br /><br /><br /><br /><br /><br />33333333333
	 		</div>
	 		<!-- 친구 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="friend" aria-labelledby="friend-tab">
	  			<div class="col-sm-2">
					<ul id="myTab6" class="nav nav-pills nav-stacked" role="tablist">
						<li role="presentation" class="active"><a href="#friendSelect" id="friendSelect-tab6" role="tab" data-toggle="tab" aria-controls="friendSelect" aria-expanded="false">친구 검색</a></li>
						<li role="presentation" class=""><a href="#friendList" role="tab" id="#friendList-tab6" data-toggle="tab" aria-controls="friendList" aria-expanded="true">친구 목록</a></li>
					</ul>
				</div>
				<div class="col-sm-10">
					<div id="myTabContent6" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in" id="friendSelect" aria-labelledby="friendSelect-tab6">
							친구검색
						</div>
						<div role="tabpanel" class="tab-pane fade" id="friendList" aria-labelledby="friendList-tab6">
							친구목록
						</div>
					</div>
				</div>
	  		</div>
	  		<!-- 밴드 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="band" aria-labelledby="band-tab">
	  			
	  		</div>
	  		<!-- 여행일정 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="schedule" aria-labelledby="schedule-tab">
	  			
	  		</div>
	  		<!-- 포스트 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="post" aria-labelledby="post-tab">
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
						<li role="presentation" class="active"><a href="#home6" id="home-tab6" role="tab" data-toggle="tab" aria-controls="home6" aria-expanded="false">회원 정보 수정</a></li>
						<li role="presentation" class=""><a href="#profile6" role="tab" id="profile-tab6" data-toggle="tab" aria-controls="profile6" aria-expanded="true">회원 탈퇴</a></li>
					</ul>
				</div>
				<div class="col-sm-10">
					<div id="myTabContent6" class="tab-content">
						<div role="tabpanel" class="tab-pane fade active in" id="home6" aria-labelledby="home-tab6">
								<center><h1>회원 정보 수정</h1></center>								
								<form enctype="multipart/form-data" method="post" action="/tvlog/member/modifyPro.trip" name="userinput" onsubmit="return checkIt()">
									<table align="center" border="2" width="750">
										<tr>
											<td>아이디</td>
											<td>${dto.id}</td>
										</tr>
										<tr>
											<td width="200">비밀번호</td>
											<td width="400"><input type="password" name="pw" size="15" maxlength="12" value="${dto.pw}"></td>
										<tr>
											<td width="200">닉네임</td>
											<td width="400"><input type="text" name="name" size="15" maxlength="12" value="${dto.name}"></td>
										</tr>
										<tr>
											<td width="200">도메인</td>
											<td width="400"><input type="text" name="domain" size="15" maxlength="12" value="${dto.domain}">&nbsp;&nbsp;
												<input type="button" value="중복확인" onClick="confirmDomainClick(this.form)" />&nbsp&nbsp
												<font color="blue"> * 중복확인 버튼을 클릭</font>
											</td>
										</tr>
										</td>
										</tr>
										<tr>
											<td width="200">프로필 사진 등록</td>
											<td width="400"><input type="file" name="path" value="${dto.path}"></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<input type="submit"name="modify" value="수   정"> 
											</td>
										</tr>
									</table>
								</form>
							</div>
						<div role="tabpanel" class="tab-pane fade" id="profile6" aria-labelledby="profile-tab6">
							<p>Profile content</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Bootstrap Uses a fixed left sidebar, that attaches after scrolling past a large top header. example snippet for Bootstrap." />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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
	#logo{
		width: 80px;
		height:50px;
		padding: 0;
		margin: 0;
	}
	
	#friend-list{
		text-align: center; 
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
	    
	    function OpenWindow(url,intWidth,intHeight) { 
		      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
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
    			<a id="logo" class="navbar-brand" href="/tvlog/main/main.trip"><img src="/tvlog/img/logo/logo.png" style="width:80px;height:50px;margin=0;padding:0"></a>
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
	  		<li role="presentation" class=""><a data-target="#diary" role="tab" id="diary-tab" data-toggle="tab" aria-controls="diary" aria-expanded="false">여 행 일 기</a></li>
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
	  			<div id="totalDiv" style="margin-left: 15px">
	  				<h4><button type="button" onClick="javascript:OpenWindow('/tvlog/post/friendManage.trip?','600','650')" class="btn btn-success">친구관리</button></h4>
					<c:if test="${myFriendListCount != 0}">
						<h4>내 친구 목록 (${myFriendListCount} 개)</h4>
						<table >
							<c:forEach begin="0" end="${(fn:length(friend) + 3) / 4 - 1}" var="row">
								<tr>
				    				<c:forEach begin="0" end="3" var="col">
										<c:set var="friendDTO" value="${friend[row * 4 + col]}"/>
										<c:if test="${not empty friendDTO}">
				        					<td>
				        						<div id="friend-list" onclick="window.location=''">
					        						<img src="/tvlog/img/member/${friendDTO.path}" width="100" height="100" style="align:center;border-radius:30px; ">
					        						<br />
					        						${friendDTO.name}					    
				        						</div>
				        					</td>
				        				</c:if>
				    				</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${myFriendListCount == 0}">
						등록된 친구가 없습니다.
					</c:if>
				</div>
	  		</div>
	  		
	  		<!-- 밴드 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="band" aria-labelledby="band-tab">
	  			<div id="totalDiv" style="margin-left: 15px">
	  				<h4>밴드로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/band/b_list.trip'"></h4>
					<c:if test="${myBandListCount != 0}">
						<h4>모든 밴드 검색 (${myBandListCount} 개)</h4>
							<table >
								<c:forEach begin="0" end="${(fn:length(band) + 3) / 4 - 1}" var="row">
									<tr>
					    				<c:forEach begin="0" end="3" var="col">
											<c:set var="bandDTO" value="${band[row * 4 + col]}"/>
											<c:if test="${not empty bandDTO}">
					        					<td>
					        						<div id="band-list" onclick="window.location=''">
						        						<img src="/tvlog/img/band/${bandDTO.band_img}" width="100" height="100" style="align:center;border-radius:30px; ">
						        						<br />
						        						${bandDTO.band_name}<br />					    
					        							${bandDTO.band_leader}<br />
					        							${bandDTO.band_intro}
					        						</div>
					        					</td>
					        				</c:if>
					    				</c:forEach>
									</tr>
								</c:forEach>
							</table>
					</c:if>
					<c:if test="${myBandListCount == 0}">
						등록된 밴드가 없습니다.
					</c:if>
				</div>
	  		</div>
	  		
	  		<!-- 여행일정 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="schedule" aria-labelledby="schedule-tab">
	  			<div id="totalDiv" style="margin-left: 15px">
					<c:if test="${myScheduleListCount != 0}">
					<h4>모든 일정 검색 (${myScheduleListCount} 개)</h4>
					<table width="1000" border="1" cellspacing="0" cellpadding="2">
						<tr align="center">
							<td>일정 작성자</td>
							<td>여행 제목</td>
							<td>여행 시작일</td>
							<td>여행 끝난일</td>
						</tr>
						<c:forEach var="schedule" items="${schedule}">
						<tr align="center">
							<td>${schedule.s_writer}</td>
							<td>${schedule.s_title}</td>
							<td>${schedule.s_startday}</td>
							<td>${schedule.s_endday}</td>
						</tr>
						</c:forEach>
					</table>
					</c:if>
					<c:if test="${myScheduleListCount == 0}">
						등록된 일정이 없습니다.
					</c:if>
				</div>
	  		</div>
	  		
	  		<!-- 여행일기 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="diary" aria-labelledby="diary-tab">
	  			<div id="totalDiv" style="margin-left: 15px" >
	  				<h4>일기로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/diary/list.trip'"></h4>
					<c:if test="${myDiaryListCount != 0}">
					<!-- 일기 검색 -->
					<h4>모든 일기 검색 (${myDiaryListCount} 개)</h4>
					<table width="900" border="1" cellspacing="0" cellpadding="2" >
						<tr align="center">
							<td>일기 번호</td>
							<td>일기 작성자</td>
							<td>일기 제목</td>
							<td>일기 등록 날짜</td>
						</tr>
						<c:forEach var="diary" items="${diary}">
						<tr align="center">
							<td>${diary.diary_num}</td>
							<td>${diary.diary_writer}</td>
							<td>${diary.diary_title}</td>
							<td>${diary.diary_reg}</td>
						</tr>
						</c:forEach>
					</table>
					<!-- 일기 검색 끝 -->
					</c:if>
					<c:if test="${myDiaryListCount == 0}">
						등록된 일기가 없습니다.
					</c:if>
				</div>
	  		</div>
	  		
	  		<!-- 포스트 탭 내용 -->
	  		<div role="tabpanel" class="tab-pane fade" id="post" aria-labelledby="post-tab">
	  			<div id="totalDiv" style="margin-left: 15px">
	  				<h4>포스트로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/post/postList.trip'"></h4>
					<c:if test="${myPostListCount != 0}">
						<h4>내가 쓴 포스트 (${myPostListCount} 개)</h4>
						<table width="1000" border="1" cellspacing="0" cellpadding="2">
							<tr align="center">
								<td>작성자</td>
								<td>포스트 제목</td>
								<td>포스트 등록 날짜</td>
								<td>좋아요</td>
							</tr>
							<c:forEach var="post" items="${post}">
								<tr align="center">
									<td>${post.id}</td>
									<td>${post.subject}</td>
									<td>${post.regdate}</td>
									<td>${post.good}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${myPostListCount == 0}">
						등록한 포스트가 없습니다.
					</c:if>
				</div>
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
										</tr>
										<tr>
											<td width="200">닉네임</td>
											<td width="400"><input type="text" name="name" size="15" maxlength="12" value="${dto.name}"></td>
										</tr>
										<tr>
											<td width="200">도메인</td>
											<td width="400"><input type="text" name="domain" size="15" maxlength="12" value="${dto.domain}">&nbsp;&nbsp;
												<input type="button" value="중복확인" onClick="confirmDomainClick(this.form)" />&nbsp&nbsp
												<font color="blue"> * 중복확인 버튼을 클릭</font> </td>
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
							<center><h1>회원 정보 수정</h1></center>	
							<form name="myform" action="/tvlog/member/deletePro.trip" method="post">
								<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
									<TR height="30">
										<TD width="110" align=center>비밀번호</TD>
										<TD width="150" align=center><INPUT type=password name="pw" size="15" maxlength="12"></TD>
									</TR>
									<TR height="30">
										<TD colspan="2" align="center"><INPUT type=submit value="회원탈퇴"></TD>
									</TR>
								</TABLE>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
</body>
</html>
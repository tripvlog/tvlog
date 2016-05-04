<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

<style>
	#checklist-tab {
   		list-style:none;
   		margin:0;
    	padding:0;
	}
	#tab-li {
		width:95px;
    	margin: 0 0 0 0;
    	padding: 0 0 0 0;
    	border : 0;
    	float: left;
	}	
	#m-tab-li{
		width:95px;
		margin: 0 0 0 0;
    	padding: 0 0 0 0;
    	border : 0;
    	float: left;
	}
</style>

</head>
<body>
<!-- 참고 사이트 : http://zzznara2.tistory.com/593 -->
<div class="container" id="container">
<div>title</div>
&nbsp;
	<div class="row" id="containerTwo">
		<!-- 왼쪽 버튼 그룹 - 저장, 방문명소 -->
		<div class="col-md-2" id="savecontainer">
			<div id="btn-group" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg" id="scheduleSave" style="WIDTH:81pt" onclick="scheduleSave()"><i class="fa fa-floppy-o" aria-hidden="true"></i>저장하기</button>
				<button type="button" class="btn btn-default btn-lg" style="WIDTH:55pt"><i class="fa fa-times" aria-hidden="true"></i>취소</button>
			</div>
			<p></p>
			<div id="btn-group2" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg btn-block"><i class="fa fa-map-marker" aria-hidden="true"></i>방문명소</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#money"><i class="fa fa-krw" aria-hidden="true"></i>여행가계부</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#checklistmodal"><i class="fa fa-check-square-o" aria-hidden="true"></i>체크리스트</button>
					<!-- 가계부 모달 팝업 -->
					<!-- 모달 팝업 -->
					<div class="modal fade" id="money" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  					<div class="modal-dialog">
	    				<div class="modal-content">
	      				<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
							<h4 class="modal-title" id="myModalLabel">여행가계부</h4>
	      				</div>
	      				<div class="modal-body">
	      					<div class="checklist">
	     						<div class="tab-pane plantab de" id="tab4">
	     							<div class="checklist">
	     								<!-- STR_START : checklist tab 목록 -->
	     								<ul class="nav money-tab" id="money-tab">
	     									<!-- 체크리스트 메뉴 -->
	     									<li id="m-tab-li" class="active" style="margin-right:0;">
	     										<a target="_self" href="#m-tab1" class="btn mylist" data-toggle="tab" aria-expanded="true">전체 비용</a>
	     									</li>
	     									<li id="m-tab-li">
	     										<a target="_self" href="#m-tab2" class="btn" data-toggle="tag">일일 지출</a>
	     									</li>
	     									<li id="m-tab-li">
	     										<a target="_self" href="#m-tab3" class="btn" data-toggle="tag">방문 명소</a>
	     									</li>
	     								</ul>
	     							</div>
	     						</div>
	     					</div>
							모달 내용
	      				</div>
	      				<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
	      				</div>
	    				</div>
	  					</div>
					</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					<!-- 체크리스트 모달 팝업 -->
					<div class="modal fade" id="checklistmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  					<div class="modal-dialog modal-lg">
	    				<div class="modal-content">
	      				<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<!-- 모달 제목 -->
								<h4 class="modal-title" id="myModalLabel">체크 리스트</h4>
	      				</div>
	      				<!-- 모달 안에 내용 넣기 -->
	     				<div class="modal-body">
	     					<div class="checklist">
	     						<div class="tab-pane plantab de" id="tab4">
	     							<div class="checklist">
	     								<!-- STR_START : checklist tab 목록 -->
	     								<ul class="nav checklist-tab" id="checklist-tab">
	     									<!-- 체크리스트 메뉴 -->
	     									<li id="tab-li" class="active" style="margin-right:0;">
	     										<a target="_self" href="#ch-tab1" class="btn mylist" data-toggle="tab" aria-expanded="true">My List</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab2" class="btn" data-toggle="tag">출국</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab3" class="btn" data-toggle="tag">해변여행</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab4" class="btn" data-toggle="tag">배낭여행</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab5" class="btn" data-toggle="tag">비상약</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab6" class="btn" data-toggle="tag">전자제품</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab7" class="btn" data-toggle="tag">세면도구</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab8" class="btn" data-toggle="tag">화장품</a>
	     									</li>
	     									<li id="tab-li">
	     										<a target="_self" href="#ch-tab9" class="btn" data-toggle="tag">스쿠버 장비</a>
	     									</li>
	     								</ul>
	     								<!-- 각 버튼마다 나타나는 화면 정의 -->
	     								<ul class="nav checklist-tab" id="checklist-tab">
	     								<div class="tab-content checklist-con" id="tab-content">
	     									<div class="tab-pane active" id="ch-tab1">
	     										<ul class="tasks">
	     											<li class="exp1">
	     												<p>
	     													<i class="fa fa-check" aria-hidden="true"></i>
	     													<span> 완료한 아이템들은 체크 하세요!</span>
														</p>
													</li>
													<li class="new-list">
														<form>
															<input class="form-control" type="text" id="todoName" placeholder="새로운 체크리스트" maxlength="100">
															<button class="btn btn-primary" id="checklist-add-btn">추가</button>
														</form>
													</li>					     										
	     										</ul>
	     									</div>
	     								</div>
	     								</ul>
	     							</div>
 	     						</div>
	     					</div>
	     				</div>
	     				</div>
							모달 안에 내용
	      				</div>
	      				<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
	      				</div>
	    				</div>
	  					</div>
					</div>			
			</div>
		<!-- 오른쪽 그룹 - 일정 -->
		<div class="col-md-10" id="schedulecontainer" >
		
		</div>
	</div>
</body>
</html>
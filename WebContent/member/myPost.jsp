<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style>
	.schedule-content{
		width : 370px; 
		height: 150px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px;  
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}
	#mainImg {
	width: 1140px;
	min-height: 270px;
	background-size : 1140px 350px;
	background-image : url('/tvlog/img/myPage/mypost.PNG');
	text-align: center;
	position:relative; 
	}
	#mainImg #p1{
	font-size : 50px;	
	font-weight: bold;
	color: #FFFFFF;
	position:absolute;
	width:600px; left:0; right:0; margin-left:auto; margin-right:auto;
	height:60px; top: 0; bottom:0; margin-top:70px; margin-bottom:auto;
	}
	#mainImg #p2{
	font-size : 20px;	
	font-weight: bold;
	position:absolute;
	width:600px; left:0; right:0; margin-left:420px; margin-right:auto;
	height:30px; top: 0; bottom:0; margin-top:180px; margin-bottom:auto;
	}
	
	#main2{
		font-size : 15px;
		margin-top: :20px;
		margin-bottom: :20px;
		border-bottom : 2px solid #BDBDBD;
	}
	#del{
		position:inherit;
		float: right;
		margin-right: 10px;
	}
	
	#test33{
	width:800px;
	float: left;
	}
</style>
<script type="text/javascript">
	function delView(idNum){
		icon = document.getElementById("delIcon"+idNum);
		icon.style.visibility = "visible";		
	}
	function delHide(idNum){
		icon = document.getElementById("delIcon"+idNum);
		icon.style.visibility = "hidden";		
	}
	function del(no){
		window.location="/tvlog/post/postDeleteForm.trip?no="+no;
	}
	
	var a;
	function callAjax(num){
		a=num;
	   $.ajax({
              type: "post",
              url : "/tvlog/post/postGood.trip",
              data: {no:num},
              success: good,   // 페이지요청 성공시 실행 함수
              error: whenError1   //페이지요청 실패시 실행함수
           }); 
      }
  	function good(data){
     	$("#good"+a).html(data);
 	}
    function whenError1(){
    	 alert("로그인 후 추천 가능합니다");
  	}    
	
	var b;
    function commentAjax(num){
			b=num;
		
  	   $.ajax({
                type: "post",
                url : "/tvlog/post/commentView.trip",
          	  data:{ no:num },
          	  success: comment,   // 페이지요청 성공시 실행 함수
                error: whenError   //페이지요청 실패시 실행함수
             }); 
        }
    function comment(aaa){
       $("#2good"+b).html(aaa);
    }
    function whenError(){
       alert("내용을 입력하세요");
    }
    
    var c;
	function ccallAjax(num){
		c=num;
	   $.ajax({
              type: "post",
              url : "/tvlog/post/postGood.trip",
              data: {no:num},
              success: good2,   // 페이지요청 성공시 실행 함수
              error: whenError2   //페이지요청 실패시 실행함수
           }); 
	}
	function good2(data){
	   $("#ggood"+c).html(data);
	}
	function whenError2(){
	   alert("로그인 후 추천 가능합니다");
	}
	
	function loginAjax(num){
		alert("로그인 후 작성 가능합니다");
    }
</script>
<title>트래블로그</title>
</head>
<body id="mainBody">
<jsp:include page="/main/header.jsp" /> 
	<div class="container" id="container">
		<!-- 여행 이지미  제목 들어갈 곳 -->
		<div id="mainImg">
			<div id="p1">
				<p><img src="/tvlog/img/member/${member.path}" width="130" height="130" style="align:center;Border-radius:40px;">
				<br /><font size="5">${member.name}</font></p>
			</div>
		</div>

		<div id="main2">
			<h3>내가 작성한 포스트 (${myPostListCount} 개)</h3>
		</div>
		
		<div>
		<br />
		<c:if test="${myPostListCount > 0 }">
			<div id="post">
			   <table width="1140px" >
					<!--  리스트 게시물 뿌려주는 for문 시작    -->
					<c:forEach begin="0" end="${(fn:length(list)+2) / 3 - 1}" var="row">
						<tr>
							<c:forEach begin="0" end="2" var="col">
								<c:set var="dto" value="${list[row * 3+col]}" />
								<c:if test="${not empty dto }">           					
									<td width="380px" >
										<div id="post-content" class="t_po" align="left" data-toggle="modal" data-target="#myModal2${dto.no }" onclick="javascript:commentAjax(${dto.no });">
											<img src="${dto.file_savname}" width="370px" height="250px" style="border-radius:10px;" />
										<div>
											<h4><b>	${dto.subject }</b></h4>
										</div>
										</div>
										<div style="float:left; margin-bottom:20px;">
											
											<div  style="float:left">
												<fmt:formatDate value="${dto.regdate}" type="date"/>
												<a href="javascript:callAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a>
				 								<span id="good${dto.no }">${dto.good}</span>
				 								
			 								</div>
										</div>
									</td>
			            		</c:if>
			            		
			            		<!--  뷰 모달 부분 -->
								<div class="modal fade" id="myModal2${dto.no}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
							  		<div class="modal-dialog modal-lg">
							    		<div class="modal-content">
							      			<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>		
												<h4 class="modal-title" id="famousplaceModalLabel">${dto.subject}</h4>
							      			</div>
							      			<div class="modal-body">
							    				${dto.content } 		
							      			</div>
							      			<span id="2good${dto.no }"></span>
							      			<div class="modal-authtor">
							    				<left><a href="javascript:ccallAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a><span id="ggood${dto.no }">${dto.good}</span></left>  
							      			</div>
							    			<form action="/tvlog/post/comment.trip" method="post">
							      				<input type="hidden" name="id" value="${sessionScpoe.memId }"/>
							      				<input type="hidden" name="no" value="${dto.no }"/>
							      				<div id="test33">
							      					<input class="form-control" type="text" placeholder="코멘트를 입력하세요" name="content" />
							       	 			</div>
							      	 			<div id="test44">
							      					<c:if test="${sessionScope.memId !=null }">
							      						<button type="submit" class="btn btn-warning">저장</button>
							      		 			</c:if>
							      		 			<c:if test="${sessionScope.memId ==null }">
							      		 				<button type="button" class="btn btn-warning" onclick="javascript:loginAjax();">저장</button>
							      		 			</c:if>
							      				</div>
							      			</form>
							      			<div class="modal-footer">
												<br/>
												<c:if test="${sessionScope.memId !=null }">
							        	 			<c:if test="${sessionScope.memId == dto.id }">
														<form action="/tvlog/post/postModifyForm.trip" method="post">
															<input type="hidden" name="no" value="${dto.no }"/>
															<button type="submit" class="btn btn-info">수정</button>
														</form>
														<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal3${dto.no }">삭제</button>
													</c:if>
							        			</c:if>
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>	
							      			</div>
							    		</div>
							  		</div>
								</div>
						   		
						   		<!-- #####     딜리트 부분 #########        -->            
						      	<div class="modal fade" id="myModal3${dto.no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
							  		<div class="modal-dialog">
							    		<div class="modal-content">
							      			<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
												<h4 class="modal-title" id="myModalLabel">포스트 삭제</h4><fmt:formatDate value="${dto.regdate}" type="date"/>
							      			</div>
						   					<form action="/tvlog/post/postDelete.trip" method="post" >         
							      				<div class="modal-body">
													<input type="hidden" name="no" value="${dto.no}"/>
													<p>정말 삭제하시겠습니까?</p>			
							      				</div>	  
							      				<div class="modal-footer">
													<br/>
													<input name="submit" type="submit" value="삭제" class="btn btn-danger"/>
													<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
											</form>     		
							      		</div>
							    	</div>
							  	</div>
							  	<!-- 모디파이 부분 -->
						  		<form action="/tvlog/post/postModify.trip" method="post" enctype="multipart/form-data" id="form">
									<div class="modal fade" id="myModal4${dto.no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
							  			<div class="modal-dialog modal-lg"> <!-- 폼 폭 -->
							    			<div class="modal-content">
							      				<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
													<h4 class="modal-title" id="myModalLabel">포스트 수정</h4>
							      				</div>
								      			<div class="modal-body">	   
										 			<input type="hidden" name="no" value="${dto.no}"/>     
								      	 			<input type="hidden" name="id" value="${sessionScope.memId }"/>
										 			<input  class="form-control" type="text" placeholder="제목을 입력하세요" id="subject" name="subject"  value="${dto.subject }"/>	
										 			<textarea name="content" id="content${dto.no}" rows="10" cols="100">${dto.content }</textarea>
								      			</div>
									      		<div class="modal-footer">
									      			<input type="button" id="savebutton2" value="저장" class="btn btn-warning"/> 
													<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
									      		</div>
								    		</div>
										</div>
									</div>
								</form>
		
							  </c:forEach>
							 </tr>
							 </c:forEach>
			            		
			            		
		</c:if>
		<c:if test="${myPostListCount == 0 }">
			<h2>등록된 포스트가 없습니다.</h2>
		</c:if>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
</body>
</html>
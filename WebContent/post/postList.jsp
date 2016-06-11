<?xml version="1.0" encoding="utf-8" ?>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>포스트 게시판</title>	
	<link rel="stylesheet" href="/projcet/postboard/common/css/css.css" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
	<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
	<!-- 네이버 스마트 에디터 사용 부분 -->
	<script type="text/javascript">
	
		var oEditors = [];
		var oEditors2 = [];
		$(document).ready(function() {
			nhn.husky.EZCreator.createInIFrame({
		    	oAppRef: oEditors2,
	    		elPlaceHolder: "contentMain",
	    		sSkinURI: "/tvlog/diary/diary_editor/SmartEditor2Skin.html",
	    		fCreator: "createSEditor2"
			});
			
			$("#savebutton").click(function(){
				oEditors2.getById["contentMain"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#frm").submit();
    			alert("작성이 완료되었습니다"); 
			});
		});
		function editTest(idNum) {
			nhn.husky.EZCreator.createInIFrame({
	    		oAppRef: oEditors,
	    		elPlaceHolder: idNum,
	    		sSkinURI: "/tvlog/diary/diary_editor/SmartEditor2Skin.html",
	    		fCreator: "createSEditor2"
			});
			$("#savebutton2").click(function(){
	    		oEditors.getById[idNum].exec("UPDATE_CONTENTS_FIELD", []);
				$("#form").submit();
    			alert("내용 전송"); 
    		});
			
		}
</script>

<style>
	#contain{
         width: 1140px;
         margin: auto;
       

	}
.ellipsis{
	width:250px;
	display:inline-blosck;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
	}
	
	#test11{
		width: 90px;
		float: left;
		margin: 0;
		padding: 0;
	}
	#test22{
		width:483px;
		float: left;
	}
	#test33{
	width:800px;
	float: left;
	}
	#search{
	width:90px;
	float: left;
	}
	#search2{
	width:300px;
	float: left;
	}
	#search3{
	float: left;
	}

</style>

<!-- 그림 이미지 크기 조절 -->


<!-- 좋아요 버튼 에이작스, 코멘트 에이작스 -->	
<script type="text/javascript">
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

      function loginAjax(num){
			alert("로그인 후 작성 가능합니다");
			
        }
      
</script>

	<script type="text/javascript">
	function OpenWindow(url,intWidth,intHeight) { 
	      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
	} 
	</script>

</head>
  
  <body>
  <jsp:include page="/main/header.jsp" />


  	<div id="contain">
     <table border="0" cellspacing="0" cellpadding="2">
        <tr>
           <td align="center"><h2>포스트 게시판</h2></td>
        </tr>
        	<td>
        	<c:if test="${sessionScope.memId !=null }">
        		<div class="container" align="right">
        		<div class="btn-toobar" role="toolbar" aria-label="Toolbar with button groups">
				<div class="btn-group" role="group" aria-label="First group">
	    		<button type="button" onClick="javascript:location.href='/tvlog/post/postList.trip'" class="btn btn-success">전체포스트</button>
	    		<button type="button" onClick="javascript:location.href='/tvlog/post/friendOnly.trip'" class="btn btn-success">친구포스트</button>
	  	  		<button type="button" onClick="javascript:location.href='/tvlog/post/mypost.trip'" class="btn btn-success">내 포스트</button>
	  	  		<button type="button" onClick="javascript:OpenWindow('friendManage.trip?','600','650')" class="btn btn-success">친구 관리</button>
	  	  		<button type="button" onClick="javascript:OpenWindow('bandManage.trip?','600','400')" class="btn btn-success">밴드 관리</button>
	  			</div>
	  			</div>
	  		</c:if>
        	</td>
        <c:if test="${sessionScope.memId== null }">	
        <input type="button" value="로그인 " onClick="javascript:location.href='/tvlog/member/loginForm.trip'"/>
        </c:if>
        <tr>
           <td height="20"></td>
        </tr>
     </table>
     
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
								<div class="dropdown"  style="float:left">
			  						<a id="dLabel" data-target="#" href="http://naver.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">${dto.id} <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
	    							<c:if test="${sessionScope.memId !=null }">
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:OpenWindow('newFriend.trip?friend_id=${dto.id }','470','340')">친구 추가</a></li>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:OpenWindow('bandComeon.trip?friend_id=${dto.id }','470','410')">밴드 초대</a></li>
	    							</c:if>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/diary/frienddiary.trip?friend_id=${dto.id}">다이어리</a></li>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/post/friendpost.trip?friend_id=${dto.id}">포스트</a></li>
	   									<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/post/friendschedule-list.trip?s_writer=${dto.id}">일정</a></li>
	   								</ul>
								</div>
								
								<div  style="float:left">
									<fmt:formatDate value="${dto.regdate}" type="date"/>
									<a href="javascript:callAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a>
	 								<span id="good${dto.no }">${dto.good}</span>
	 								
 								</div>
							</div>
						</td>
            		</c:if>
              <!--  뷰 모달 부분 -->
		<div class="modal fade" id="myModal2${dto.no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  		<div class="modal-dialog modal-lg">
	    		<div class="modal-content">
	      			<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>		
						<div class="container">
							<div class="dropdown">
			  					<a id="dLabel" data-target="#" href="http://naver.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">			
								<h4 class="modal-title" id="myModalLabel">${dto.id }<span class="caret"></h4></span></a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
	    						<c:if test="${sessionScope.memId !=null }">
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:OpenWindow('newFriend.trip?friend_id=${dto.id }','470','340')">친구 추가</a></li>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:OpenWindow('bandComeon.trip?friend_id=${dto.id }','470','410')">밴드 초대</a></li>
	    							</c:if>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/diary/frienddiary.trip?friend_id=${dto.id}">다이어리</a></li>
	    								<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/post/friendpost.trip?friend_id=${dto.id}">포스트</a></li>
	   									<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/post/friendschedule-list.trip?s_writer=${dto.id}">일정</a></li>
	   							</ul>
							</div>
						</div>
						<fmt:formatDate value="${dto.regdate}" type="date"/>
	      			</div>
	      			<div class="modal-body">
						<p id="modal-content"><font face="굴림체" color="blue">${dto.select_p }&nbsp;&nbsp;</font><b><font size="5">${dto.subject}</font></b><br/></p>
	    				${dto.content } 		
	      			</div>
	      			<span id="2good${dto.no }"></span>
	      			<div class="modal-authtor">
	    				<left><a href="javascript:ccallAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a><span id="ggood${dto.no }">${dto.good}</span></left>  
	      			</div>
	    			<form action="comment.trip" method="post">
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
								<form action="postModifyForm.trip" method="post">
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
   					<form action="postDelete.trip" method="post" >         
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
  		<form action="postModify.trip" method="post" enctype="multipart/form-data" id="form">
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
		
		<!-- 친구 신청 모달 -->
		<div class="modal fade" id="friendmoda${dto.no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	      </div>
	      <div class="modal-body">
		...
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	</c:forEach>
	</tr>            
</c:forEach>
        
         
         <c:if test="list.size() <= 0">
            
         <tr align="center">
      <td colspan="5">등록된 게시물이 없습니다.</td>
                  </tr>                  
         <tr>
            <td height="1" colspan="5"></td>
             </tr>
        </c:if>
         
         <tr align="center">
          <td colspan="5">${PagingHtml}</td>
             </tr>
             
         <tr align="right">
          <td colspan="5">
          
          <div id="search">
          <form action="search.trip" method="post">
          <select name="select" class="form-control">
         	 <option selected value="writer">글쓴이</option>
         	 <option selected value="subject">제목</option>
          	 
          </select> 
          </div>
          <div id="search2">
          <input type="text" name="find" class="form-control"></input>
          </div>
           <div id="search3">
          <input type="submit" class="btn btn-success" value="검색"></input>
           </div>
          </form>
          
          
     
          <c:if test="${find != null}">
                <input type="button" value="목록" class="inputb" onClick="javascript:location.href='postList.trip?currentPage=${currentPage}';"/>
            </c:if>
            
       
             <tr align="right">
          		<td colspan="5">
					<c:if test="${sessionScope.memId !=null }">           
               		<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myModal" width="300" height="200">
				 	 포스트 작성
					</button>
       				</c:if>
      			</td>
              </tr>
         	<tr>     
   
       
        
        
        <!-- 포스트 작성 모달 팝업 -->
   <form action="postWritePro.trip" method="post" enctype="multipart/form-data" id="frm">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" > <!-- 폼 폭 크게는 modal-lg를 오른쪽에 붙인다 -->
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">포스트 작성</h4>
	      </div>
	      <div class="modal-body" id="test11">
	      	<input type="hidden" name="id" value="${sessionScope.memId }"/>
		  
		  <select class="form-control" name="select_p">
         	 <option selected value="메모">메모</option>
         	 <option selected value="정보">정보</option>
          	 <option selected value="여행기">여행기</option>
          	 <option selected value="질문">질문</option>
          	 <option selected value="잡담">잡담</option>
          </select> 
			</div>
			<div id="test22">
			 <input  class="form-control" type="text" placeholder="제목을 입력하세요" id="subject" name="subject" /><br/>
			</div>
			
			<div>
			 <textarea name="content" id="contentMain" rows="10" cols="100"></textarea>
	      </div>
	      	<select class="form-control" name="p_public">
         		 <option selected value="5">비공개</option>
         		 <option selected value="4">친구와 밴드 공개</option>
          		 <option selected value="3">친구 공개</option>
          		 <option selected value="2">밴드 공개</option>
          	 	<option selected value="1">전체 공개</option>
         	 </select> 
	     
	      <div class="modal-footer">
	      
	      		<input type="button" id="savebutton" value="저장" class="btn btn-warning"/> 
				<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
        
        </tr>     
   </table>
   </div>
   </div>
   </body>
</html>
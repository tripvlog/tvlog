<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>포스트 게시판</title>	
	<link rel="stylesheet" href="/projcet/postboard/common/css/css.css" type="text/css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
	<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
    			alert("내용모디파이"+a); 
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
.ellipsis{
	width:250px;
	display:inline-blosck;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
	}
</style>
<style>
	p img{
		width: 300px;
		height: auto;
	}
</style>


	<script type="text/javascript">
       var a;
		function callAjax(num){
			a=num;
    	   $.ajax({
                  type: "post",
                  url : "/tvlog/postGood.trip",
                  data: {no:num},
                  success: good,   // 페이지요청 성공시 실행 함수
                  error: whenError   //페이지요청 실패시 실행함수
               }); 
          }
      function good(data){
         $("#good"+a).html(data);
      }
      function whenError(){
         alert("로그인 후 추천 가능합니다");
      }
   
</script>
</head>
  
  <body>
     <table border="0" cellspacing="0" cellpadding="2">
        <tr>
           <td align="center"><h2>포스트 게시판</h2></td>
        </tr>
        <c:if test="${sessionScope.memId== null }">	
        <input type="button" value="로그인 " onClick="javascript:location.href='loginForm.trip'"/>
        </c:if>
        <tr>
           <td height="20"></td>
        </tr>
     </table>
     
  
   <table width="600" border="0" cellspacing="0" cellpadding="2">


		<!--  리스트 for문 시작    -->

         
		<c:forEach begin="0" end="${(fn:length(list)+3) / 4 - 1}" var="row">
		
			<tr   align="center">
			<c:forEach begin="0" end="3" var="col">
				<c:set var="dto" value="${list[row * 4+col]}" />
				<c:if test="${not empty dto }">           					
					<td class="t_po" width=100 align="left" data-toggle="modal" data-target="#myModal2${dto.no }" >
						${dto.name} <br />
						<fmt:formatDate value="${dto.regdate}" type="date"/> <br />
					<p>	<b><h4>${dto.subject}</b></h4> 
					<ul>
						<li class="ellipsis">
					<div style="width:250px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
						${dto.content }</div><br/></p></li></ul>
					<!-- 	<img src="/tvlog/post/postimg/${dto.listimg}" width="300"><br /> -->
 						<a href="javascript:callAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a><span id="good${dto.no }">${dto.good}</span>
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					<td>
						<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal4${dto.no }" onclick="editTest('content${dto.no}')" >
				 			 수정
						</button>
					</td>
            	</c:if>
			
               
              
              
               <div class="modal fade" id="myModal2${dto.no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">${dto.id }&nbsp</h4><fmt:formatDate value="${dto.regdate}" type="date"/>
	      </div>
	      <div class="modal-body">
		
		<p><b>${dto.subject}</b><br/></p>
	    ${dto.content }
	
	      </div>
	      
	      <div class="modal-authtor">
	    <left><a href="javascript:callAjax(${dto.no });"><img src="/tvlog/post/good.png" width="25"></a><span id="good${dto.no }">${dto.good}</span></left>  
	      </div>
	      
	      <div class="modal-footer">
	      <input  class="form-control" type="text" placeholder="코멘트를 입력하세요" id="subject" name="comment" />
	      <button type="button" class="btn btn-warning">저장</button>
		<br/>
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	
		  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal3${dto.no }">
				  포스트 삭제
				</button>
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
			${dto.no}
	      </div>
	  
	      <div class="modal-footer">
		<br/>
		<input name="submit" type="submit" value="삭제" class="btn btn-warning"/>
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	  </form>     
		
	      </div>
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
          
          <form action="search.trip">
          <select name="select">
          <option selected value="writer">글쓴이</option>
          <option selected value="subject">제목</option>
          <option selected value="no">번호</option>
          </select> 
          <input type="text" name="find"></input>
          <input type="submit" value="검색"></input>
          </form>
          
          <c:if test="${find != null}">
                <input type="button" value="목록" class="inputb" onClick="javascript:location.href='postList.trip?currentPage=${currentPage}';"/>
            </c:if>
            
       
             <tr align="right">
          <td colspan="5">
               <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
				  포스트 작성
				</button>
          <input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='postWriteForm.trip?currentPage=${currentPage}';">
      </td>
              </tr>
         <tr>     
   
       
        
        
        <!-- 모달 팝업 -->
   <form action="postWritePro.trip" method="post" enctype="multipart/form-data" id="frm">
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-lg"> <!-- 폼 폭 -->
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">포스트 작성</h4>
	      </div>
	      <div class="modal-body">
	   
	     
	      	<input type="hidden" name="id" value="${sessionScope.memId }"/>
			 <input  class="form-control" type="text" placeholder="제목을 입력하세요" id="subject" name="subject" /><br/>
			 <textarea name="content" id="contentMain" rows="10" cols="100"></textarea>
	      </div>
	     
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
   </body>
</html>
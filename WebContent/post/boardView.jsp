<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>스트럿츠2 게시판</title>
   <link rel="stylesheet" href="/project/board/common/css/css.css" type="text/css">
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   <script type="text/javascript">
	function open_win_noresizable (url, name) {
		var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
	}
   $(document).ready(function(){

	    $("#comment").click(function(){
	          callAjax();
	      });
   });

   function startAjax(){
	   alert(콜콜)
	   $.ajax({
           type: "post",
           url : "/testprojcet/startComment.trip",
   			data:{no:no},
           success: comment,   // 페이지요청 성공시 실행 함수
           error: whenError   //페이지요청 실패시 실행함수
        }); 
   }

		function callAjax(){
			
 	   $.ajax({
               type: "post",
               url : "/testprojcet/comment.trip",
         		data:{ 
         		id : $('#id').val(),
         		no : $('#no').val(),
         		currentPage : $('#currentPage').val(),
         		content : $('#content').val()	
         		},
               success: comment,   // 페이지요청 성공시 실행 함수
               error: whenError   //페이지요청 실패시 실행함수
            }); 
       }
   function comment(aaa){
      $("#good").html(aaa);
   }
   function whenError(){
      alert("내용을 입력하세요");
   }

</script>
   </script>
</head>
  
   <body>
  
     <table width="600" border="0" cellspacing="0" cellpadding="2">
        <tr>
           <td align="center"><h2>스트럿츠2 게시판</h2></td>
        </tr>
        <tr>
           <td height="20"></td>
        </tr>
     </table>
      
<table width="600" border="0" cellspacing="0" cellpadding="0">
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
         
      <tr>
        <td bgcolor="#F4F4F4">  번호 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;${dto.no}
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>   
      </tr>
      
      <tr>
        <td width="100" bgcolor="#F4F4F4">  제목</td>
        <td width="500" bgcolor="#FFFFFF">
          &nbsp;&nbsp;${dto.subject}
        </td>
      </tr>
                           
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  글쓴이 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;${dto.name}
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>   
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  내용 </td>
        <td bgcolor="#FFFFFF">
        
          <c:forEach var="list" items="${list}">&nbsp;&nbsp;<img src="/testprojcet/img/${list.file_savname}" width="400"><br/></c:forEach>${dto.content}<br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
            <div id="good">
  <c:forEach var="colist" items="${colist}">
      <tr>
              <td align="center">${colist.id}</td>
              <td align="left">${colist.content}</td>
     		  <td align="center" width="40"><fmt:formatDate value="${colist.regdate}" type="date"/></td>
      </tr>
  </c:forEach>
         </div>
               <tr>
               <td>댓글</td>
               <td>
     
     <div class="container">
        <form role="form" id="form">
          <div class=" col-lg-4">
           <input type="hidden" id="no" name="no" value="${dto.no}" />
           <input type="hidden" id="currentPage" name="currentPage" value="${currentPage}" />
          글쓴이 <input  class="form-control input-sm" type="text" placeholder="이름을 입력하세요" id="id" name="id" />
	   <div class="col-md-8">
	       <textarea class="form-control col-sm-5" row="2" placeholder="코멘트를 입력하세요" name="content" id="content"/></textarea>
      
        <input id="comment" type="button" value="댓글 입력" />
    	</div>
           </td>
        </form>
        </div>
              </td>
       </tr>
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  조회수 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;${dto.readhit}
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>   
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  등록날짜 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;${dto.regdate}
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>   
      </tr>
      
     <c:forEach var="list" items="${list }">      
      <tr>
        <td bgcolor="#F4F4F4">  첨부파일 </td>

      <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;
          
          

        <a href="filedownload.trip?num=${list.num}">${list.file_orgname}</a></td>
        <td align="left"> &nbsp;
          </td>
      </tr>
    </c:forEach>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>   
      </tr>
      
      <tr>
        <td height="10" colspan="2"></td>
      </tr>
      
      
      <tr>
        <td align="right" colspan="2">
        
         
            
   <input name="list" type="button" value="수정" class="inputb" onClick="javascript:open_win_noresizable('postModifyForm.trip?no=${dto.no}&currentPage=${currentPage}&name=${dto.name}','modify')">
    <input name="list" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('postDeleteForm.trip?no=${dto.no}&currentPage=${currentPage}','delete')">
   <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='postList.trip?currentPage=${currentPage}'">

        </td>
      </tr>

  </table>
 </body>
</html>

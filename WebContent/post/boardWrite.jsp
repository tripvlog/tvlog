<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>스트럿츠2 게시판</title>
   <link rel="stylesheet" href="/springBoard/board/common/css/css.css" type="text/css">
   
   <SCRIPT type="text/javascript">
      function validation() {
      
         var frm = document.forms(0);
         
         if(frm.subject.value == "") {
            alert("제목을 입력해주세요.");
            return false;
         } 
         
         else if(frm.name.value == "") {
            alert("이름을 입력해주세요.");
            return false;
         }
         
         else if(frm.password.value == "") {
            alert("비밀번호를 입력해주세요.");
            return false;
         }
         
         else if(frm.content.value == "") {
            alert("내용을 입력해주세요.");
            return false;         
         } 
         
         return true;
      }
      
      function addFileForm(){

           var tb1 = document.getElementById("file_table");
           
           if(10 >= tb1.rows.length) {
            var idx = getObj().parentElement.rowIndex + 1;
            var trow= tb1.insertRow(idx);
            var uploadOBJ="<input name='upload' type='file' class='TEXT_FORM' id='f_id'>&nbsp<input type='button'  value='추가' OnClick='javascript:addFileForm();'/>&nbsp<input type='button'  value='삭제' OnClick='javascript:deleteRow();'/>";
            trow.insertCell(0).innerHTML = uploadOBJ;
           } else {
            alert("10개까지만 올릴 수 있습니다");
            return;
           }
      }
      
      function getObj(){

           var obj = event.srcElement
           while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
           {
              obj = obj.parentElement
           }
           return obj
       }
      
      function deleteRow(){
          
         var tb1 = document.getElementById("file_table");
         var idx = getObj().parentElement.rowIndex;
           
         if(tb1.rows.length-1 !=1){   
            var tRow = tb1.deleteRow(idx);
           }else{
             document.getElementById('f_id').select();
             document.selection.clear();
           }
      }

   </SCRIPT>
</head>
  
  <body>
     <table width="600" border="0" cellspacing="0" cellpadding="2">
        <tr>
           <td align="center"><h2>스트럿츠2 게시판</h2></td>
        </tr>
     </table>
  
      <c:if test="${dto == NULL}">
         <form action="postWritePro.trip" method="post" enctype="multipart/form-data" onsubmit="return validation();">
      </c:if>
      
      <c:if test="${dto != NULL}">
        <form action="postModifyUpdate.trip" method="post" enctype="multipart/form-data">
           <input type="hidden" name="no" value="${dto.no}">
           <input type="hidden" name="currentPage" value="${currentPage}">
           <input type="hidden" name="old_file" value="${dto.file_savname}">
      </c:if>

       <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
            
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  제목</td>
          <td width="500" bgcolor="#FFFFFF">
             <input type="text" name="subject" theme="simple" value="${dto.subject}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
                             
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이름 </td>
          <td bgcolor="#FFFFFF">
             <input type="text" name="name" theme="simple" value="${dto.name}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>   
        </tr>
 
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비밀번호 </td>
          <td bgcolor="#FFFFFF">
             <input type="text" name="password" theme="simple" value="${dto.password}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>   
        </tr>
        
            <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <TEXTAREA name="content" theme="simple" cols="50" rows="10" >${dto.content}</TEXTAREA>   
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4">  첨부파일 </td>
          
          <td>
          
          <table id="file_table">
          <td bgcolor="#FFFFFF">

             <tr>
             <td>
             
             <input type="button"  value="추가" OnClick="javascript:addFileForm();"/>
     	    <input type="button"  value="삭제" OnClick="javascript:deleteRow();"/>
         </td>
         </tr>
         
            <c:if test="${ count != 0 }">
              <c:forEach var="list" items="${list }"> 
               &nbsp; * ${ list.file_orgname }<br/>
          	  </c:forEach>
			(${count })개의 파일이 등록되어 있습니다. <br/>다시 업로드하면 기존의 파일은 삭제됩니다.
          </c:if>
                  
          </td>
          </table>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>   
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          
          <div class="container">
        	<button type="button" class="btn btn-default">Default</button>
			<button type="button" class="btn btn-primary">Primary</button>
			<button type="button" class="btn btn-success">Success</button>
			<button type="button" class="btn btn-info">Info</button>
			<button type="button" class="btn btn-warning">Warning</button>
			<button type="button" class="btn btn-danger">Danger</button>
			<button type="button" class="btn btn-link">Link</button>

          
             <input name="submit" type="submit" value="작성완료" class="btn btn-warning"/>       
            <input name="list" type="button" value="목록" class="btn btn-default" onClick="javascript:location.href='postList.trip?currentPage=${currentPage}'" >
          
          </div>
          </td>
        </tr>

    </table>
    </form>
  </body>
</html>


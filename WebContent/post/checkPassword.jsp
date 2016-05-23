<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>비밀번호 확인</title>
	<link rel="stylesheet" href="/project/board/common/css/css.css" type="text/css">
</head>
  
  <body>
  
  	<h2>비밀번호 확인</h2>
  	<c:if test="${dto.name==null}" >
  		<form action="postDeletePro.trip" method="post">
  	</c:if>
  	<c:if test="${dto.name != null }">
  	 	<form action="postModifyPro.trip" method="post">
  	</c:if> 	
  	<input type="hidden" name="no" value="${no}" />
  	<input type="hidden" name="currentPage" value="${currentPage}" />
  
  	<table width="250" border="0" cellspacing="0" cellpadding="0">
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td width="100" bgcolor="#F4F4F4"> 비밀번호 입력</td>
        <td width="150" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<input type="text" name="password" theme="simple" cssStyle="width:100px" maxlength="20"/>
          &nbsp;&nbsp;<input name="submit" type="submit" value="확인" class="inputb">
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
      
    </table>
  
  </form>
 </body>
</html>


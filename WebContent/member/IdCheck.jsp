<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head><title>ID 중복확인</title>
<head>
<body>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p> 입력하신 ${id}는 <font color = "red">사용하실 수 있는</font> ID입니다. </p>
      <input type="button" value="닫기" onclick="setid()">
    </td>
  </tr>
</table>
</body>
</html>

<script language="javascript">
  function setid()
    {		
    	opener.document.userinput.id.value="${id}";
		self.close();
	}
</script>
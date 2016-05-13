<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head><title>domain 중복확인</title>
<head>
<body>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p> 입력하신 ${domain} 는 <font color = "red">사용하실 수 있는 도메인</font> 입니다. </p>
      <input type="button" value="닫기" onclick="setdomain()">
    </td>
  </tr>
</table>
</body>
</html>

<script language="javascript">
  function setdomain()
    {		
    	opener.document.userinput.domain.value="${domain}";
		self.close();
	}
</script>
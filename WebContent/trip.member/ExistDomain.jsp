<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>domain 중복확인</title>
</head>
<body>
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr > 
    <td height="39" > ${domain} 은 <font color = "red">이미 사용중인 도메인</font>입니다.</td>
     <input type="button" value="닫기" onclick="setdomain()">
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
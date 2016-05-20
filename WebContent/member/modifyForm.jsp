<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<title>회원정보수정</title>
<script language="JavaScript">
</script>

<body>
<center><h1>회원 정보 수정</h1></center>
<form method="post" action="modifyPro.trip" name="userinput" onsubmit="return checkIt()">
<table align = "center" border = "2" width ="750">
		<tr>
			<td>아이디</td>
			<td>${dto.id}</td>	
		</tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" size="15" maxlength="12" value="${dto.pw}">
      </td>
    <tr>  
      <td width="200">닉네임</td>
      <td width="400"> 
        <input type="text" name="name" size="15" maxlength="12"value="${dto.name}">
      </td>
    </tr>
      <tr>  
      <td width="200">도메인	</td>
      <td width="400"> 
        <input type="text" name="domain" size="15" maxlength="12"value="${dto.domain}">&nbsp;&nbsp;<input type = "button" value = "중복확인" onClick="confirmDomainClick(this.form)"/>&nbsp&nbsp<font color = "blue"> * 중복확인 버튼을 클릭</font></td>		
		</tr>
      </td>
    </tr>
    <tr>
     <td width="200">프로필 사진 등록</td>
     <td width="400"> 
    <input type="file" name="path"value="${dto.path}">
    </td>
    </tr>	
		<tr> 
      		<td colspan="2" align="center"> 
      		 <input type="submit" name="modify" value="수   정" >
       		 <input type="button" value="취  소" onclick="javascript:window.location='index.nhn'">      
      		</td>
    	</tr>
</table>
</form>
</body>

</html>

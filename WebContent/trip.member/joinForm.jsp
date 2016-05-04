<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form method="post" action="/tvlog/joinPro.trip" name="userinput" onSubmit="return checkIt()">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
  

    <tr> 
      <td width="200">사용자 ID</td>
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12">
      </td>
    </tr>
    <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400" > 
        <input type="password" name="pw" size="15" maxlength="12">
      </td>
    <tr>  
      <td width="200">닉네임</td>
      <td width="400"> 
        <input type="text" name="name" size="15" maxlength="12">
      </td>
    </tr>
      <tr>  
      <td width="200">도메인</td>
      <td width="400"> 
        <input type="text" name="domain" size="15" maxlength="12">
      </td>
    </tr>
    <tr>
     <td width="200">프로필 사진 등록</td>
     <td width="400"> 
    <input type="file" name="path">
    </td>
    </tr>
      
    <tr> 
      <td colspan="2" align="center" > 
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>
  </table>
</form>
</body>
</html>

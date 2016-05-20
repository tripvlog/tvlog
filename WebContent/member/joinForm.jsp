<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

//중복확인 버튼 클릭시 이벤트 
function confirmClick(userinput){ 
        if (userinput.id.value==""){
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
        url = "ConfirmId.trip?id=" + userinput.id.value ;   
        // 새로운 윈도우를 엽니다.
        open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
}


function confirmDomainClick(userinput){ 
    if (userinput.domain.value==""){
        alert("도메인을 입력하세요");
        return;
    }
    // url과 사용자 입력 id를 조합하여 confirmId.jsp로 전달 
    url = "ConfirmDomain.trip?domain=" + userinput.domain.value ;   
    // 새로운 윈도우를 엽니다.
    open(url, "confirm","toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500, height=200");
}



//필수값(id, pw, pwchk)확인  
function fsubmit(){
	if(document.userinput.id.value==""||document.userinput.pw.value==""||document.userinput.pw_chk.value==""||document.userinput.member_nm.value==""){
		alert("아이디, 패스워드는  필수 입력사항입니다.");
		return false;
	}else{
    	return true;  // 정상적인 submit 진행                
	}
}

</script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">    

<form method="post" action="/tvlog/member/joinPro.trip" name="userinput" onSubmit="return fsubmit()" enctype="multipart/form-data">
  <table width="600" border="1" cellspacing="0" cellpadding="3" align="center" >
    <tr> 
    <td colspan="2" height="39" align="center" >
       <font size="+1" ><b>회원가입</b></font></td>
    </tr>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">회원가입</h4>
	      </div>
	      <div class="modal-body">
    <tr> 
      <td width="200">사용자 ID
      <td width="400"> 
        <input type="text" name="id" size="10" maxlength="12">&nbsp;&nbsp;<input type = "button" value = "중복확인" onClick="confirmClick(this.form)"/>&nbsp&nbsp<font color = "blue"> * 중복확인 버튼을 클릭</font></td>		
		</tr>
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
      <td width="200">도메인	</td>
      <td width="400"> 
        <input type="text" name="domain" size="15" maxlength="12">&nbsp;&nbsp;<input type = "button" value = "중복확인" onClick="confirmDomainClick(this.form)"/>&nbsp&nbsp<font color = "blue"> * 중복확인 버튼을 클릭</font></td>		
		</tr>
      </td>
    </tr>
    <tr>
     <td width="200">프로필 사진 등록</td>
     <td width="400"> 
    <input type="file" name="save">
    </td>
    </tr>
      
    <tr> 
      <td colspan="2" align="center" > 
          <input type="submit" name="confirm" value="등   록" >
          <input type="reset" name="reset" value="다시입력">
      </td>
    </tr>
    
  </table>

	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary">commit</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>
</body>
</html>

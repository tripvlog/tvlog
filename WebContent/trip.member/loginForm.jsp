<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head><title>�α���</title>
<link href="style.css" rel="stylesheet" type="text/css">

   <script language="javascript">
   

     <!--
       function begin(){
         document.myform.id.focus();
       }
       function checkIt(){
         if(!document.myform.id.value){
           alert("���̵� �Է����� �����̽��ϴ�.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.passwd.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }
         
       }
     -->
   </script>

</head>
<BODY onload="begin()">
<form name="myform" action="loginPro.trip" method="post" onSubmit="return checkIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle" ><STRONG>ȸ���α���</STRONG></TD></TR>
  
  <TR height="30">
    <TD width="110"align=center>���̵�</TD>
    <TD width="150"  align=center>
       <INPUT type="text" name="id" size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD width="110" align=center>��й�ȣ</TD>
    <TD width="150"  align=center>
      <INPUT type=password name="pw"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle"  >

      <INPUT type=submit value="�α���"> 
      <INPUT type=reset value="�ٽ��Է�">
      <input type="button" value="ȸ������" onclick="javascript:window.location='joinForm.trip'"></TD></TR>
</TABLE>
</form>

</div>
</BODY>
</HTML>
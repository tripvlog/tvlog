<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%!
 public String getParam(HttpServletRequest request, String paramName){
  if(request.getParameter(paramName)!=null){
   return request.getParameter(paramName);
  }else{
   return "";
  }
 }
%>
<%
 request.setCharacterEncoding("euc-kr");
 int filecounter = 0;
 if(request.getParameter("addcnt")!=null){
  filecounter = Integer.parseInt(request.getParameter("addcnt"));
 }
%>
<script type="text/javascript">// language="JavaScript"�� ��Ŭ������ �����̶� ���â�� ���
function inputValue(form1, param, form2, idx){
 var paramValue = form1.elements[idx].value;
 form2.elements[idx].value = paramValue;
 return;
}
function addFile(formName){
 if(formName.addcnt.value==""){
  alert("���鰳�� ���ڰ� �ƴմϴ�.");
  formName.addcnt.focus();
  return;
 }
 formName.submit();
}
function elementCheck(formName){
 paramIndex = 1;
 for(var idx = 0; idx<formName.elements.length; idx++){
  if(formName.elements[idx].type == "file"){
   if(formName.elements[idx].value == ""){
    var message = paramIndex+" ��° ������ ���ε� ����";
    alert(message);
    formName.elements[idx].focus();
    return;
   }
   paramIndex++;
  }
 }
 formName.action = "l4fileInfoView.jsp";
 formName.submit();
}
</script>
<h2>�������� ���� ���ε� (�ڹٽ�ũ��Ʈ �̿�)</h2>
<form name="frmName1" method="post">
user : <input type="text" name="user" onkeyup="inputValue(this.form, user, frmName2, 0)" value="<%=getParam(request, "user")%>"><br>
title : <input type="text" name="title" onkeyup="inputValue(this.form, title, frmName2, 1)" value="<%=getParam(request, "title") %>"><br>
content : <textarea name="content" cols="40" onkeyup="inputValue(this.form, content, frmName2, 2)"><%=getParam(request, "content") %></textarea><br>
������ ���� �� �Է� : <input type="text" name="addcnt"><input type="button" value="�̰Ÿ�������" onclick="addFile(this.form)">
</form><p/>
<form name="frmName2" method="post" enctype="multipart/form-data">
<input type="hidden" name="txtUser" value="<%=getParam(request, "user")%>">
<input type="hidden" name="txtTitle" value="<%=getParam(request, "title")%>">
<input type="hidden" name="txtContent" value="<%=getParam(request, "content")%>">
<%for(int i=0; i<filecounter; i++){%>
<input type="File" name="selectFile<%=i%>"><br>
<%}%>
<input type="button" value="��������" onclick="elementCheck(this.form)">
</form> 



<!-- http://blog.naver.com/lobolook/220130234567 -->
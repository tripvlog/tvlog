<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="JavaScript">

function writing() {
	alert(document.getElementById('b_content').innerHTML);
	alert(document.getElementById('b_content').innerTEXT);

	 if (document.board.b_content.value == "") {
	        alert("내용을 기입해 주세요");
	        document.board.b_content.focus();
	        return;
	      }
	     else {
	        document.board.action = "./write_ok.asp";
	        document.board.submit();
	     }
	}

</script>
<table border="0" cellspacing="0" cellpadding="0" width=760>
<form name="board" method=get action="">

<!--<textarea name="b_content" cols="80" rows="15" class=input></textarea>-->

<div id="b_content" style='width:640;height:250;color:black;text-align:left;image-align:left;

background-color:white;font-size:9pt;border:1px solid #CCCCCC' contenteditable></div>
</form>
</table>
<img src="../imgs/board/submit.gif" border=0 onClick="javascript_:writing();" style="cursor:hand;">
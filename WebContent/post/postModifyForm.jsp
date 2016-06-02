<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/projcet/postboard/common/css/css.css" type="text/css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>	
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
	 
<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style>
	#test11{
		width: 90px;
		float: left;
		margin: 0;
		padding: 0;
	}
	#test22{
		width:483px;
		float: left;
	}

</style>

<div class="container">
<div class="well well-lg">
<center>
<h3>포스트 수정</h3>
<form action="/tvlog/post/postModify.trip" method="post" enctype="multipart/form-data" id="frm">
  <div class="modal-body" id="test11">
		<input type="hidden" name="no" value="${dto.no }">
		  <select class="form-control" name="select_p">
         	 <option selected value="메모">메모</option>
         	 <option selected value="정보">정보</option>
          	 <option selected value="여행기">여행기</option>
          	 <option selected value="질문">질문</option>
          	 <option selected value="잡담">잡담</option>
          </select> 
 	  </div>
	  <div id="test22">
		<input  class="form-control" type="text" value="${dto.subject }" id="subject" name="subject" /><br/>
	</div>
</div>
<br /><hr>
<textarea name="content" id="content" rows="10" cols="100">${dto.content }</textarea>

	<br />
	<select class="form-control" name="p_public">
         		<option selected value="4">비공개</option>
          		<option selected value="3">친구공개</option>
          		<option selected value="2">밴드공개</option>
          	 	<option selected value="1">전체공개</option>
     </select> 
	<input type="button" class="btn btn-info" id="savebutton" value="수정" />&nbsp;<input type="button" class="btn btn-default" id="cancle" value="취소" />
</form>

</center>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "content",
	    sSkinURI: "/tvlog/diary/diary_editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	$("#savebutton").click(function(){
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	    $("#frm").submit();
	    alert("수정, 로맨틱, 성공적");
		})
	
})

</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<c:set var="vo" value="${vo}" />

<form action="/diary/modifyPro.trip" method="post" enctype="multipart/form-data" id="frm">
<input type="hidden" name="diary_num" value="${vo.diary_num}" />
<input type="text" name="diary_title" placeholder="제목" value="${vo.diary_title}" />
<input type="text" name="diary_location" placeholder="위치" value="${vo.diary_location}" />
<select id="diary_range" name="diary_range">
	<option value="0">나만보기</option>
	<option value="1">친구와</option>
	<option value="2">전체공개</option>
</select>
<br /><hr>
<textarea name="diary_content" id="diary_content" rows="10" cols="100">${vo.diary_content}</textarea>

<br />
<input type="button" id="savebutton" value="등록" />&nbsp;<input type="button" id="cancle" value="취소" onclick="javascript:history.go(-1)" />
</form>

<script type="text/javascript">
$(document).ready(function() {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "diary_content",
	    sSkinURI: "/tvlog/diary/diary_editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	$("#savebutton").click(function(){
	    oEditors.getById["diary_content"].exec("UPDATE_CONTENTS_FIELD", []);
	    $("#frm").submit();
	    alert("내용 전송");
		})	
})
</script>




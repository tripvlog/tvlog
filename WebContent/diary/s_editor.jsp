<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-lastest.min.js"></script>

<form action="/tvlog/submit.trip" method="post" enctype="multipart/form-data" id="frm">
<textarea name="d_content" id="d_content" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
<input type="submit" onClick="submitContents(this)">
</form>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "d_content",
    sSkinURI: "diary_editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	oEditors.getById["d_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	var content = document.getElementById("d_content").value;
	alert(content);
}

// http://hellogk.tistory.com/108, 한단계 낮은 버전으로 시도해보기

</script>




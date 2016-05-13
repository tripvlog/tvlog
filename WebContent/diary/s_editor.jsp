<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<form action="/tvlog/submit.trip" method="post" enctype="multipart/form-data" id="frm">
<textarea name="diary_content" id="diary_content" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
<input type="hidden" name="diary_num" value="1" /> 
<input type="hidden" name="diary_writer" value="Heo" />
<input type="hidden" name="diary_title" value="Luck" />
<input type="hidden" name="diary_location" value="Seoul" />
<input type="hidden" name="diary_range" value="0" />
<input type="button" id="savebutton" value="등록">
</form>

<script type="text/javascript">
$(document).ready(function() {
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "diary_content",
    sSkinURI: "diary_editor/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

$("#savebutton").click(function(){
    oEditors.getById["diary_content"].exec("UPDATE_CONTENTS_FIELD", []);
    $("#frm").submit();
    alert("내용 전송");
    
})
})
</script>




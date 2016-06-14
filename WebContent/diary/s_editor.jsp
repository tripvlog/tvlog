<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head></head>
<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
	});
	
});
var winObject = null;
function popup(){
	var settings ='toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=500,width=900,left=0,top=0';
	winObject = window.open("/tvlog/diary/map.trip", "지도", settings);
	}
	function submitToWindow(){
	winObject.document.all.text2.value = document.all.text1.value;
	}
</script>
<style>
	#mainImg {
	width: 1140px;
	min-height: 270px;
	background-size : 1140px;
	background-image : url('/tvlog/img/diary/diaryimage.jpg');
	text-align: center;
	position:relative; 
	}
	#mainImg #p1{
	font-size : 50px;	
	font-weight: bold;
	color: #FFFFFF;
	position:absolute;
	width:600px; left:0; right:0; margin-left:auto; margin-right:auto;
	height:40px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto;
	}
	#mainImg #p2{
	font-size : 20px;	
	font-weight: bold;
	position:absolute;
	width:600px; left:0; right:0; margin-left:420px; margin-right:auto;
	height:30px; top: 0; bottom:0; margin-top:180px; margin-bottom:auto;
	}
	
	#main2{
		font-size : 15px;
		margin-top: :20px;
		margin-bottom: :20px;
		border-bottom : 2px solid #BDBDBD;
	}	
</style>
<body>
<jsp:include page="/main/header.jsp" />
<div class="container" id="container">
	<div id="mainImg">
		<p id="p1">
				다이어리
		</p>
	</div>
		

	<div>
		<br />
		<form action="/tvlog/diary/submit.trip" method="post" enctype="multipart/form-data" id="frm">
			<input type="text" name="diary_title" placeholder="제목">
			<input type="hidden" name="diary_writer" value="${sessionScope.memId}" placeholder="작성자" />
			<input type="hidden" name="diary_location" placeholder="위치" />
			<select id="diary_range" name="diary_range">
				<option value="1">모두</option>
				<option value="2">친구와</option>
				<option value="3">밴드랑</option>
				<option value="4">친구랑 밴드</option>
				<option value="5">나만</option>
			</select>
			<button type="button" onclick="popup()">지도</button>
			<br /><hr>
			<textarea name="diary_content" id="diary_content" rows="10" cols="100"></textarea><br />
			<input type="button" id="savebutton" value="등록" class="btn btn-success" />&nbsp;
			<input type="button" id="cancle" value="취소" class="btn btn-warning" />
		</form>
	</div>
</div>
</body>

</html>
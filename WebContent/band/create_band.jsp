<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<!-- 이미지 미리보기 -->
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
	function band_check(){
		var name = document.getElementById("band_name");
		if(name.value == ""){
			alert("밴드 이름을 적어주세요!");
			document.getElementById("band_name").focus();
			return false;
		}
	}
</script>

<img id="blah" src="#" alt="미리보기" width="350" height="350" />
<!-- 밴드 생성 -->
<form action="/tvlog/band/b_createPro.trip" method="post" enctype="multipart/form-data" onsubmit="return band_check()">
	<div><input type="file" id="imgInp" name="b_img" /></div><br />
	<input type="text" id="band_name" name="band_name" placeholder="밴드명을 입력해주세요 "/>
	<input type="radio" name="band_range" value="1">공개
	<input type="radio" name="band_range" value="2">밴드명 공개
	<input type="radio" name="band_range" value="3">비공개
	<br />
	<textarea name="band_intro" cols="45" rows="5"></textarea><br />
	<input type="submit" value="완료" /> <input type="button" value="취소" onclick="javascript:location.href='/tvlog/band/b_list.trip'" />
</form>

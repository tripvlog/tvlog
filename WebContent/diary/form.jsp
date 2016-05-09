<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<Html>
<head>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script>
	function confirm(){
	
		var title = document.getElementById('d_title').value;
		var content = document.getElementById('d_content').value;
		
		if(title == "" && content == ""){
			alert("제목 또는 내용을 입력해주세요");
			return false;
		}
		
	}
	
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent; // 브라우저 정보를 받아옴
		
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			/*
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			*/
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			/*
			img.style.width = '100px'; 
			img.style.height = '100px';
			*/
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_" + View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
	
	$(document).ready(function(){
		$(".modal").on('hidden.bs.modal', function(){
			$(".modal-body").html("");
		});
	});
</script>
</head>
<body><br />
<div class="container">

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">일기 작성</button>

<form class="form-group" action="diaryPro.trip" method="post" name="diary" onsubmit="return confirm();" enctype="multipart/form-data">
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false" data-backdrop="false">
		<div class="modal-dialog">
			<!-- 테투리 밖  -->
			<div class="modal-content">
		    	<!-- 경계선  -->
				<div class="modal-header">
					<!-- 내용  -->
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">트래블로그</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="exampleModalLabel">일기 작성</h4>
				</div>
				<div class="modal-body">
					<label for="recipient-name" class="control-label">제목</label>
					<input type="text" class="form-control" id="d_title" placeholder="제목" name="d_title"><br />
					<label for="message-text" class="control-label">내용</label>
					<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					<textarea class="form-control" id="d_content" placeholder="내용" name="d_content"></textarea>
				</div>
				<div class="modal-footer">
				
					<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')" multiple>
					
					<a href="#" class="alert-link" target="_blank"><span class="glyphicon glyphicon-picture" aria-hidden="true">사진</span></a>&nbsp;
					<a href="map.trip" class="alert-link" target="_blank"><span class="glyphicon glyphicon-globe" aria-hidden="true">지도</span></a>&nbsp;
					<button type="submit" class="btn btn-primary">작성 완료</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
		    </div>
		</div>
	</div>
</form></div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->


</body></Html>
  
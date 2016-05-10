<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
	function confirm() {

		alert(document.getElementById('editor_panel').innerHTML);		
		return false;
		
		var title = document.getElementById('d_title').value;
		var content = document.getElementById('editor_panel').value;

		if (title == "" && content == "") {
			alert("제목 또는 내용을 입력해주세요");
			return false;
		}

	}

	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent; // 브라우저 정보를 받아옴

		var files = targetObj.files;
		for (var i = 0; i < files.length; i++) {
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

	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget);
		var recipient = button.data('whatever');
		var modal = $(this);
		modal.find('.modal-title').text('New message to ' + recipient);
		modal.find('.modal-body input').val(recipient);
	});
</script>

</head>
<body>
	<br />
	<div class="container">
	
		<!-- Modal windows button open -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">일기작성</button>
		<form class="form-group" action="diaryPro.trip" method="post" name="diary" onsubmit="return confirm();" enctype="multipart/form-data">
			<!-- Modal window -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">트래블로그</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">일기 작성</h4>
						</div>
						<div class="modal-body">
							<input type="text" class="form-control" id="d_title" placeholder="제목" name="d_title"><br />
							<div id="editor_panel" class="editable" style="min-height: 100px; width: 300px;" data-placeholder="내용을 적어주세요." ondragstart="return false;" ondrop="return false;" contenteditable="true" spellcheck="true" data-medium-editor-element="true" role="textbox" aria-multiline="true" medium-editor-index="0" data-medium-focused="true"></div>
							<div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'></div>
						</div>
						<div class="modal-footer">
							<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'editor_panel')" multiple>
							<a href="#" class="alert-link" target="_blank"><span class="glyphicon glyphicon-picture" aria-hidden="true">사진</span></a>&nbsp;
							<a href="map.trip" class="alert-link" target="_blank"><span class="glyphicon glyphicon-globe" aria-hidden="true">지도</span></a>&nbsp;
							<button type="submit" class="btn btn-primary">작성 완료</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- Modal window option script -->
	<script>
		$('#myModal').on('show.bs.modal', function(event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
			var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
			var modal = $(this)
			modal.find('.modal-body input').val('') // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
			modal.find('.modal-body textarea').val('')
		})
	</script>
</body>
</html>
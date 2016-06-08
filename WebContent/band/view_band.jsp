<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>밴 드</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="offcanvas.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src=../js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<script>
	function board_delete(board_num){
		var num = board_num;
		alert(num);
		var check = confirm("삭제하시겠습니까?");
		if(check == true){		
			location.href="/tvlog/band/bb_delete.trip?band_id=${band_id}&board_num=" + num;
		}
	}
	
	function error_login(session){
		var id = session;
		var content = document.getElementById("board_content").value;
		if(id == null){
			alert("로그인이 필요합니다");
			return false;
		}
		if(content == ""){
			alert("내용을 입력해주세요");
			document.getElementById("board_content").focus();
			return false;
		}
	}
</script>
<body>
	<jsp:include page="/main/header.jsp" /><br />

<!-- 내용시작 -->
	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">
		
			<div class="col-xs-12 col-sm-9">
				<!-- 밴드에 게시글 작성 -->
				<c:if test="${modify != true}">
				<form action="/tvlog/band/bb_write.trip" method="post" enctype="multipart/form-data" onsubmit="return error_login('${sessionScope.memId}')">
					<input type="hidden" name="modify" value="false">
					<input type="hidden" name="band_id" value="${band.band_id}">
					<textarea rows="5" cols="75" placeholder="소식을 남겨주세요!" name="band_board_content" id="board_content"></textarea><br />
					<input type="file" name="upload_img" multiple><input type="submit" value="저장"> <input type="reset" value="취소">
					
				</form>
				
					<hr style="color:red">
					<c:forEach var="v" items="${b_board_contents}">

					<div><!-- 작성자랑 현재 로그인한 세션 값 비교하여 일치하면 수정 및 삭제 기능 추가 -->
						<c:if test="${sessionScope.memId == v.band_board_writer}">
							<div class="dropdown" id="mydropdown">
								<img src="/tvlog/img/member/${v.path}" width="50" height="50">${v.name}
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="/tvlog/band/b_view.trip?band_id=${band_id}&band_board_num=${v.band_board_num}&modify=true">수정하기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" onclick="board_delete(${v.band_board_num})">삭제하기</a></li>
								</ul>
							</div>
						</c:if>
						<!-- 작성자가 아닐경우 읽기만 가능 -->
						<c:if test="${sessionScope.memId != v.band_board_writer}">
							<img src="/tvlog/img/member/${v.path}" width="50" height="50">${v.name}
						</c:if>
						<br />
							${v.band_board_num} : band_board_num<br />
							${v.band_board_notice} : band_board_notice<br />
							${v.band_board_writer} : band_board_writer<br />
							${v.band_board_img} : band_board_img<br />
							${v.band_board_content} : band_board_content<br />
							${v.band_board_readcount} : band_board_readcount<br />
							${v.band_board_reg} : band_board_reg<br /><br />
						</div>
					</c:forEach>
			</c:if><!-- 내용 수정 시작 -->
			<c:if test="${modify == true}">
				<form action="/tvlog/band/bb_write.trip" method="post" enctype="multipart/form-data">
					<input type="hidden" name="band_id" value="${band_id}">
					<input type="hidden" name="band_board_num" value="${modify_board.band_board_num}">
					<input type="hidden" name="modify" value="complete">
					<textarea rows="5" cols="75" placeholder="소식을 남겨주세요!" name="band_board_content">${modify_board.band_board_content}</textarea><br />
					<input type="file" name="upload_img" multiple>현재 ${imgCount}개가 저장되어있습니다. 업로드시 기존 파일은 지워집니다.<br />
					<c:forEach var="m" items="${imgs}">
					<img src="/tvlog/img/band/${m.board_img}" width="300" height="300">
					</c:forEach><br />
					<input type="submit" value="저장"> <input type="button" value="취소" onclick="javascript:window.location='/tvlog/band/b_view.trip?band_id=${band_id}'">
				</form>
			</c:if><!-- 내용 수정 끝 -->
			</div>
			<!--/.col-xs-12.col-sm-9-->
<!-- 내용 끝 -->
<!-- 우측 메뉴바 시작 -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<div class="list-group-item" align="center"><a href="/tvlog/band/b_view.trip?band_id=${band.band_id}">
						<img src="/tvlog/img/band/${band.band_img}" width="230" height="150"></a><br />
						${band.band_name}<br />
						${band.band_intro}<br />
						<hr>
						<a href="/tvlog/band/b_modify.trip?band_id=${band_id}&">
						<span class="glyphicon glyphicon-cog" aria-hidden="true">설정</span>
						</a>
					</div>
					<c:if test="${sessionScope.memId != null}"><!-- 로그인이 되어있으면 내가 가입한 밴드를 보여줌 -->
							내 밴드<br />
						<c:forEach var="band_list" items="${band_list}">
							<a href="/tvlog/band/b_view.trip?band_id=${band_list.band_id}">
							<img src="/tvlog/img/band/${band_list.band_img}" width="50" height="50">&nbsp;${band_list.band_name}<br />
							</a>
						</c:forEach>
					<hr>
					</c:if><!-- 다른밴드 추천 -->
					이런 밴드는 어떠세요?<br />
					<c:forEach var="b" items="${bandlist}">
					<div>
						<a href="/tvlog/band/b_view.trip?band_id=${b.band_id}">
						<img src="/tvlog/img/band/${b.band_img}" width="50" height="50">${b.band_name}</a>
					</div>
					</c:forEach>
				</div>
			</div><!-- 우측 메뉴바 끝 -->
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->

		<hr color="black">

		<footer>
			<p>&copy; Trip Blog♥</p>
		</footer>

	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>

	<script src="../js/offcanvas.js"></script>
</body>
</html>

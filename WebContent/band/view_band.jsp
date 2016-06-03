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
			location.href="/tvlog/band/bb_delete.trip?band_id=${band_id}&band_board_num=" + num;
		}
	}
</script>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/tvlog/main/main.trip">Trip Blog</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/tvlog/band/b_list.trip">밴드 홈</a></li>
					<li><a href="#">밴드 찾기</a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

<!-- 내용시작 -->
	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">
		
			<div class="col-xs-12 col-sm-9">
				<!-- 밴드에 게시글 작성 -->
				<form action="/tvlog/band/bb_write.trip" method="post" enctype="multipart/form-data">
				
					<input type="hidden" name="band_id" value="${band.band_id}">
					<textarea rows="5" cols="75" placeholder="소식을 남겨주세요!" name="band_board_content"></textarea><br />
					<input type="file" name="board_img" multiple><input type="submit" value="저장"> <input type="reset" value="취소">
					
				</form>
				
					<hr style="color:red">
					<c:forEach var="i" items="${b_board_contents}">

					<div><!-- 내 게시물만 수정 및 삭제 가능 -->
						<c:if test="${sessionScope.memId == i.band_board_writer}">
							<div class="dropdown" id="mydropdown">
								<img src="/tvlog/img/member/${i.path}" width="50" height="50">${i.name}
								<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">수정하기</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" onclick="board_delete(${i.band_board_num})">삭제하기</a></li>
								</ul>
							</div>
						</c:if>
						
						<c:if test="${sessionScope.memId != i.band_board_writer}">
							<img src="/tvlog/img/member/${i.path}" width="50" height="50">${i.name}
						</c:if>
						<br />
							${i.band_board_num} : band_board_num<br />
							${i.band_board_notice} : band_board_notice<br />
							${i.band_board_writer} : band_board_writer<br />
							<img src="/tvlog/img/band/${i.band_board_img}" width="250" height="250"> : band_board_img<br />
							${i.band_board_content} : band_board_content<br />
							${i.band_board_readcount} : band_board_readcount<br />
							${i.band_board_reg} : band_board_reg<br /><br />
							<hr>
						</div>
						
					</c:forEach>
					
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
					</div>
					<hr>
					<a href="#" class="list-group-item active">1</a>
					<a href="##" class="list-group-item">2</a>
					<a href="###" class="list-group-item">3</a>
					<hr>
					내 밴드<br />
					<img src="/tvlog/img/band/${band.band_img}" width="50" height="50">&nbsp;${band.band_name}
					<hr>
					이런 밴드는 어떠세요?<br />
					<a href="####">6</a>
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

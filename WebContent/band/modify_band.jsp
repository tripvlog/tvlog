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
    <link rel="icon" href="../../favicon.ico">

    <title>밴 드</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


    <!-- Custom styles for this template -->
    <link href="offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  <jsp:include page="/main/header.jsp" /><br />

    <!-- 밴드 목록 보여주기 -->
    <div class="container">
    	<div class="row row-offcanvas row-offcanvas-right">	    	
			<div class="col-xs-12 col-sm-9">
				밴드이름 : <input type="text" name="band_name" value="${banddto.band_name}"><br />
				밴드 이미지 : <input type="file" name="b_img"><img src="/tvlog/img/band/${banddto.band_img}" width="230" height="150"><br />
				밴드 설명 : <textarea name="band_intro" cols="45" rows="5">${banddto.band_intro}</textarea><br />
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<div class="list-group-item" align="center"><a href="/tvlog/band/b_view.trip?band_id=${banddto.band_id}">
						<img src="/tvlog/img/band/${banddto.band_img}" width="230" height="150"></a><br />
						${banddto.band_name}<br />
						${banddto.band_intro}<br />
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
				
			</div>
		</div>
    </div>
    </body>
    </html>
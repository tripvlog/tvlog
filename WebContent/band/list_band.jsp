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
    
    <form action="/tvlog/post/bandSearch.trip" method="post">
          <input type="text" name="bandname" placeholder="밴드 이름이나 소개로 검색"></input>
          <input type="submit" class="btn btn-success" value="검색"></input>
    </form>
    <hr>
    	<div class="row">
	    	<c:forEach var="band" items="${b_list}">
	    		<a href="/tvlog/band/b_view.trip?band_id=${band.band_id}">
	    			<div class="col-md-2" align="center">
						<img src="/tvlog/img/band/${band.band_img}" width="150" height="150"><br />
						${band.band_name}<br />
						${band.band_intro}
					</div>
				</a>
			</c:forEach>
			
			<c:forEach var="m" items="${close_member}">
				${m.band_member_id}
			</c:forEach>
			<c:if test="${sessionScope.memId != null}">
			<a href="/tvlog/band/b_create.trip">
			<div class="col-md-2" align="center">
				<img src="/tvlog/img/band/default.jpg" width="150" height="150" ><br /><br />
				밴드 만들기
			</div>
			</a></c:if>
		</div>
    </div>
    </body>
    </html>
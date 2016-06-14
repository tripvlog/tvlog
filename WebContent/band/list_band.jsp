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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

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
    <style>
    	#mainImg {
	width: 1140px;
	min-height: 270px;
	background-size : 1140px;
	background-image : url('/tvlog/img/band/bandimage.jpg');
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
    <script>
	function goSearch(){
		var keyword = document.getElementById("search").value;
		if(keyword == ""){
			alert("키워드를 입력하세요");
		}else{
			window.location="/tvlog/post/bandSearch.trip?bandname="+keyword;
		}
	}
</script>
  </head>

  <body>
  <jsp:include page="/main/header.jsp" /><br />
    
    <!-- 밴드 목록 보여주기 -->
    <div class="container">
    <div id="mainImg">
			<p id="p1">
				BAND
			</p>
			<div class="row" id="p2">
				<div class="col-sm-6">
	   				<div class="input-group">
				    	<span class="input-group-addon">
							<i class="fa fa-search" aria-hidden="true"></i>
						</span>
						<input type="text" id="search" class="form-control" onkeypress="if( event.keyCode==13 ){goSearch();}">
					</div><!-- /input-group -->
				</div><!-- /.col-sm-6 -->
			</div>
		</div>
		
		<div id="main2">
			<h3>등록된 밴드: ${count}개</h3>
		</div>
		<div>	
			<br />
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
    </div>
    </body>
    </html>
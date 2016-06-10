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
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script>
	$(function() {
		$("#imgInp1").on('change', function() {
			readURL1(this);
		});
		$("#imgInp2").on('change', function() {
			readURL2(this);
		});
	});
	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	
			reader.onload = function(e) {
				$('#blah1').attr('src', e.target.result);
			}
	
			reader.readAsDataURL(input.files[0]);
		}
	}
	function readURL2(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	
			reader.onload = function(e) {
				$('#blah2').attr('src', e.target.result);
			}
	
			reader.readAsDataURL(input.files[0]);
		}
	}
	function ok(member_id, b_id){
		var id = member_id;
		var band_id = b_id;
		alert(band_id + ", " + id);
		var check = confirm("가입 승인하시겠습니까?");
		if(check == true){
			alert("승인이 완료되었습니다");
			location.href="/tvlog/band/b_join.trip?confirm=yes&band_id=" + band_id + "&band_member_id=" + id;
		}else{
			alert("승인이 취소되었습니다");
		}
		return false;
	}
</script>
  <body>
  <jsp:include page="/main/header.jsp" /><br />

    <!-- 밴드 목록 보여주기 -->
    <div class="container">
    	<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<form action="/tvlog/band/b_modifyPro.trip" method="post" enctype="multipart/form-data">
					<input type="hidden" name="band_id" value="${band_id}">
					<input type="hidden" name="modify" value="member">
					<input type="hidden" name="band_member_id" value="${sessionScope.memId}">
					이름 : <input type="text" name="band_member_name" value="${memberdto.band_member_name}"><br />
					사진 : <input type="file" id="imgInp1" name="b_img" id="imgInp1" /><br /> 
					<img src="/tvlog/img/member/${memberdto.band_member_img}" width="100" height="100"><img src="#" width="100" height="100" id="blah1"><br />
					<input type="submit" value="수정 완료">&nbsp;<input type="button" value="돌아가기" onclick="javascript:window.location='/tvlog/band/b_view.trip?band_id=${band_id}'">
				</form>
				<hr>
				<c:if test="${banddto.band_leader == sessionScope.memId}">
					<form action="/tvlog/band/b_modifyPro.trip" method="post" enctype="multipart/form-data">
						<input type="hidden" name="band_id" value="${band_id}">
						<input type="hidden" name="modify" value="band">
						<input type="hidden" name="band_member_id" value="${sessionScope.memId}">
						밴드이름 : <input type="text" name="band_name" value="${banddto.band_name}"><br />
						밴드 이미지 : <input type="file" name="b_img" id="imgInp2" ><img src="/tvlog/img/band/${banddto.band_img}" width="100" height="100"><img src="#" width="100" height="100" id="blah2"><br />
						밴드 설명 : <textarea name="band_intro" cols="45" rows="5">${banddto.band_intro}</textarea><br />
						<input type="radio" name="band_range" value="1">공개
						<input type="radio" name="band_range" value="3">밴드명 공개
						<input type="radio" name="band_range" value="5">비공개 <br />
						<input type="submit" value="수정 완료">&nbsp;<input type="button" value="돌아가기"  onclick="javascript:window.location='/tvlog/band/b_view.trip?band_id=${band_id}'">
					</form>
				<hr>
				밴드가입 요청현황
				<table border="1" width="800">
					<tr align="center">
						<td>프로필 사진</td><td>아이디</td><td>이름</td><td>신청시간</td><td>비고</td>
					</tr>
					<c:forEach var="guestlist" items="${guestlist}">
						<tr align="center">
							<td><img src="/tvlog/img/member/${guestlist.band_member_img}" width="50" height="50"></td>
							<td>${guestlist.band_member_id}</td>
							<td>${guestlist.band_member_name}</td>
							<td>${guestlist.band_member_reg}</td>
							<td><button onclick="ok('${guestlist.band_member_id}', '${band_id}')">가입승인</button></td>
						</tr>
					</c:forEach>
				</table>
				<hr>
				</c:if>
				밴드 탈퇴     밴드 삭제
			</div>
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<div class="list-group-item" align="center"><a href="/tvlog/band/b_view.trip?band_id=${banddto.band_id}">
						<img src="/tvlog/img/band/${banddto.band_img}" width="230" height="150"></a><br />
						${banddto.band_name}<br />
						${banddto.band_intro}<br />
					</div>
					<hr>
					<c:if test="${sessionScope.memId != null}"><!-- 로그인이 되어있으면 내가 가입한 밴드를 보여줌 -->
					내 밴드<br />
					<c:forEach var="band_list" items="${band_list}">
						<a href="/tvlog/band/b_view.trip?band_id=${band_list.band_id}">
						<img src="/tvlog/img/band/${band_list.band_img}" width="50" height="50">&nbsp;${band_list.band_name}<br />
						</a>
					</c:forEach>
					<hr>
					</c:if>
				</div>
				
			</div>
		</div>
    </div>
    </body>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<script>
	//비밀번호 찾기 ajax
	function findPw(){
		$.ajax({
	        type: "post",
	        url : "/tvlog/member/findPw.trip",
	        data: {	// url 페이지도 전달할 파라미터
	   			id : $('#id').val()
	        },
	        success: findPwSuccess,	// 페이지요청 성공시 실행 함수
	        error: findPwError	//페이지요청 실패시 실행함수
	 	});
	}
	function findPwSuccess(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다.
	    $("#findPwSpace").html(aaa);
	}
	function findPwError(){
	    alert("Error");
	}
</script>
</head>
<body>
	<c:if test="${pw != null}">
		<center><h3> 비밀번호는 ${pw}입니다.</h3></center>
	</c:if>
	<c:if test="${pw == null}">
		<center><h3>아이디가 존재하지 않습니다.</h3></center>
	</c:if>
</body>
</html>
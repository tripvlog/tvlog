<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta property="fb:app_id" content="205692086490634" />
<meta property="og:title" content="트래블로그">
<meta property="og:url" content="http://192.168.50.26:8080">
<meta property="og:type" content="travel" >
<meta property="og:description" content="여행... 좋아해요?">
<meta property="og:image" content="/tvlog/diary/a.png">
</head>
<script>
	function checkDelete(){
		var delConfirm = confirm("삭제하시겠습니까?");
		
		if(delConfirm == true){
			document.location.href="/tvlog/diary/delete.trip?num=${vo.diary_num}";
			alert("삭제되었습니다");
		}else{
			alert("삭제가 되지 않았습니다")
		}
	}
</script>
<body>
<c:set var="vo" value="${vo}" />
글번호 : ${vo.diary_num}<br />
작성자 : ${vo.diary_writer}<br />
글제목 : ${vo.diary_title}<br />
글내용 : ${vo.diary_content}<br />
위치 : ${vo.diary_location}<br />
공개범위 : ${vo.diary_range}<br />
등록(수정)날짜 : ${vo.diary_reg}<br />
<input type="button" value="수정" onclick="javascript:location.href='/tvlog/diary/modify.trip?num=${vo.diary_num}'" />&nbsp;
<input type="button" value="삭제" onclick="checkDelete()" />
<input type="button" id="cancle" value="목록보기" onclick="javascript:location.href='/tvlog/diary/list.trip'" />
<input type="button" value="페이스북 공유" onclick="javascript:location.href='https://www.facebook.com/sharer.php?u=http://192.168.50.26:8080/tvlog/diary/view.trip?num=${vo.diary_num}&og:title=${vo.diary_title}'"/>
</body>
</html>
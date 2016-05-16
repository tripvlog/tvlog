<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function checkDelete(){
		var delConfirm = confirm("삭제하시겠습니까?");
		
		if(delConfirm == true){
			document.location.href="delete.trip?num=${vo.diary_num}";
			alert("삭제되었습니다");
		}else{
			alert("삭제가 되지 않았습니다")
		}
	}
</script>
<c:set var="vo" value="${vo}" />
글번호 : ${vo.diary_num}<br />
작성자 : ${vo.diary_writer}<br />
글제목 : ${vo.diary_title}<br />
글내용 : ${vo.diary_content}<br />
위치 : ${vo.diary_location}<br />
공개범위 : ${vo.diary_range}<br />
등록(수정)날짜 : ${vo.diary_reg}<br />
<input type="button" value="수정" onclick="javascript:location.href='modify.trip?num=${vo.diary_num}'" />&nbsp;
<input type="button" value="삭제" onclick="checkDelete()" />
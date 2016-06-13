<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<script>
	
	function comment_del(c_num, b_id){
		var comment_num = c_num;
		var band_id = b_id;
		var check = confirm("댓글을 삭제하시겠습니까?");
		
		if(check == true){
			alert("댓글이 삭제되었습니다");
			location.href="/tvlog/band/bb_commentDel.trip?comment_num=" + comment_num + "&band_id=" + band_id; 
		}
	}
</script>
<c:forEach var="comment" items="${b_board_comments}">

<div>
${comment.band_board_comment_writer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate type="date" value="${comment.band_board_comment_reg}"/><br />
${comment.band_board_comment_comment}
<div align="right">
<button onclick="comment_del('${comment.band_board_comment_cno}', '${band_id}')">댓글 삭제</button>
</div>
</div>


</c:forEach>
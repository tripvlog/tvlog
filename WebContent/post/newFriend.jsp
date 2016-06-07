<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

        받은 친구 신청(${count })개 <br>
    
    <table border="0" cellspacing="0" cellpadding="2">
    	<tr>
    		<td>
    			<b>친구 신청하시겠습니까?</b><br/> 
    			<form action="newFriendPro.trip" method="post">
    				<input type="hidden" name="friend_id" value="${friend_id }">
    				<input type="hidden" name="id" value="${id }">
    				<input type="submit" value="신청" class="btn btn-warning"/> 
					<button type="button" class="btn btn-primary">취소</button>
				</form>
    		</td>
    	</tr>
    </table>
    		
    ${friend_id}
    ${id}
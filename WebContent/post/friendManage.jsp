<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<p>받은 친구 신청(${count })개<br/>

	 <c:forEach var="list" items="${list}">
 		<form action="okFriend.trip" method="post">
 아이디:${list.friend_id }&nbsp;&nbsp;
 날짜	<fmt:formatDate value="${list.friend_reg}" type="both"/>&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="hidden" name="friend_id" value="${list.friend_id }">
 		<input type="submit" value="수락" >
 		<input type="button" value="거절" onClick="javascript:location.href='/tvlog/post/noFriend.trip?friend_id=${list.friend_id}&id=${sessionScope.memId}'">
 		</form>
	</c:forEach></p>
<p>
내가 보낸 친구 신청(${count2 })개<br/>
	<c:forEach var="list2" items="${list2}">
아이디:${list2.friend_id }&nbsp;&nbsp;
 날짜	<fmt:formatDate value="${list2.friend_reg}" type="both"/></br>	
	</c:forEach></p>
<p>
내 친구 목록 (총 (${count3 })명)<br/>
	<c:forEach var="list3" items="${list3}">
	<form action="deleteFriend.trip" method="post">
	아이디:${list3.friend_id }&nbsp;&nbsp;
		<input type="hidden" name="friend_id" value="${list3.friend_id }">
 		<input type="submit" value="친구 끊기" >
 	
	</form>
	</c:forEach></p>
	


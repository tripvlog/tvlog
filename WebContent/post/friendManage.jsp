<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<p>���� ģ�� ��û(${count })��<br/>

	 <c:forEach var="list" items="${list}">
 		<form action="okFriend.trip" method="post">
 ���̵�:${list.friend_id }&nbsp;&nbsp;
 ��¥	<fmt:formatDate value="${list.friend_reg}" type="both"/>&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="hidden" name="friend_id" value="${list.friend_id }">
 		<input type="submit" value="����" >
 		<input type="button" value="����" onClick="javascript:location.href='/tvlog/post/noFriend.trip?friend_id=${list.friend_id}&id=${sessionScope.memId}'">
 		</form>
	</c:forEach></p>
<p>
���� ���� ģ�� ��û(${count2 })��<br/>
	<c:forEach var="list2" items="${list2}">
���̵�:${list2.friend_id }&nbsp;&nbsp;
 ��¥	<fmt:formatDate value="${list2.friend_reg}" type="both"/></br>	
	</c:forEach></p>
<p>
�� ģ�� ��� (�� (${count3 })��)<br/>
	<c:forEach var="list3" items="${list3}">
	<form action="deleteFriend.trip" method="post">
	���̵�:${list3.friend_id }&nbsp;&nbsp;
		<input type="hidden" name="friend_id" value="${list3.friend_id }">
 		<input type="submit" value="ģ�� ����" >
 	
	</form>
	</c:forEach></p>
	


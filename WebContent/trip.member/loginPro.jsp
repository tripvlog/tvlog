<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.memId !=null}">
${sessionScope.memId}님 로그인 되셨습니다!!!!!!!!!!!!!
<img src="${imgPath}" width="200" height="200">
<form action="/tvlog/logout.trip">
<input type="submit" value="로그아웃">
</form>
</c:if>

<form action="/tvlog/deleteForm.trip">
<input type="submit" value="탈퇴">
</form>


<c:if test="${sessionScope.memId==null}">
<script>
alert("id&pw확인하세요");
history.go(-1);
</script>
</c:if>

<input type="button" value="확인 " onclick="javascript:window.location='main.trip'"/>
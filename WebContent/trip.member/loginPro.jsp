<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.memId !=null}">
${sessionScope.memId}�� �α��� �Ǽ̽��ϴ�!!!!!!!!!!!!!
<img src="${imgPath}" width="200" height="200">
<form action="/tvlog/logout.trip">
<input type="submit" value="�α׾ƿ�">
</form>
</c:if>

<form action="/tvlog/deleteForm.trip">
<input type="submit" value="Ż��">
</form>


<c:if test="${sessionScope.memId==null}">
<script>
alert("id&pwȮ���ϼ���");
history.go(-1);
</script>
</c:if>

<input type="button" value="Ȯ�� " onclick="javascript:window.location='main.trip'"/>
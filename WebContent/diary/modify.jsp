<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	alert("modify.jsp 호출");
</script>
<c:set var="vo" value="${vo}" />
<input type="text" name="diary_title" value="${vo.diary_title}" /><br />
<textarea name="diary_content">${vo.diary_content}</textarea>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<button type="button" onclick="javascript:location.href='/tvlog/diary/editor.trip'">일기 쓰기</button>
<c:forEach var="vo" items="${list}">
<table board="1" width="300" height="300">
<hr color="red">
<tr><td>
<a href="/tvlog/diary/view.trip?num=${vo.diary_num}">
${vo.diary_num} is vo.diary_num<br />
${vo.diary_writer} is vo.diary_writer<br />
${vo.diary_title} is diary_title<br />
${vo.diary_content} is diary_content<br />
${vo.diary_location} is diary_location<br />
${vo.diary_range} is diary_range<br />
${vo.diary_reg} is diary_reg<br />
</a>
</td></tr>
</table><br />
</c:forEach>
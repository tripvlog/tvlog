<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.schedule-content{
		width : 370px; 
		height: 150px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px;  
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}
</style>
<c:if test="${scheduleCount > 0 }">
	<div id="post">
	<table width="1140px">
		<c:forEach begin="0" end="${(fn:length(scheduleList) + 2) / 3 - 1}" var="row">
			<tr>
			    <c:forEach begin="0" end="2" var="col">
			        <c:set var="scheduleDTO" value="${scheduleList[row * 3 + col]}"/>
			        <c:if test="${not empty scheduleDTO}">
			        	<td>
			        		<div class="schedule-content" style="background-image:url('/tvlog/img/schedule/${scheduleDTO.s_mainimg}');" onclick="window.location='/tvlog/schedule/schedule-content.trip?s_num=${scheduleDTO.s_num}'">
				        		${scheduleDTO.s_title}	    
			        		</div>
			        	</td>
			        </c:if>
			    </c:forEach>
			</tr>
		</c:forEach>
		</table>
		</div>
</c:if>
<c:if test="${scheduleCount == 0 }">
	<h2>등록된 일정이 없습니다..!!</h2>
</c:if>
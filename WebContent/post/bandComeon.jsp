<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function aaa_click(){
	self.close()}
</script>

<c:if test="${list.size() ==0 }">
	�ʴ��� ��尡 �����ϴ�<br/>
	<button type="button" class="btn btn-primary" onClick="aaa_click();">�ݱ�</button>
</c:if>
<c:if test="${list.size() !=0 }">
	<h4>${friend_id }���� ��� ���� �ʴ��Ͻðڽ��ϱ�?</h4> 
		<c:forEach var="list" items="${list}">
		��� �̸� :	 ${list.band_name }&nbsp;&nbsp;&nbsp;��� ���̵� : ${list.band_id }
		<form action="bandselect.trip" method="post">
			<input type="hidden" name="band_id" value="${list.band_id }">
			<input type="hidden" name="band_name" value="${list.band_name }">
			<input type="hidden" name="band_member_id" value="${friend_id }">
			<input type="submit" value="�ʴ�">
			<button type="button" class="btn btn-primary" onClick="aaa_click();">���</button>
		</form>
	
 	</c:forEach>
</c:if>


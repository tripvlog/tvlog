<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function aaa_click(){
	self.close()}
</script>

<c:if test="${list.size() ==0 }">
	초대할 밴드가 없습니다<br/>
	<button type="button" class="btn btn-primary" onClick="aaa_click();">닫기</button>
</c:if>
<c:if test="${list.size() !=0 }">
	<h4>${friend_id }님을 어느 밴드로 초대하시겠습니까?</h4> 
		<c:forEach var="list" items="${list}">
		밴드 이름 :	 ${list.band_name }&nbsp;&nbsp;&nbsp;밴드 아이디 : ${list.band_id }
		<form action="bandselect.trip" method="post">
			<input type="hidden" name="band_id" value="${list.band_id }">
			<input type="hidden" name="band_name" value="${list.band_name }">
			<input type="hidden" name="band_member_id" value="${friend_id }">
			<input type="submit" value="초대">
			<button type="button" class="btn btn-primary" onClick="aaa_click();">취소</button>
		</form>
	
 	</c:forEach>
</c:if>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
	function OpenWindow(url,intWidth,intHeight) { 
	      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
	} 
	</script>

<c:if test="${list.size() > 0 }">
	<c:forEach var="list" items="${list}">
아이디 : ${list.id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
닉네임 : ${list.name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="친구 신청" onClick="javascript:OpenWindow('newFriend.trip?friend_id=${list.id }','400','250')">
 <br/>
	</c:forEach>
</c:if>
<c:if test="${list.size() < 1}">
 찾는 아이디, 혹은 닉네임이 없습니다. 확인해 주세요.
</c:if>
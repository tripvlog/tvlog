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
���̵� : ${list.id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
�г��� : ${list.name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="btn btn-primary" value="ģ�� ��û" onClick="javascript:OpenWindow('newFriend.trip?friend_id=${list.id }','400','250')">
 <br/>
	</c:forEach>
</c:if>
<c:if test="${list.size() < 1}">
 ã�� ���̵�, Ȥ�� �г����� �����ϴ�. Ȯ���� �ּ���.
</c:if>
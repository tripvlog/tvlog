<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
function aaa_click(){
	self.close()}
</script>



  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">${friend_id } 님을 어느 밴드로 초대하시겠습니까?</h4>
	      </div>
	      <div class="modal-body">
		
		<c:if test="${list.size() ==0 }">
			초대할 밴드가 없습니다<br/>
			<button type="button" class="btn btn-primary" onClick="aaa_click();">닫기</button>
		</c:if>
		
		<c:if test="${list.size() !=0 }">
		<c:forEach var="list" items="${list}">
		밴드 이름 :	 ${list.band_name }&nbsp;&nbsp;&nbsp;
		<form action="bandselect.trip" method="post">
			<input type="hidden" name="band_id" value="${list.band_id }">
			<input type="hidden" name="band_name" value="${list.band_name }">
			<input type="hidden" name="band_img" value="${list.band_img }">
			<input type="hidden" name="band_member_id" value="${friend_id }">
			<input type="submit" class="btn btn-success"  value="초대">
			<button type="button" class="btn btn-primary" onClick="aaa_click();">취소</button>
		</form>
	
 	</c:forEach>
</c:if>
		
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	  
	  
	  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

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
		<h4 class="modal-title" id="myModalLabel">내 밴드 초대</h4>
	      </div>
	      <div class="modal-body">
			
			<c:if test="${count == 0 }">
			${dto.band_name}${band_name} 밴드에 초대하였습니다
			</c:if>
			<c:if test="${count != 0 }">
 			이미 활동 중인 밴드입니다.
			</c:if>
				<br/>
	 			<button type="button" class="btn btn-primary" onClick="aaa_click();">닫기</button>
		
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	  
	  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
function aaa_click(){
	self.close()
}

</script>

 <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">친구 신청</h4>
	      </div>
	      <div class="modal-body">
	  				<b>${friend_id } 님께 친구 신청하시겠습니까?</b><br/> 
    				<form action="newFriendPro.trip" method="post">
    					<input type="hidden" name="friend_id" value="${friend_id }">
    					<input type="hidden" name="id" value="${id }">
    					<input type="submit" value="신청" class="btn btn-warning"/> 
						<button type="button" class="btn btn-primary" onClick="aaa_click();">취소</button>
					</form>
	       </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
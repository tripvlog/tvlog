<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<style>
	#search{
	width:90px;
	float: left;
	}
	#search2{
	width:300px;
	float: left;
	}
	#search3{
	float: left;
	}
	#aa{
	float: left;
	}
	#bb{
	float: left;
	}
	
</style>
	
	<script type="text/javascript">
	function OpenWindow(url,intWidth,intHeight) { 
	      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
	} 
	</script>
	
	
<center><h4>밴드 관리</h4></center>



	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">요청된 밴드 가입</h4>
	      </div>
	      <div class="modal-body">
			

	 		<c:forEach var="list" items="${list}">
 			<form action="bandmemberOk.trip" method="post">
			아이디 : ${list.band_member_id }
 			이름 :${list.band_member_name }
			<input type="hidden" name="band_name" value="${band_name }">
			<input type="hidden" name="band_id" value="${band_id }">
			<input type="hidden" name="band_member_id" value="${list.band_member_id }">
 			<input type="submit" class="btn btn-warning" value="수락" >
 			<input type="button" class="btn btn-danger" onClick="javascript:location.href='/tvlog/post/bandmemberNo.trip?band_id=${band_id}&band_member_id=${list.band_member_id}'" value="거부" >		
 			</form>
			</c:forEach>
		
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	  
	  
	  
	  
	  

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
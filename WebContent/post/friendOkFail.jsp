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
		<h4 class="modal-title" id="myModalLabel">ģ�� ��û</h4>
	      </div>
	      <div class="modal-body">
	  		
		<c:if test="${count == 0 }">
		ģ�� ��û�� �Ϸ�ƽ��ϴ�.
		</c:if>
		<c:if test="${count != 0 }">
		�̹� ģ���̰ų� ��û�� �Ϸ�� ����Դϴ�.
		</c:if>
	  	<button type="button" class="btn btn-primary" onClick="aaa_click();">�ݱ�</button>
	       </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>



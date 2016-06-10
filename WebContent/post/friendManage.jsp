<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	  <script type="text/javascript">
    $(document).ready(function(){
      $("#button").click(function(){
          callAjax();
      });
    });
    function callAjax(){
        $.ajax({
	        type: "post",
	        url : "/tvlog/post/friendSearch.trip",
	        data: {	// url �������� ������ �Ķ����
	        	select : $('#select').val(),
       			find : $('#find').val(),
	        },
	        success: test,	// ��������û ������ ���� �Լ�
	        error: whenError	//��������û ���н� �����Լ�
     	});
    }
    function test(aaa){	// ��û������ ������������ aaa ������ �ݹ�ȴ�. 
        $("#friend").html(aaa);
        console.log(resdata);
    }
    function whenError(){
        alert("Error");
    }
  </script>
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
	
	
<center><h4>�� ģ�� ����</h4></center>



	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">���� ģ�� ��û (${count }) ��</h4>
	      </div>
	      <div class="modal-body">
			

	 		<c:forEach var="list" items="${list}">
 			<form action="okFriend.trip" method="post">
 			
			 ���̵� : ${list.friend_id }&nbsp;&nbsp;
 			��¥ : <fmt:formatDate value="${list.friend_reg}" type="both"/>&nbsp;&nbsp;&nbsp;&nbsp;

 			<input type="hidden" name="friend_id" value="${list.friend_id }">
 			<input type="submit" class="btn btn-warning" value="����" >
 			<input type="button" class="btn btn-default" value="����" onClick="javascript:location.href='/tvlog/post/noFriend.trip?friend_id=${list.friend_id}&id=${sessionScope.memId}'">
 			</form>
			</c:forEach>
		
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>


	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">���� ���� ģ�� ��û (${count2 }) ��</h4>
	      </div>
	      <div class="modal-body">

			<c:forEach var="list2" items="${list2}">
			���̵� : ${list2.friend_id }&nbsp;&nbsp;
 			��¥ : <fmt:formatDate value="${list2.friend_reg}" type="both"/></br>	
			</c:forEach></p>
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>


	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">�� ģ�� ��� (�� ${count3 } ��)</h4>
	      </div>
	      <div class="modal-body">
			
			<c:forEach var="list3" items="${list3}">
			<div id="aa">
			���̵� : ${list3.friend_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<form action="deleteFriend.trip" method="post">
			<div id="bb">
 				<input type="button" onClick="javascript:OpenWindow('bandComeon.trip?friend_id=${list3.friend_id }','470','340')" class="btn btn-success" value="��� �ʴ�" > 	
				<input type="hidden" name="friend_id" value="${list3.friend_id }">
 				<input type="submit" class="btn btn-danger" value="ģ�� ����" > <br/>	
			</div><br/>
			</form>
			
			</c:forEach></p>
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	
	 <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">ģ�� �˻�</h4>
	      </div>
	      <div class="modal-body">
	      	<h3> <div id="friend"></div> </h3>
	       	<div id="search">
			 <form action="friendSearch.trip" method="post" onsubmit="return false;">
	         <select name="select" id="select" class="form-control">
         	 <option selected value="name">�г���</option>
         	 <option selected value="id">���̵�</option>          	 
          	 </select> 
          </div>
          <div id="search2">
          <input type="text" id="find" name="find" placeholder="�˻��� ���̵� Ȥ�� �г����� �Է��ϼ���" class="form-control"></input>
          </div>
          <div id="search3">
          <input type="button" id="button" class="btn btn-success" value="�˻�"></input>
          </div>
          </form>
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
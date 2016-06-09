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
	
	
<center><h4>내 밴드 관리</h4></center>



	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">내 밴드 목록 (${count }) 개</h4>
	      </div>
	      <div class="modal-body">
			

	 		<c:forEach var="list" items="${list}">
 			<form action="bandKing.trip" method="post">
			
 			밴드 이름 :${list.band_name }
			<input type="hidden" name="band_name" value="${list.band_name }">
			<input type="hidden" name="band_id" value="${list.band_id }">
 			<input type="submit" class="btn btn-warning" value="관리" >
 			<input type="button" class="btn btn-danger" onClick="javascript:location.href='/tvlog/post/bandBye.trip?band_id=${list.band_id}&band_name=${list.band_name}'" value="탈퇴" >		
 			</form>
			</c:forEach>
		
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>

<!-- 
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">내가 보낸 친구 신청 (${count2 }) 개</h4>
	      </div>
	      <div class="modal-body">

			<c:forEach var="list2" items="${list2}">
			아이디 : ${list2.friend_id }&nbsp;&nbsp;
 			날짜 : <fmt:formatDate value="${list2.friend_reg}" type="both"/></br>	
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
		<h4 class="modal-title" id="myModalLabel">내 친구 목록 (총 ${count3 } 명)</h4>
	      </div>
	      <div class="modal-body">
			
			<c:forEach var="list3" items="${list3}">
			<div id="aa">
			아이디 : ${list3.friend_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<form action="deleteFriend.trip" method="post">
			<div id="bb">
 				<input type="button" onClick="javascript:OpenWindow('bandComeon.trip?friend_id=${list3.friend_id }','470','340')" class="btn btn-success" value="밴드 초대" > 	
				<input type="hidden" name="friend_id" value="${list3.friend_id }">
 				<input type="submit" class="btn btn-danger" value="친구 끊기" > <br/>	
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
		<h4 class="modal-title" id="myModalLabel">친구 검색</h4>
	      </div>
	      <div class="modal-body">
	      	<h3> <div id="friend"></div> </h3>
	       	<div id="search">
			 <form action="friendSearch.trip" method="post" onsubmit="return false;">
	         <select name="select" id="select" class="form-control">
         	 <option selected value="name">닉네임</option>
         	 <option selected value="id">아이디</option>          	 
          	 </select> 
          </div>
          <div id="search2">
          <input type="text" id="find" name="find" placeholder="검색할 아이디 혹은 닉네임을 입력하세요" class="form-control"></input>
          </div>
          <div id="search3">
          <input type="button" id="button" class="btn btn-success" value="검색"></input>
          </div>
          </form>
		
	      </div>
	      <div class="modal-footer">
		  </div>
	    </div>
	  </div>
	 -->
	

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
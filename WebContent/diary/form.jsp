<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<Html>
<head>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style></style>
<script></script>
</head>
<body><br />
<div class="container">

	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">일기 작성</button>

	<form action="/tvlog/diary/result.jsp" method="post" name="test">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false" data-backdrop="false">
	  <div class="modal-dialog">
	  테투리 밖
	    <div class="modal-content">
	    경계선
	      <div class="modal-header">
	      내용
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">트래블로그</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="exampleModalLabel">일기 작성</h4>
	      </div>
	      <div class="modal-body">
		  <div class="form-group">
		  
			    <label for="recipient-name" class="control-label">제목</label>
			    <input type="text" class="form-control" id="d_title" placeholder="제목" name="d_title">
		
			    <label for="message-text" class="control-label">내용</label>
		    	<textarea class="form-control" id="d_content" placeholder="내용" name="d_content"></textarea>
		  </div>
	      </div>
	      <div class="modal-footer">
	      <span class="glyphicon glyphicon-picture" aria-hidden="true">사진</span>
	      <span class="glyphicon glyphicon-globe" aria-hidden="true">지도</span>
		<button type="submit" class="btn btn-primary">Send message</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

		</form>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

</body></Html>
  
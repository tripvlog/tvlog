<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/projcet/postboard/common/css/css.css" type="text/css">
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
<script type="text/javascript" src="/tvlog/diary/diary_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>트래블로그</title>
<style>
	#container{
		margin-top: 7px;
	}
	#home-tab{
		width:568px;
	}
	#profile-tab{
		width:568px;
	}
	.post-content{
		width : 370px; 
		height: 250px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px; 
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
	}
</style>
</head>
<body>
	<jsp:include page="/main/header.jsp"></jsp:include>
	<div class="container" id="container">
	    <ul id="myTab" class="nav nav-pills" role="tablist">
	   	   <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="false">포스트</a></li>
	       <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="true">일기</a></li>
	  	</ul>
	  	<div id="myTabContent" class="tab-content">
	    	<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
	     		<div id="post">
					<table  width="1140px">
						<c:forEach begin="0" end="${(fn:length(list) + 2) / 3 - 1}" var="row">
							<tr>
							    <c:forEach begin="0" end="2" var="col">
							        <c:set var="post" value="${list[row * 3 + col]}"/>
							        <c:if test="${not empty post}">
							        <td  width="380px"> 
							        	<div class="post-content" style="background-image:url('${post.file_savname}');" onclick="window.location='/tvlog/post/postList.trip'">
							        		${post.subject }
							        	</div>
							        </td>
							        </c:if>
							    </c:forEach>	
							</tr>
						</c:forEach>
					</table>
				</div>   
	    	</div>
	    	<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
	     		<table  width="1140px">
					<c:forEach begin="0" end="${(fn:length(diary_select_1range) + 2) / 3 - 1}" var="row">
						<tr>
						    <c:forEach begin="0" end="2" var="col">
						        <c:set var="vo" value="${diary_select_1range[row * 3 + col]}"/>
						        <c:if test="${not empty vo}">
						        <td  width="380px">
						        	<div class="diary_select-content" style="background-image:url('/tvlog/img/myPage/myPageDefault.png');" onclick="window.location='/tvlog/diary/view.trip?num=${vo.diary_num}'">
						        		${vo.diary_writer}<br />
										${vo.diary_title}<br />			
						        	</div>
						        	<br />
						        </td>
						        </c:if>
						    </c:forEach>
						</tr>
					</c:forEach>
				</table>
	   		</div>
		</div>
	</div>
</body>
</html>
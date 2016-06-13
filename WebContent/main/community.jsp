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
	
	#contain{
         width: 1140px;
         margin: auto;
       

	}
	.ellipsis{
	width:250px;
	display:inline-blosck;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
	}
	
	#test11{
		width: 90px;
		float: left;
		margin: 0;
		padding: 0;
	}
	#test22{
		width:483px;
		float: left;
	}
	#test33{
	width:800px;
	float: left;
	}
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
	#postwrite{
	width:700px;
	margin:auto;
	}
</style>
<!-- 네이버 스마트 에디터 사용 부분 -->
	<script type="text/javascript">

		
		function OpenWindow(url,intWidth,intHeight) { 
		      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
		} 
</script>
</head>
<body>
	<jsp:include page="/main/header.jsp"></jsp:include>
	<div class="container" id="container">
		<div id="totalDiv" style="margin-left: 15px">
				<h3>다이어리</h3> 
				<c:if test="${sessionScope.memId != null}">
					<button type="button" onclick="javascript:location.href='/tvlog/diary/editor.trip'">일기 쓰기</button>
				</c:if>
				<table width="1000" cellspacing="0" cellpadding="2" class="table">
					<tr align="center"  class="active">
						<td>일기 작성자</td>
						<td>일기 제목</td>
						<td>일기 보러가기</td>
					</tr>
					<c:forEach var="diaryDTO" items="${diary_select_1range}">
						<tr align="center">
							<td>${diaryDTO.diary_writer}</td>
							<td>${diaryDTO.diary_title}</td>
							<td><input type="button" value="이동" onclick="window.location='/tvlog/diary/view.trip?num=${diaryDTO.diary_num}'"></td>
						</tr>
					</c:forEach>
				</table>
		</div>	
	</div>
</body>
</html>
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
<link rel="stylesheet" href="/tvlog/css/default.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

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
	#diaryContent img{
		width: 700px;
	}
	#diaryContent{
		text-align: left;
	} 
	#btn{
		float: right;
	}
	
	#mainImg {
	width: 1140px;
	min-height: 270px;
	background-size : 1140px;
	background-image : url('/tvlog/img/diary/diaryimage.jpg');
	text-align: center;
	position:relative; 
	}
	#mainImg #p1{
	font-size : 50px;	
	font-weight: bold;
	color: #FFFFFF;
	position:absolute;
	width:600px; left:0; right:0; margin-left:auto; margin-right:auto;
	height:40px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto;
	}
	#mainImg #p2{
	font-size : 20px;	
	font-weight: bold;
	position:absolute;
	width:600px; left:0; right:0; margin-left:420px; margin-right:auto;
	height:30px; top: 0; bottom:0; margin-top:180px; margin-bottom:auto;
	}
	
	#main2{
		font-size : 15px;
		margin-top: :20px;
		margin-bottom: :20px;
		border-bottom : 2px solid #BDBDBD;
	}
</style>
<!-- 네이버 스마트 에디터 사용 부분 -->
	<script type="text/javascript">
		function OpenWindow(url,intWidth,intHeight) { 
		      window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
		} 
</script>
</head>
<body id="mainBody">
	<jsp:include page="/main/header.jsp"></jsp:include>
	<div class="container" id="container">
		<div id="mainImg">
			<p id="p1">
				다이어리
			</p>
		</div>
		
		<div id="main2">
			
			<h3>공개된 일기 : ${myDiaryListCount}개</h3>

		</div>
		
		<div id="totalDiv" style="margin-left: 15px">
				<h3>다이어리</h3> 
				<c:if test="${sessionScope.memId != null}">
					<button id="btn" type="button" class="btn btn-success" onclick="javascript:location.href='/tvlog/diary/editor.trip'">일기 쓰기</button>
				</c:if>
				<table width="1000" cellspacing="0" cellpadding="2" class="table">
					<tr align="center"  class="active">
						<td>일기 작성자</td>
						<td>일기 제목</td>
					</tr>
					<c:forEach var="diaryDTO" items="${diary_select_1range}">
						<tr align="center">
							<td width="30%">${diaryDTO.diary_writer}</td>
							<td>
								<div data-toggle="modal" data-target="#diaryModal${diaryDTO.diary_num}">
								${diaryDTO.diary_title}
								</div>
								<div class="modal fade" id="diaryModal${diaryDTO.diary_num}"  role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							    	<div class="modal-dialog modal-lg" >
							    		<div class="modal-content" >
							      			<div class="modal-header" >
												<div class="panel panel-success" >
													<div class="panel-heading">
														<h3>${diaryDTO.diary_writer}님 일기</h3>
													</div>
													<div class="panel-body" id="diaryContent">
														${diaryDTO.diary_content}
													</div>
													<div class="panel-body">
														<input type="button" value="close" class="btn btn-warning" data-dismiss="modal" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
												
							</td>
							
						</tr>
					</c:forEach>
				</table>
		</div>	
	</div>
</body>
</html>
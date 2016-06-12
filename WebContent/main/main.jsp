<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Bootstrap Uses a fixed left sidebar, that attaches after scrolling past a large top header. example snippet for Bootstrap." />
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
<script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style type="text/css">	
	body {
		padding-top: 2px;
	}
	#content{
		width: 1200px;
		margin: 0px;
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
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-40413119-1', 'bootply.com');
        ga('send', 'pageview');
</script>
</head>
<body id="mainBody">

<jsp:include page="/main/header.jsp" />

<div class="container" id="container">
	<!-- 메인 지도 -->
	<div id="content">
		<iframe src="/tvlog/diary/cluster.trip" name="map" width="1140" height="410" ALLOWTRANSPARENCY="false"frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	</div>
	
	<!-- 메인 포스트 -->
	<div id="post">
		<h3 style="background-color:skyblue;">POST</h3>
		<table  width="1140px">
			<c:forEach begin="0" end="${(fn:length(postList) + 2) / 3 - 1}" var="row">
				<tr>
				    <c:forEach begin="0" end="2" var="col">
				        <c:set var="post" value="${postList[row * 3 + col]}"/>
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
	
	<!-- 메인 밴드 -->
	<div id="band">
		<h3 style="background-color:green;">BAND</h3>
		<table  width="1140px">
			<c:forEach begin="0" end="${(fn:length(bandList) + 2) / 3 - 1}" var="row">
				<tr>
				    <c:forEach begin="0" end="2" var="col">
				        <c:set var="band" value="${bandList[row * 3 + col]}"/>
				        <c:if test="${not empty band}">
				        <td  width="380px">
				        	<div class="post-content" style="background-image:url('/tvlog/img/band/${band.band_img}');" onclick="window.location='/tvlog/band/b_view.trip?band_id=${band.band_id}'">
				        		${band.band_name }
				        	</div>
				        </td>
				        </c:if>
				    </c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>	
</body>
</html>
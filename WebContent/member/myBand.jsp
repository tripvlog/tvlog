<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/tvlog/schedule/schedule.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<title>트래블로그</title>
<style>
	#mainImg {
		width: 1140px;
		min-height: 270px;
		background-size : 1140px 400px;
		background-image : url('/tvlog/img/myBand/bandDefault.png');
		text-align: center;
		position:relative; 
	}
	#mainImg #p1{
		font-size : 50px;	
		font-weight: bold;
		color: #000000;
		position:absolute;
		width:600px; left:0; right:0; margin-left:auto; margin-right:auto;
		height:60px; top: 0; bottom:0; margin-top:70px; margin-bottom:auto;
	}
	.diary-content{
		width : 370px; 
		height: 150px; 
		padding-top : 100px;
		border-radius:10px; 
		margin-bottom:10px;  
		opacity: 1;
		font-size: 25px; 
		font-weight: bold;
		text-align: center; 
		color: #ffffff;
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
	#del{
		position:inherit;
		float: right;
		margin-right: 10px;
	}
</style>
<script type="text/javascript">
	function delView(idNum){
		icon = document.getElementById("delIcon"+idNum);
		icon.style.visibility = "visible";		
	}
	function delHide(idNum){
		icon = document.getElementById("delIcon"+idNum);
		icon.style.visibility = "hidden";		
	}
	function del(band_id){
		if (confirm("정말 삭제하시겠습니까??") == true){ 
			window.location="/tvlog/diary/myDiaryDelete.trip?band_id="+band_id;
		}else{
		    return;
		}
		
	}
</script>
</head>
<body id="mainBody">
<jsp:include page="/main/header.jsp" />
	<div class="container" id="container">
		<!-- 여행 이지미  제목 들어갈 곳 -->
		<div id="mainImg">
			<div id="p1">
				<p><img src="/tvlog/img/member/${member.path}" width="130" height="130" style="align:center;Border-radius:40px;">
				<br /><font size="5">${member.name} </font></p>
			</div>
		</div>
	
		<div id="main2">
			<h3>내가 가입한 밴드 : (${myBandListCount} 개)</h3>
		</div>
		
		<div> <br/>
			<c:if test="${myBandListCount != 0}">
				<div id="diary">
				<table width="1140px">
					<c:forEach begin="0" end="${(fn:length(band) + 2) / 3 - 1}" var="row">
						<tr>
						    <c:forEach begin="0" end="2" var="col">
						        <c:set var="bandDTO" value="${band[row * 3 + col]}"/>
						        <c:if test="${not empty bandDTO}">
						        	<td onmouseover="delView('${bandDTO.band_id}')" onmouseout="delHide('${bandDTO.band_id}')">
						        		<div id="del">
						        			<i class="fa fa-times-circle fa-2x" id="delIcon${bandDTO.band_id}" style="visibility:hidden;" aria-hidden="true" onclick="del('${bandDTO.band_id}')"></i>
						        		</div>
						        		<div class="diary-content" style="background-image:url('/tvlog/img/band/default.jpg');" onclick="window.location='/tvlog////////////////////.trip?band_id=${bandDTO.band_id}'">
							        		${bandDTO.band_intro}	    
						        		</div>
						        	</td>
						        </c:if>
						    </c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:if>
			<c:if test="${myBandListCount == 0}">
				<h2>등록된 일기가 없습니다.</h2>
			</c:if>
		</div>
	</div>
</body>
</html>




































\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<title>트래블로그</title>
</head>
<body>
<jsp:include page="/main/header.jsp" />
	<div id="totalDiv" style="margin-left: 9%;">
	  				<h4>밴드로 이동 <i class="fa fa-hand-o-right" aria-hidden="true"></i> <input type="button" value="이동" onClick="javascript:window.location='/tvlog/band/b_list.trip'"></h4>
					<c:if test="${myBandListCount != 0}">
						<h4>내가 가입한 밴드 (${myBandListCount} 개)</h4>
							<table >
								<c:forEach begin="0" end="${(fn:length(band) + 3) / 4 - 1}" var="row">
									<tr>
					    				<c:forEach begin="0" end="3" var="col">
											<c:set var="bandDTO" value="${band[row * 4 + col]}"/>
											<c:if test="${not empty bandDTO}">
					        					<td>
					        						<div id="band-list" onclick="window.location=''">
						        						<img src="/tvlog/img/band/${bandDTO.band_img}" width="100" height="100" style="align:center;border-radius:30px; ">
						        						<br />
						        						${bandDTO.band_name}<br />					    
					        							${bandDTO.band_leader}<br />
					        							${bandDTO.band_intro}
					        						</div>
					        					</td>
					        				</c:if>
					    				</c:forEach>
									</tr>
								</c:forEach>
							</table>
					</c:if>
					<c:if test="${myBandListCount == 0}">
						등록된 밴드가 없습니다.
					</c:if>
	</div>
</body>
</html>

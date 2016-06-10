<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
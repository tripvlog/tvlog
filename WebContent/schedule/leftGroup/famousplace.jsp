<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="famousplace">
	<ul id="famousplace-Tab" class="nav nav-pills" role="tablist">
		<li role="presentation" class="active"><a data-target="#day1" id="day1-tab" role="tab" data-toggle="tab" aria-controls="day1" aria-expanded="true">Day 1</a></li>
		<c:forEach var="i" begin="2" end="${dto.s_endday}" step="1">
			<li role="presentation" class=""><a data-target="#day${i}" role="tab" id="day${i}-tab" data-toggle="tab" aria-controls="day${i}" aria-expanded="false">Day ${i}</a></li>
		</c:forEach>
	</ul>
	<!-- 각 탭을 눌렀을 때 동작하는 내용 -->
	<div id="famousplaceTab" class="tab-content">
		<div role="tabpanel" class="tab-pane fade active in" id="day1" aria-labelledby="day1-tab">
			<c:forEach items="${detaillist}" var="detailDTO" >
				<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == 1}">
					<c:if test="${detailDTO.sd_status == 1}">
						${detailDTO.sd_startpoint}<br />
					</c:if>
				</c:if>
			</c:forEach>
		</div>
		<c:forEach var="j" begin="2" end="${dto.s_endday}" step="1" varStatus="k">
			<div role="tabpanel" class="tab-pane fade" id="day${j}" aria-labelledby="day${j}-tab">
				<c:forEach items="${detaillist}" var="detailDTO" >				
					<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == j}">
						<c:if test="${detailDTO.sd_status == 1}">
							${detailDTO.sd_startpoint}<br />
						</c:if>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>
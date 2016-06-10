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
 <div class="budget">
	<ul id="budget-tab" class="nav nav-pills" role="tablist">
	  <li id="b-tab-li" role="presentation" class="active"><a data-target="#b-tab1" id="b-tab1-tab" role="tab" data-toggle="tab" aria-controls="b-tab1" aria-expanded="true">전체 비용</a></li>
	  <li id="b-tab-li" role="presentation" class=""><a data-target="#b-tab2" role="tab" id="b-tab2-tab" data-toggle="tab" aria-controls="b-tab2" aria-expanded="false">일일 지출</a></li>
	</ul>
	<!-- 각 탭을 눌렀을 때 동작하는 내용 -->
	<div id="budgetTab" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="b-tab1" aria-labelledby="b-tab1-tab">
	    <ul class="tasks" id="totalCost">
	     	<li class="totalCost" id="totalCost1_1" data-tabid="1" data-itemid="1">
	     		<i class="fa fa-bus" aria-hidden="true"></i>  교통 
	     		<c:set var="sum" value="0"/>
	     		<c:forEach items="${detaillist}" var="detailDTO" >
	     			<c:if test="${detailDTO.sd_status == 0}">
	     				<c:set var="sum" value="${detailDTO.sd_budget + sum}"/>
	     			</c:if>
	     		</c:forEach>
	     		${sum}원
	     	</li>
	     	<li class="totalCost" id="totalCost1_2" data-tabid="1" data-itemid="2">
	     		<i class="fa fa-hospital-o" aria-hidden="true"></i>  장소
	     		<c:set var="sum1" value="0"/>
	     		<c:forEach items="${detaillist}" var="detailDTO" >
	     			<c:if test="${detailDTO.sd_status == 1}">
	     				<c:set var="sum1" value="${detailDTO.sd_budget + sum1}"/>
	     			</c:if>
	     		</c:forEach>
	     		${sum1}원
	     	</li>
	     </ul>	
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="b-tab2" aria-labelledby="b-tab2-tab">
	      <ul class="tasks" id="b-tab2-ul">
	      	<c:forEach var="j" begin="1" end="${dto.s_endday}" step="1" varStatus="k">
	     	  <li class="totalCost" id="totalCost1_0" data-tabid="1" data-itemid="0">
	     	  	<i class="fa fa-calendar" aria-hidden="true"></i>  Day ${j}
	     	  	<c:set var="sum" value="0"/>
	     	  	<c:forEach items="${detaillist}" var="detailDTO" >
	     	  		<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == j}">
	     	  			<c:if test="${detailDTO.sd_status == 0}"> 
	       		  			<c:set var="sum" value="${detailDTO.sd_budget + sum}"/>
	       		  		</c:if>
	       		  	</c:if>
	       		</c:forEach>
	       		<i class="fa fa-bus" aria-hidden="true"></i>  교통
	       		${sum}원
	       		<c:set var="sum" value="0"/>
	     	  	<c:forEach items="${detaillist}" var="detailDTO" >
	     	  		<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == j}">
	     	  			<c:if test="${detailDTO.sd_status == 1}">
	       		  			<c:set var="sum" value="${detailDTO.sd_budget + sum}"/>
	       		  		</c:if>
	       		  	</c:if>
	       		</c:forEach>
	       		<i class="fa fa-hospital-o" aria-hidden="true"></i>  장소
	       		${sum }원
	      	  </li>
	      	</c:forEach>
	      </ul>
	  </div>
	</div>
</div>
</body>
</html>
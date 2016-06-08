<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <div id="" data-toggle="modal" data-target="#detailview${dto.sd_num}">
    	<c:if test="${dto.sd_status == 0}">
    		${dto.sd_startpoint} 
    		<i id="btn1" class="${dto.sd_transport}" aria-hidden="true"></i>
    		${dto.sd_endpoint} <br /> 
    	</c:if>
    	<c:if test="${dto.sd_status == 1}">
			<i class="fa fa-map-marker" aria-hidden="true"></i> ${dto.sd_startpoint}
		</c:if>
		<c:if test="${dto.sd_status == 2}">
			메모 : ${dto.sd_memo}
		</c:if>
	</div>
    	
    	<!-- 모달  -->
    	<div class="modal fade" id="detailview${dto.sd_num}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    		<div class="modal-dialog modal-lg" >
				<div class="modal-content" id="modalSize">
					<div class="modal-header" >
						<div class="panel panel-success" >
							<div class="panel-body" >
								<c:if test="${dto.sd_status == 0}">
									출발 : ${dto.sd_startpoint} 	
									<i id="btn1" class="${dto.sd_transport}" aria-hidden="true"></i>
									도착 : ${dto.sd_endpoint} <br />
									메모 : ${dto.sd_memo} <br />
									비용 : ${dto.sd_budget}
								</c:if>
								<c:if test="${dto.sd_status == 1}">
									<iframe src="/tvlog/schedule/schedule-detail-select-updateMap.jsp?latlng=${dto.sd_map}" name="map" width="370" height="205" ALLOWTRANSPARENCY="false"></iframe>
								</c:if>
								<c:if test="${dto.sd_status == 2}">
									메모 : ${dto.sd_memo}
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
    
    
  
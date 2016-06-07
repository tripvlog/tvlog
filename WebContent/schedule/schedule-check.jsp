<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 왼쪽 버튼 그룹 - 저장, 방문명소 -->
		<div id="savecontainer">
			<div id="btn-group" class="btn-group" role="group" aria-label="">
				<button type="button" class="btn btn-default btn-lg" id="scheduleSave" style="WIDTH:81pt" onclick="window.location='/tvlog/schedule/schedule-detailUpdate.trip?s_num=${dto.s_num}'"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><center> 일정 수정</center></button>
				<button type="button" class="btn btn-default btn-lg" style="WIDTH:55pt">
					<c:if test="${dto.s_range ==1}">
						<i class="fa fa-unlock" aria-hidden="true"></i><center> 전체</center>
					</c:if>
					<c:if test="${dto.s_range ==2}">
						<i class="fa fa-user" aria-hidden="true"></i><center> 밴드</center>
					</c:if>
					<c:if test="${dto.s_range ==3}">
						<i class="fa fa-users" aria-hidden="true"></i><center> 친구</center>
					</c:if>
					<c:if test="${dto.s_range ==4}">
						<i class="fa fa-lock" aria-hidden="true"></i><center> 비공개</center>
					</c:if>	
				</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#famousplace"><i class="fa fa-map-marker" aria-hidden="true"></i> 방문명소</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#budget"><i class="fa fa-krw" aria-hidden="true"></i> 여행가계부</button>
				<button type="button" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#checklist"><i class="fa fa-check-square-o" aria-hidden="true"></i> 체크리스트</button>
			</div>
		</div>
<!-- 방문명소 Modal -->
		<div class="modal fade" id="famousplace" tabindex="-1" role="dialog" aria-labelledby="famousplaceModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        				<h4 class="modal-title" id="famousplaceModalLabel">방문 명소</h4>
      				</div>
      				<div class="modal-body">
       				<!-- 모달내용 -->       
      				<!-- 탭시작 -->
       					<jsp:include page="leftGroup/famousplace.jsp" />
       				<!-- 탭 끝 --> 
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        				<button type="button" class="btn btn-primary">Save changes</button>
      				</div>
    			</div>
  			</div>
		</div>

<!-- 가계부 Modal -->
		<div class="modal fade" id="budget" tabindex="-1" role="dialog" aria-labelledby="budgetModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        				<h4 class="modal-title" id="budgetModalLabel">여행 가계부</h4>
      				</div>
      				<div class="modal-body">
       				<!-- 모달내용 -->       
      				<!-- 탭시작 -->
      					<jsp:include page="leftGroup/budget.jsp" />
       				<!-- 탭 끝 -->    
      				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        				<button type="button" class="btn btn-primary">Save changes</button>
      				</div>
    			</div>
  			</div>
		</div>

<!-- 체크리스트 Modal -->
		<div class="modal fade" id="checklist" tabindex="-1" role="dialog" aria-labelledby="checklistModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="checklistModalLabel">체크 리스트</h4>
		      </div>
		      <div class="modal-body">
		       <!-- 모달내용 -->
		       
		      <!-- 탭시작 -->
		       <jsp:include page="leftGroup/checklist.jsp" /> 
		       <!--  탭 끝 -->    
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div> 
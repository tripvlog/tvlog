<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
         <table>

 <c:forEach var="colist" items="${colist}">
         
         <tr>
                    
              <td width="500"><b><font face="±º∏≤√º" size="3">&nbsp;&nbsp;${colist.id}</font></b> &nbsp; &nbsp; &nbsp;
     		  <font size="2"><fmt:formatDate type="date" value="${colist.regdate}"/></font></td>
		</tr>
		<tr>
              <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;${colist.content}</td>
              	<c:if test="${sessionScope.memId !=null }">
        	 	<c:if test="${sessionScope.memId == colist.id }"> 
              <td>
        	 	<form action="deleteComment.trip" method="post">
        	 		<input type="hidden" name="no" value="${colist.no }">
        	 		<input type="hidden" name="co_no" value="${colist.co_no }">
        	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-danger">ªË¡¶</button>
        	 	</form>	
        	 </td>
        		 </c:if>
        		 </c:if>
         </tr>
  </c:forEach>
</table>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
         <table>

 <c:forEach var="colist" items="${colist}">
         
         <tr   align="center">
                    
              <td align="center">${colist.id}</td>
              <td align="left">${colist.content}</td>
     		  <td align="center" width="40"><fmt:formatDate value="${colist.regdate}" type="date"/></td>
         </tr>
  </c:forEach>
</table>
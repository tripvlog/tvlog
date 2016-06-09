<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${count == 0 }">
${dto.band_name}${band_name} 밴드에 초대하였습니다
</c:if>
<c:if test="${count != 0 }">
 이미 활동 중인 밴드입니다.
</c:if>
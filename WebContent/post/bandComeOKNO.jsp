<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${count == 0 }">
${dto.band_name}${band_name} ��忡 �ʴ��Ͽ����ϴ�
</c:if>
<c:if test="${count != 0 }">
 �̹� Ȱ�� ���� ����Դϴ�.
</c:if>
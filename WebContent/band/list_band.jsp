<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="band" items="${b_list}"><a href="/tvlog/band/b_view.trip?band_id=${band.band_id}">
${band.band_id}<br />
${band.band_name}<br />
<img src="/tvlog/img/band/${band.band_img}"><br />
${band.band_intro}<br />
${band.band_range}<br />
${band.band_reg}<br /></a>
<hr color="red">
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<c:forEach var="comment" items="${b_board_comments}">
BAND_BOARD_COMMENT_BNO : ${comment.BAND_BOARD_COMMENT_BNO}<br />
BAND_BOARD_COMMENT_CNO : ${comment.BAND_BOARD_COMMENT_CNO}<br />
BAND_BOARD_COMMENT_WRITER : ${comment.BAND_BOARD_COMMENT_WRITER}<br />
BAND_BOARD_COMMENT_COMMENT : ${comment.BAND_BOARD_COMMENT_COMMENT}<br />
BAND_BOARD_COMMENT_REG : ${BAND_BOARD_COMMENT_REG}<br />
</c:forEach>
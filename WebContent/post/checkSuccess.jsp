<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>비밀번호 확인</title>
	<link rel="stylesheet" href="/project/board/common/css/css.css" type="text/css">
	<script type="text/javascript">
		function locationURL() {
		
		if ( window.name == 'modify' ) 
			window.opener.parent.location.href='postModifyList.trip?no=${dto.no}&currentPage=${currentPage}';
				
		else if ( window.name == 'delete' ) 
		{
			alert('삭제되었습니다.');
			window.opener.parent.location.href='postList.trip';
		}
			
		window.close();
		}
	</script>
</head>
  
<body>
  	<script>locationURL()</script>
</body>
</html>


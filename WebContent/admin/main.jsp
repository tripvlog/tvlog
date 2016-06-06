<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>트래블로그</title>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/tvlog/admin/normalize.css" />
		<link rel="stylesheet" type="text/css" href="/tvlog/admin/style2.css" />
	</head>
	<body>
		<div class="container">
			<div id="theGrid" class="main">
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Post All Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${postAllCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Post Day Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${postDayCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Schedule All Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${scheduleAllCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Schedule Day Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${scheduleDayCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Band All Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${bandAllCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Band Day Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${bandDayCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Member Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${memberAllCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Diary All Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${diaryAllCount} </span>
						</div>
					</a>
					<a class="grid__item" href="#">
						<h2 class="title title--preview"> Diary Day Count</h2>
						<div class="loader"></div>
						<div class="meta meta--preview">
							<span class="meta__avatar"> ${diaryDayCount} </span>
						</div>
					</a>
				</section>
			</div>
		</div>
	</body>
</html>
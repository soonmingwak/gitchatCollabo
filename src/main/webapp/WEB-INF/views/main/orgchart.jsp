<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">회사이름</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						이름(조직) </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<div class="row">
		<div class="col-2">
			<div class="list-group">
				<a href="${path}/" class="list-group-item list-group-item-action"
					aria-current="true"> 멤버 </a> <a href="${path}/chat"
					class="list-group-item list-group-item-action ">채팅 </a> 
				<a href="${path}/calender" class="list-group-item list-group-item-action">캘린더 </a> 
				<a href="${path}/todo" class="list-group-item list-group-item-action">할일 </a> 
				<a href="${path}/notice" class="list-group-item list-group-item-action">공지사항 </a> 
				<a href="${path}/att" class="list-group-item list-group-item-action">근태관리 </a> 
				<a href="${path}/orgchart" class="list-group-item list-group-item-action active">조직도 </a>
			</div>
		</div>
	</div>
	<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
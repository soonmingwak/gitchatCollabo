<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

<%
String id = (String) session.getAttribute("m_id");
if(id == null) response.sendRedirect("/main/chatlogin");
%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${path}/main">회사이름</a>
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
						${m_id}<br>마이페이지 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${path }/info">내정보</a>
						<a class="dropdown-item" href="${path }/logout">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${path}/set ">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>
	
	<h2>member list</h2>
	<table border ="1" width ="700px">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>소속</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			
		</tr>
		<c:forEach var="list" items="${list }">
		<tr>
			<td>${list.m_id }</td>
			<td>${list.m_name }</td>
			<td>${list.m_aff }</td>
			<td>${list.m_gender }</td>
			<td>${list.m_email }</td>
			<td>${list.m_tel }</td>
			
		</tr>
		</c:forEach>
	</table>
	
	<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
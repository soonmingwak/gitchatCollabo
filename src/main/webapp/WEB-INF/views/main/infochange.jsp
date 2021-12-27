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
						${member.m_id }<br>마이페이지 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${path }/info">내정보</a>
						<a class="dropdown-item" href="${path }/logout">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${path}/set ">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>
<div class="container">
	<div class="jumbotron">
 <h2>내 정보</h2>
  		 <form name="form1" method="POST" class="form-group" action="/changeAction">
			<table  width= 700px;>
				<tr  height=30px>
					<td  >아이디</td>
					<td ><input type="text" name="m_id" size="10"  value="${m_id}" readonly /></td>
        		</tr>
        		<tr  height=30px>
          			<td>비밀번호</td>
          			<td ><input type="password" name="m_pw" size="10" value="${m_pw}"/></td>
        		</tr>
        		<tr  height=30px>
          			<td >이름</td>
          			<td ><input type="text" name="m_name" size="10"  value="${m_name}"/></td>
        		</tr>
        		<tr  height=30px>
          			<td >소속</td>
          			<td ><input type="text" name="m_aff" size="10" value="${m_aff}"/></td>
        		</tr>
         		<tr  height=30px>
          			<td >이메일</td>
          			<td ><input type="email" name="m_email" size="15"  value="${m_email}"/></td>
        		</tr>
         		<tr  height=30px>
          			<td >전화번호</td>
          			<td ><input type="text" name="m_tel" size="10"  value="${m_tel}"/></td>
        		</tr>
         		<tr  height=30px>
          			<td >성별</td>
          			
          			<td><input type="radio" id="checkb_btn1" name="m_gender" value="${member.gender}">남
          			<input type="radio" id="checkb_btn1" name="m_gender" value="${member.gender}">여</td>
        		</tr>
        		<tr  height=30px>
          			<td >주소</td>
          			<td ><input type="text" name="m_adr" size="40"  value="${m.adr}"/></td>
        		</tr>
        		
        		
        	</table>
		
    		<div >
    			 <input type="submit" class="btn btn-success"  value="수정" id  ="btnUpdate">
     			 <a class="btn btn-warning">취소</a>
      
   			 </div>
    	</form>
	</div>
</div>
<br>
	


	
	
	<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
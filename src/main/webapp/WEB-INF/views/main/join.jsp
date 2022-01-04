<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>
<script>
$(document).ready(function () {

	var id_check_flag =false;
	var pw_check_flag =false;
	
	$('#m_pw2').change(function() {
		
		var m_pw  = $('#m_pw').val();
		var m_pw2 = $('#m_pw2').val();
		if (m_pw != m_pw2) {
			
			$('#diff_pw').show();
			$('#equal_pw').hide();
			pw_check_flag=false;
		}
		else {
			$('#equal_pw').show();
			$('#diff_pw').hide();
			pw_check_flag=true;
		}
	});
	
	
	$('#id_check').click(function() {
		var m_id = $('#m_id').val();
	
		if(m_id==""){
			alert('아이디를 입력하세요.');
			return;
		}
	
		$.ajax({
		
			type : 'GET',		
			url  : './idCheck',	
			data : {			
			
				m_id : m_id
			},
		
			dataType : 'text',	
			success : function(data) {	
			
				if(data == 0) {
					alert('사용가능한 아이디입니다.');
					$('#m_id').attr('readonly', true);
					id_check_flag=true;
				}
				// 사용중인 아이디
				else if(data == 1) {
					alert('사용중인 아이디입니다.');
					$('#m_id').attr('value', '');
				}
				// 데이터베이스 오류
				else {
					alert('데이터베이스 오류가 발생했습니다.');
				}
			},
			error : function() {	// 통신에 실패했을 때
				alert('중복체크 실패');
			}
		});
	});
});

</script>



</head>


<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${path }/">회사이름</a>
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


	
	<!-- 메인 컨텐츠 -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-4"></div>
			<div class="col-md-6 col-md-offset-4">
				 <div class="jumbotron">
				 	<div class="panel-heading">
				 	<form method="POST" action="./joinAction">
				 		<h3 style ="text-align:center">회원가입</h3>
				 		<!-- 아이디 입력칸 -->
				 		<div class="row">
				 			<div class="form-group col-sm-9 col-md-9 col-lg-9">
				 				<span style="font-family :Fantasy;">아이디 :</span> 
				 				<input type="text" class="form-control" autocomplete="off" name="m_id" >
							</div>
							<div class="col-sm-3 col-md-3 col-lg-3" style="margin-bottom: 15px;">
							<button type="button" class="btn btn-primary btn-block" id="id_check"  style="margin-top: 23px;">중복체크</button>
							</div>
						</div>
						<!-- 비밀번호 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">비밀번호 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" id="m_pw" name="m_pw" >
						</div>
						<!--  비밀번호 확인 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">비밀번호확인 :</span> 
				 			<input type="text" class="form-control" autocomplete="off"  id="m_pw2" name="m_pw2" >
						</div>
						<!-- 비밀번호 체크에 대한 공간 할당 -->
						<div class="form-group">
							<div class="col-sm-12 col-md-12 col-lg-12">
							<h6 id="diff_pw" class="text-danger" style="display: none;">비밀번호가 서로 다릅니다.</h6>
							<h6 id="equal_pw" class="text-success" style="display: none;">확인되었습니다.</h6>
							</div>
						</div>
						<!--  이릅 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">이름입력 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_name" >
						</div>
						<!--  소속 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">소속입력 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_aff" >
						</div>
			
						<!-- 성별 선택 -->
							<div class="form-group" style="text-align: center;">
								<div  style="align:center;" class="btn-group" data-toggle="buttons">
								<!-- label : UI 요소에 라벨을 정의하는 HTML 태그 -->
									<label class="btn btn-primary active" >
										<input type="radio" name="m_gender" autocomplete="off" value="m" checked>남자
									</label>
									<label class="btn btn-primary" >
										<input type="radio" name="m_gender" autocomplete="off" value="w">여자
									</label>
								</div>
							</div>
						<!-- 이메일 입력 -->
						<div class="row">
							<div class="form-group col-sm-8 col-md-8 col-lg-8" >
								<span style="font-family :Fantasy;">이메일입력 :</span> 
								<input  type="email" class="form-control" id="m_email" name="m_email" >
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailAuthModal" style="margin-top: 23px;" >인증메일발송</button>
							</div>
						</div>
						<!-- 전화번호 입력 -->
						<div class="form-group">
							<span style="font-family :Fantasy;">전화번호 :</span> 
							<input type="text" class="form-control" autocomplete="off" name="m_tel" placeholder="-제외 숫자만입력" >
						</div>
						
						<!-- 주소 입력에대한 공간 할당 -->
						
							<!-- 우편번호 입력 -->
							<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy;">우편번호 :</span>
							</div>
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<input type="text" class="form-control" id="m_addr1" name="m_addr1" >
							</div>
						
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#addrModal">주소검색</button>
							
							</div>
							</div>
						
						
						
						<!-- 주소 입력 -->
						<div class="row">
						
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<span style="font-family :Fantasy;">주소입력 :</span> 
								<input type="text" class="form-control" id="m_addr2" name="m_addr2" placeholder="주소" >
							</div>
						</div>
				
						<!-- 상세주소 입력에 대한 공간 할당 -->
						<div class="row">
							<!-- 상세주소 입력 -->
							<div class="form-group col-sm-12 col-md-12 col-lg-12">
								<input type="text" class="form-control" id="m_addr3" name="m_addr3" placeholder="상세주소">
							</div>
						</div>
				
						<!-- 제출 버튼 -->
						<div class="form-group">
							<input type="submit" class="btn btn-primary form-control" value="회원가입">
						</div>
						</form>
				 	</div>
				 </div>
			</div>	 
			<div class="col-md-3 col-md-offset-4"></div>
		
		</div>
	
	</div>
	
	
</body>
</html>
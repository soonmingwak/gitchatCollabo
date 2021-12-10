<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

	
	<!-- 메인 컨텐츠 -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-md-offset-4"></div>
			<div class="col-md-6 col-md-offset-4">
				 <div class="jumbotron">
				 	<div class="panel-heading">
				 		<h3 style ="text-align:center">회원가입</h3>
				 		<!-- 아이디 입력칸 -->
				 		<div class="row">
				 			<div class="form-group col-sm-9 col-md-9 col-lg-9">
				 				<span style="font-family :Fantasy;">아이디 :</span> 
				 				<input type="text" class="form-control" autocomplete="off" name="m_id" >
							</div>
							<div class="col-sm-3 col-md-3 col-lg-3" style="margin-bottom: 15px;">
							<button type="button" class="btn btn-success btn-block" id="id_check"  style="margin-top: 23px;">중복체크</button>
							</div>
						</div>
						<!-- 비밀번호 입력칸 -->
						<div class="form-group">
				 			<span style="font-family :Fantasy;">비밀번호 :</span> 
				 			<input type="text" class="form-control" autocomplete="off" name="m_pw" >
						</div>
				 	</div>
				 </div>
			</div>	 
			<div class="col-md-3 col-md-offset-4"></div>
		
		</div>
	
	</div>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script>


$(document).ready(function() {
	
	//Ȯ�ι�ư �Է½� ����
	$('#searchBtn').click(function() {
		$('#background_modal').show();
	});
	
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. ���â ������ Ŭ�� �� �ݱ�
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});

});
var idV = "";
// ���̵� �� �ް� ����ϴ� ajax
var idSearch_click = function(){
	$.ajax({
		type:"POST",
		url:"${path}/main/userSearch?m_tel="
				+$('#m_name').val()+"&m_tel="+$('#m_tel').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("ȸ�� ������ Ȯ�����ּ���!");	
			} else {
				$('#id_value').text(data);
				// ���̵� ������ ����
				idV = data;
			}
		}
	});
}


//üũ ��ư�� ���� ���̵�/��й�ȣ ����� �޶�����
function check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}







</script>

<title></title>
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>
	
</head>
<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand " href="${path}/findid">���̵�ã��</a>
		<a class="navbar-brand" href="${path}/findpw">��й�ȣã��</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
	
	</nav>
	
<%@ include file="/WEB-INF/views/modal/userIdSearchModal.jsp" %>

	
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-md-offset-4"></div>
			<div class="col-md-8 col-md-offset-4">
				 <div class="jumbotron">
				 	<div class="panel-heading">
				 	<form method="POST" action="./findidAction">
				 		<h2 style ="text-align:center; border-bottom" >���̵� ã��</h2>
				 		<ul style="border-bottom:2px solid #ffffff; "></ul>
				 		<div style="margin-bottom: 10px;"
						class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="find_id" onclick="check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-black"	for="search_1">�޴�����ȣ�� ã��</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="find_id" onclick="check(2)"> 
							<label class="custom-control-label font-weight-bold text-black" for="search_2">�̸����ּҷ� ã��</label>
						</div>
				 	
				 		<div id="searchI">
				 		<h5>ȸ�������� ����� �޴�����ȣ�� ����</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">�̸� :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="email" class="form-control" id="m_name" name="m_name" placeholder="ex)�谭��" >
							</div>
							<div class="form-group col-sm-4 col-md-4 col-lg-4" >
								
							</div>
						</div>
				 		
				 		
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">��ȣ�Է�:</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="email" class="form-control" id="m_tel" name="m_tel" placeholder="ex)01012341234 " >
							</div>
							
				
						</div>
						
						<!-- ���� ��ư -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">Ȯ��</button>
								<a class="btn btn-danger btn-block"	href="${Path}">���</a>
							</div>
						</div>
						</div>
						
						
						
				 		<div id="searchP" style="display: none;">
				 		<h5>ȸ�������� ����� �̸��Ϸ� ����</h5>
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">�̸� :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="email" class="form-control" id="m_name" name="m_name" placeholder="ex)�谭��" >
							</div>
							<div class="form-group col-sm-4 col-md-4 col-lg-4" >
								
							</div>
						</div>
				 		
				 		
				 		<div class="row">
							<div class="form-group col-sm-3 col-md-3 col-lg-3" >
								<span style="font-family :Fantasy; ">�̸����Է� :</span> 
								
							</div>
							<div class="form-group col-sm-5 col-md-5 col-lg-5">
								<input  type="email" class="form-control" id="m_email" name="m_email" placeholder="ex)abc@abc.com" >
							</div>
							
							<div class="col-sm-4 col-md-4 col-lg-4" >
								<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#emailAuthModal" >�����ޱ�</button>
							</div>
						</div>
						
					
						
						<!-- ���� ��ư -->
						<div class="row">
							<div class="col-sm-4 col-md-4 col-lg-4" ></div>
							<div class="form-group col-sm-3 col-md-3 col-lg-3">
								<button id="searchBtn2" type="button" class="btn btn-primary btn-block">Ȯ��</button>
								<a class="btn btn-danger btn-block"	href="${path}">���</a>

							</div>
						</div>
				 		</div>
				 	
				 		
	
				 	</form>
				 	</div>
				 </div>
			</div>
				<div class="col-md-2 col-md-offset-4"></div>
		</div>
	</div>
				
<!-- �̸��� ���� ��� -->
<div id="emailAuthModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">�̸��� ����</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-lg-8">
						<input type="email" class="form-control" id="user_mail_modal" placeholder="�̸���">
					</div>
					<div class="col-lg-4">
						<button type="button" class="btn btn-success btn-block" id="sendAuthBtn">������ȣ ����</button>
					</div>
				</div>
				<div class="row" id="authDiv" style="margin-top: 15px; display: none;">
					<div class="col-lg-4">
						<input type="text" class="form-control" id="auth_num" placeholder="������ȣ">
					</div>
					<div class="col-lg-4">
						<button type="button" class="btn btn-primary btn-block" id="authMailBtn">����</button>
					</div>
					<div class="col-lg-4"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- �̸��� ���� ��� ���� --> 	



</body>
</html>
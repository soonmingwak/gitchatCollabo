<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<title></title>
<meta http-equiv="Conetent-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${path}/resources/js/bootstrap.js"></script>

</head>

<body>



<h2><c:out value="${error}" /></h2>
	<h2><c:out value="${logout }"/></h2>
	
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align:center;">로그인</h3>
                    </div>
                    <div class="panel-body">	
						<form role="form" method="post" action="/loginAction">
							<fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="아이디를 입력해주세요" name="m_id" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="비밀번호를 입력해주세요" name="m_pw" type="password" value="">
                                    <a href = "findpw" >비밀번호를 잊어버리셨나요?</a>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" type="checkbox">아이디 기억하기
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="index.html" class="btn btn-lg btn-success btn-block">로그인</a>
                                <p style="text-align:center; margin-top:15px; ">계정이 필요하신가요?<a style=" color:Violet"; href = "joinAction" >가입하기</a></p>
                            </fieldset>
                            
                            <!-- csrf라는 이름으로 처리되는 csrf토큰 -->		
							<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
    <!-- jQuery -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/dist/js/sb-admin-2.js"></script>

<script>
$(".btn-success").on("click", function(e){
	e.preventDefault();
	$("form").submit();
})
</script>

</body>

	
</html>
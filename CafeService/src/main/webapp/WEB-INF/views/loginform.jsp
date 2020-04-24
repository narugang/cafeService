<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/loginform.css'/>">
<title>로그인 화면</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<!-- loginForm img들어가는 곳 [S]-->
				<div class="<!-- login100-pic  -->js-tilt" data-tilt>
					<img src="<c:url value='/resources/img/loginPageLogo.jpg'/>" alt="IMG"> 
				</div> <!-- loginForm img들어가는 곳 [E]-->
				
				<!-- id,pw 위 title 메시지 들어가는 곳 [S]-->
				<%-- <form class="login100-form validate-form"> --%>
				<form:form commandName="loginCommand" class="login100-form validate-form" id="dd" method="POST" onsubmit="return click()">
					<span class="login100-form-title"><!-- title 메시지 -->
					Login
					</span><!-- id,pw 위 title 메시지 들어가는 곳 [E]-->
					
					<!-- id들어가야 할 곳 [S]-->
					<div class="wrap-input100 validate-input" data-validate = "required">
						<input class="input100" type="text" id="id" class="id" name="id" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div><!-- id들어가야 할 곳 [E]-->

					<!-- pw들어가야 할 곳 [S]-->
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" id="pwd" name="pwd" class="pwd" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div><!-- pw들어가야 할 곳 [E]-->
					
					<!-- login_btn들어가야 할 곳 [S]-->
					<div class="container-login100-form-btn">
						<button type="submit" id="login" value="login" class="login100-form-btn">
							Login
						</button>
					</div><!-- login_btn들어가야 할 곳 [E]-->

					<!-- 아이디 비밀번호 찾기 [S]-->
					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="<c:url value='/findInfo'/>">
							아이디 / 패스워드 찾기
						</a>
					</div><!-- 아이디 비밀번호 찾기 [E]-->
					
					<!-- 회원가입 [S] -->
					<div class="text-center p-t-12"> <!-- 136 -->
						<a class="txt2" href="<c:url value='/regform'/>">
							회원가입<!-- Create your Account -->
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
							<!-- fa fa라는 거 보니까 forgotInfo랑 회원가입 사이에 공백을 넣는 class인 듯  -->
						</a>
					</div>
					<!-- 회원가입 [E] -->
					
					<!-- page 하단 공백을 위한 코드[S]-->
					<div class="text-center p-t-100"><!-- 136 --></div>
					<!-- page 하단 공백을 위한 코드[E]-->
				</form:form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#login").click(function() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/logincheck'/>",
			data : {
				"id" : $("#id").val(),
				"pwd" : $("#pwd").val()
			},
			success : function(data) {
				if (data == "false") {
					alert("아이디, 비밀번호를 확인해주세요.")
				} else {
					$("#dd").submit();
				}
			}
		});
	});
</script>
</html>

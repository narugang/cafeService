<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/findInfo.css'/>">
<title>아이디 비밀번호 찾기</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
		<div class="wrap-top">
				<!-- mainlogo 이미지[S] -->
				<div id="logo">
					<a href="<c:url value='/loginform'/>"> 
						<input type="button" id="mainLogo" name="mainLogo" value="">
					</a>
				</div><!-- mainlogo 이미지[E] -->
			<div class="wrap-bottom">
				<form>
					<span class="login100-form-title">
						find ID
					</span>
					<!-- 이름 입력 -->
					<div class="wrap-input100 validate-input" data-validate = "required">
							<input class="input100" type="text" id="name" name="name" placeholder="이름">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</span>
					</div>
					<!-- 이메일 입력 -->
					<div class="wrap-input100 validate-input" data-validate = "required">
							<input class="input100" type="text" id="email" name="email" placeholder="Email">
							<span class="focus-input100"></span>
							<span class="symbol-input100">
								<i class="fa fa-lock" aria-hidden="true"></i>
							</span>
							
						<div class="text-center p-t-12">
							<a class="txt2" id="findId" href="javascript:void(0)">
								아이디 찾기
							</a>
						</div>
					</div>
					<div id="findIdView_find" class="findIdView_find">
						회원님의 아이디는 = [ <span id="catch_ID"></span> ] 입니다.
					</div>
				</form>
				<form>
					<span class="login100-form-title">
					find Password
					</span>
					
					<!-- id들어가야 할 곳 [S]-->
					<div class="wrap-input100 validate-input" data-validate = "required">
						<input class="input100" type="text" id="id" class="id" name="id" placeholder="ID">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div><!-- id들어가야 할 곳 [E]-->

					<!-- pw들어가야 할 곳 [S]-->
					<div class="wrap-input100 validate-input" data-validate = "required">
						<input class="input100" type="text" id="pwdEmail" name="email" class="email" placeholder="email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div><!-- pw들어가야 할 곳 [E]-->
					<div class="text-center p-t-12" style="padding-top: 0px;">
						<a class="txt2" id="findPwd" href="javascript:void(0)">
							패스워드 찾기
						</a>
					</div>
					<div id="success_find" class="text-center p-t-6">
						전송을 완료하였습니다.
					</div>
					<div id="success_error" class="text-center  p-t-6">
						ID, Email을 확인해주세요
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".findIdView_error").hide();
	$(".findIdView_find").hide();

	$("#success_error").hide();
	$("#success_find").hide();
	
	/* $(".findId").click(function() { */
	$("#findId").on("click", function(event) { //a 태그 동작을 막도록 적용
		event.preventDefault();// 클릭 된 a 태그의 본래 기능을 막는다.
	
		/* var id = $.trim($("#id").val())
		var email = $.trim($("email").val()) */
		
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
		}
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요")
			$("#email").focus();
		}

		$.ajax({
			type : "GET",
			url : "<c:url value='/findId'/>",
			data : {
				"name" : $("#name").val(),
				"email" : $("#email").val()
			},
			success : function(data) {
				if (data == "") {
					$(".findIdView_error").show();
					$(".findIdView_find").hide();
					alert("아이디, 비밀번호를 확인해주세요.")
				} else {
					$(".findIdView_error").hide();
					$(".findIdView_find").show();
					$("#catch_ID").text(data);
				}
			}
		});
	});
	
	$("#findPwd").on("click", function(event) { //a 태그 동작을 막도록 적용
		event.preventDefault();// 클릭 된 a 태그의 본래 기능을 막는다.
	
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요");
			$("#id").focus();
		}
		if ($("#pwdEmail").val() == "") {
			alert("이메일을 입력해주세요")
			$("#pwdEmail").focus();
		}

		$.ajax({
			type : "POST",
			url : "<c:url value='/findPwd'/>",
			data : {
				"id" : $("#id").val(),
				"email" : $("#pwdEmail").val()
			},
			beforeSend:function(){
				alert("이메일로 임시 비밀번호를 전송합니다.")
			},
			success : function(data) {
				if (data=="1") {
					$("#success_find").show();
					alert("이메일 전송을 완료하였습니다.")
					$("#success_error").hide();
				} else if(data=="0") {
					$("#success_error").show();
					$("#success_find").hide();
					$("#id").focus();
				} else if(data=="2"){
					$("#success_error").show();
					$("#success_find").hide();
					$("#id").focus();
				}
			}
		});
	});
</script>
</html>
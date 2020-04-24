<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--부트스트랩-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!--부트스트랩js-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.container {
	background: #fff;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	border-radius:25px;
	margin-top : 30px;
	margin-bottom : 30px;
}	
input#mainLogo {
	background: url(/cafeService/resources/img/bandmainLogo_regform.jpg);
	background-repeat: no-repeat;
	width: 500px;
	height: 120px;
	border: 1.5px solid #007bff;
	border-radius:15px;
}
@media ( min-width : 1200px) {
	.container {
		width: 970px;
	}
}
@media ( min-width : 1200px) {
	.container1 {
		width: 500px;
	}
}
li {list-style: none; float: left; padding: 6px;}
body {background: #eeeeee; background-size: contain;}	
div#col-md-offset-3{text-align: center;	margin:0;}
ul#pagination{display: table;text-align: center;margin:0 auto;}

#header_logo_section{
	justify-content: center;
}
#id_Nic_Name_Area{
	display: flex;
	flex-wrap: wrap;
	padding: 20px;
	border-bottom: 0.5px solid #eeeeee;
}
#page_header_title{
	text-align: center;
	padding: 20px;
	padding-top: 30px;
	border-bottom: 0.5px solid #eeeeee;
}
#id_Area, #nic_Area, #name_Area{
	padding : 20px;
}
#pwd_Area, #email_Adres_Area{
	padding: 40px;
	border-bottom: 0.5px solid #eeeeee;
}
#pwd_Check_Area{
	padding-top: 10px;
}
#label_name{
	width: 48px;
}
#label_Pwd{
	width: 100px;
}
#adres_Area{
	padding-top: 20px;
}
#img_Intro_Inter_Area{
	padding : 40px;
	border-bottom: 0.5px solid #eeeeee;
}
#inter_Area{
	padding: 40px;
	padding-top: 10px;
}
#inter_title{
	padding-top: 40px;
}
#submit_btn{
	text-align: center;
}
</style>
<title>회원 정보 기입</title>
</head>
<body>
	<!-- 헤더[S] -->
		<nav id="header_logo_section" class="navbar navbar-light bg-white">
	    	<a href="./bandmain"class="navbar-brand" class="navbar-brand">
	        	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px; cursor:pointer;">
	 		</a>
		</nav>
	<!-- 헤더[E] -->
	<div class="container">
		<div id="page_header_title">
			<h3>회원 가입</h3>
		</div>
		<form:form commandName="memberVO" method="POST"
			enctype="multipart/form-data" onsubmit="return check()">
			<div id="id_Nic_Name_Area">
				<!-- 아이디 중복 확인[S]  -->
				<div id="id_Area">
					<form:label path="id">아이디</form:label>
						<input class="id" id="id" name="id" required />
						<button type="button" class="btn btn-primary" id="idCheck">아이디 중복확인</button>
					<div id="message" class="idMessage">아이디를 확인하세요</div>
				</div>
				<!-- 아이디 중복 확인[E] -->
				
				<!-- 닉네임 중복 확인[S] -->
					<div id="nic_Area">
						<form:label path="nic">닉네임</form:label>
						<input id="nic" class="nic" name="nic" required />
						<button type="button" class="btn btn-primary" id="nicCheck">닉네임 중복확인</button>
						<div id="message" class="nicMessage">닉네임을 확인하세요</div>
					</div>
				<!-- 닉네임 중복 확인[E] -->
				<div id="name_Area">
					<form:label path="name" id="label_name">이름</form:label>
					<input id="name" class="name" name="name" required />
				</div>
			</div>
			
			<div id="pwd_Area">
				<div>
					<form:label path="pwd" id="label_Pwd">비밀번호</form:label>
					<input type="password" id="pwd" name="pwd" class="pwdCheck" required />
				</div>
				
				<div id="pwd_Check_Area">
					<form:label path="confirmPwd">비밀번호 확인</form:label>
					<input type="password" id="confirmPwd" name="confirmPwd"
						class="confirmPwdCheck" required />
				</div>
					
				<div>
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지	않습니다.</div>
				</div>
			</div>
			
			<div id="email_Adres_Area">
				<!-- 변경 이메일 인증[S] -->
				<div class="form-group">
					<form:label path="email">EMAIL<br>
						<input type="text" id="email" class="email" name="email" placeholder="이메일을 입력하세요" />
					</form:label>
					<button type="button" class="btn btn-primary" id="emailBtn">이메일
						발송</button>
					<div id="email_message" class="email_message">사용할 수 없는 이메일 입니다.</div>
					<div id="email_message1" class="email_message1">사용 가능한 이메일 입니다.</div>
					<br> <input type="text" class="emailAuth" id="emailAuth"
						placeholder="인증문자를 입력하세요">
					<button type="button" class="btn btn-primary" id="emailAuthBtn">이메일 인증</button>
				</div>
				<!-- 변경 이메일 인증[E] -->
					
				<!-- 우편번호[S] -->
				<div id="adres_Area">
					<form:label path="postcode">우편번호
					<input type="text" name="postcode" id="postcode" placeholder="우편번호"
						required>
					</form:label>
					<input type="button" onclick="bandPostcode()" class="btn btn-primary" value="우편번호 찾기">
					<br>
					<form:label path="adres">주소
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="adres" id="adres" placeholder="주소">
					</form:label>
					<br>
					<form:label path="detailadres">상세주소
						<input type="text" id="detailadres" name="detailadres"
							placeholder="상세주소">
					</form:label>
					<form:label path="extraadres">참고항목
						<input type="text" id="extraadres" name="extraadres"
							placeholder="참고항목">
					</form:label>				
				</div>
				<!-- 우편번호[E] -->
			</div>
			<div id="img_Intro_Inter_Area">
				<!-- 이미지 file업로드[S] -->
				<div id="img_Intro_Area">
					<div id="img_Select_Area">
						<form:label path="fileImg"><h4>이미지 선택</h4>
							<input type="file" id="fileImg" name="file">
							<div class="selectImg">
								<img src="">
							</div>
						</form:label>
					</div>
				<!-- 이미지 file업로드[E] -->			
					<div>
						<form:label path="intro">
							<h4 style="width:500px;">자기소개</h4>
						</form:label>
						<textarea name="intro" id="intro" class="intro" placeholder="자기소개 입력"
							rows="10" cols="60" style="resize: none; , text-align: left"></textarea>			
					</div>
				</div>
			<div id="inter_title">
				<h4>관심사</h4>
			</div>
			<div id="inter_Area">
				<form:label path="inter">
					<c:forEach var="cateMake" items="${cateMakes}" varStatus="status">
							${cateMake.intername }
							<input type="checkbox" value="${cateMake.intercd}" id="inter"
							name="inter" class="inter">
							&nbsp;
							<c:if test="${status.index / 9 == 1 }">
								<br>		
							</c:if>
					</c:forEach>
				</form:label>
			</div>
				<div id="submit_btn">
					<input type="submit" id="submit" value="회원가입" class="btn btn-primary">
				</div>
			</div>
		</form:form>
	</div>
	<script>
		var id_Check = false;
		var nic_Check = false;
		var emailAuthBtn = false;
		
		$(".idMessage").hide();
		$(".nicMessage").hide();
		$(".email_message").hide();
		$(".email_message1").hide();
		function check(){
			if(id_Check==false){
				alert("중복된 아이디는 사용하실 수 없습니다.")
				$(".id").focus();
				return false;
			} 
			if(nic_Check==false){
				alert("중복된 닉네임은 사용하실 수 없습니다.")
				$(".nic").focus();
				return false;
			}
			//checkbox checked 처리[S]
			if($('input:checkbox[name="inter"]:checked').length < 2 || $('input:checkbox[name="inter"]:checked').length > 6){
				alert("관심사는 2가지 이상, 5가지 이하로 선택해주세요")
				$(".inter").focus();
				return false;
			}
			//checkbox checked 처리[E]
			if(emailAuthBtn==false){
				alert("이메일 인증을 완료해주세요")
				$("#email").focus();
				return false;
			} else {
				alert("회원가입 성공, 로그인 페이지로 이동합니다.")
			}
		}
		
		//이미지 파일 업로드
		$("#fileImg").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".selectImg img").attr("src", data.target.result)
									.width(400);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		
		//아이디 정규화	
		$("#idCheck").click(
				function() {
					//아이디 정규화[S]
					$(".idMessage").show();
					var query = $.trim($("#id").val())
					var queryLength = 0;
					var engCheck = /[a-z]/;
					var numCheck = /[0-9]/;
					var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

					//한글, 영문 길이 2, 1로 바꾸기[S]
					for (var i = 0; i < query.length; i++) {
						chkquery = query.charAt(i);

						if (escape(chkquery).length > 4) {
							queryLength += 2;
						} else {
							queryLength += 1;
						}
					}
					//한글, 영문 길이 2, 1로 바꾸기[E]
					if (queryLength<4 || queryLength>16) {
						$(".idMessage").text("사용 불가");
						$(".idMessage").attr("style", "color:#f00");
					} else if (specialCheck.test(query)) {
						$(".idMessage").text("사용 불가");
						$(".idMessage").attr("style", "color:#f00");
					} else {
						var query1 = {
							id : query
						}
						$.ajax({
							url : "<c:url value='/idCheck'/>",
							type : "POST",
							data : query1,
							success : function(data) {
								if (data == 1) {
									$(".idMessage").text("사용 불가");
									$(".idMessage").attr("style",
											"color:#f00");
									return id_Check=false;
								} else {
									$(".idMessage").text("사용 가능");
									$(".idMessage").attr("style",
											"color:#00f");
									return id_Check=true;
								}
							}
						}); // ajax
					}
				});
		//아이디 정규화[E]

		//닉네임 중복체크 코드[S]
		$("#nicCheck").click(
				function() {
					$(".nicMessage").show();
					var query = $.trim($("#nic").val())
					var queryLength = 0;
					var engCheck = /[a-z]/;
					var numCheck = /[0-9]/;
					var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

					//한글, 영문 길이 2, 1로 바꾸기[S]
					for (var i = 0; i < query.length; i++) {
						chkquery = query.charAt(i);

						if (escape(chkquery).length > 4) {
							queryLength += 2;
						} else {
							queryLength += 1;
						}
					}
					//한글, 영문 길이 2, 1로 바꾸기[E]
					if (queryLength<4 || queryLength>16) {
						/* alert("닉네임은 한글 2~8자, 영문 및 숫자 4~16 글자 이내로 작성해야 합니다.") */
						$(".nicMessage").text("사용 불가");
						$(".nicMessage").attr("style", "color:#f00");
					} else if (specialCheck.test(query)) {
						/* alert("닉네임은 특수문자를 포함 할 수 없습니다.") */
						$(".nicMessage").text("사용 불가");
						$(".nicMessage").attr("style", "color:#f00");
					} else {
						var query1 = {
							nic : query
						}
						$.ajax({
							url : "<c:url value='/nicCheck'/>",
							type : "POST",
							data : query1,
							success : function(data) {
								if (data == 1) {
									$(".nicMessage").text("사용 불가");
									$(".nicMessage").attr("style",
											"color:#f00");
									return nic_Check = false;
								} else {
									$(".nicMessage").text("사용 가능");
									$(".nicMessage").attr("style",
											"color:#00f");
									return nic_Check = true;
								}
							}
						}); // ajax
					}
				});
		//닉네임 중복체크 코드[E]

		//비밀번호 유효성 검사[S]
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$(".confirmPwdCheck")
					.keyup(
							function() {
								var pwd = $("#pwd").val();
								var confirmPwd = $("#confirmPwd").val();
								var chkNum = pwd.search(/[0-9]/g);
								var chkEng = pwd.search(/[a-z]/ig);

								if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
										.test(pwd)) {
									alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
									$('#pwd').val('').focus();
									return false;
								} else if (chkNum < 0 || chkEng < 0) {
									alert("숫자와 영문자를 혼용하여야 합니다.");
									$('#pwd').val('').focus();
									return false;
								} else if (pwd != "" || confirmPwd != "") {
									if (pwd == confirmPwd) {
										$("#alert-success").show();
										$(".alert-success").attr("style",
												"color:#00f");
										$("#alert-danger").hide();
										/* $("#submit").removeAttr("disabled"); */
									} else {
										$("#alert-success").hide();
										$("#alert-danger").show();
										$(".alert-danger").attr("style",
												"color:#f00");
										/* $("#submit").attr("disabled", "disabled"); */
									}
								}
							});
		});
		//비밀번호 유효성 검사[E]

		$(function() {
			/*
			이메일 인증 버튼 클릭시 발생하는 이벤트
			*/
			$(document).on("click", "#emailBtn", function() {
			/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!emailRule.test($("#email").val())) {             
	           	alert("형식에 맞지 않는 이메일 입니다.")
	           	$("#email").focus();
	            return false;
			}
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/emailCheck'/>",
				data : "email=" + $("#email").val(),
				success : function(data){
				if(data == 0){
					$.ajax({
						beforeSend : function() {
							alert("인증 메일을 발송하였습니다.", "#email")
							$(".email_message1").show(); //사용 가능한 이메일 입니다.
							$(".email_message").hide();
						},
							type : "get",
							url : "<c:url value='/email/createEmailCheck'/>",
							data : "email=" + $("#email").val()
							})
						}
						if(data != 0){
							$("#email").focus();
							$(".email_message").show(); //사용하실 수 없는 이메일 입니다.
							$(".email_message1").hide();
						}
					}
				})
			})
		});
			/*
			이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
			 */
			$(document).on("click", "#emailAuthBtn", function() {
				$.ajax({
					type : "POST",
					url : "<c:url value='/email/emailAuth'/>",
					data : "authCode=" + $('#emailAuth').val(),
					success : function(data) {
						if (data == "complete") {
							alert("인증이 완료되었습니다.");
							emailAuthBtn = true;
						} else if (data == "false") {
							alert("인증번호를 잘못 입력하셨습니다.")
						}
					}
				});
			});
		//이메일 인증[E] */

		//우편 번호[S]
		function bandPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = '(' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraadres").value = extraAddr;

							} else {
								document.getElementById("extraadres").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("adres").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailadres").focus();
						}
					}).open();
		}
		//우편 번호[S]
	</script>
</body>
</html>
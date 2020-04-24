<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="<c:url value='resources/css/myPage.css'/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
li {list-style: none; float: left; padding: 6px;}
body {background: #eeeeee; background-size: contain;}	
div#col-md-offset-3{text-align: center;	margin:0;}
ul#pagination{display: table;text-align: center;margin:0 auto;}

div#change_thumb_area{
	display: inline-block;
	text-align: center;
}
div.view_My_Thumb{
	display: inline-block;
}
#imageChangeForm{
	display: inline-block;
	width: 440px;
}
div#img_Area{
	display: flex;
	justify-content: center;
	border-bottom: 0.5px solid #eeeeee;
	padding: 40px;
}
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
div.change_img_area{
    display: inline-block;
}
div#id_Nic_Pwd_Email_Area{
	display: flex;
	flex-wrap : wrap; 
	padding: 20px;
	border-bottom: 0.5px solid #eeeeee;
    place-content: center;
}
div#change_Pwd_Area{
	
}
div#address_Area{
	display: flex;
	flex-wrap: wrap;
	padding: 40px;
	border-bottom: 0.5px solid #eeeeee;
	place-content: center;
}
div#myInter_Area{
	display: flex;
	padding: 20px;
	border-bottom: 0.5px solid #eeeeee;
}

.view_MyId, .current_NicName, #change_Pwd_Area, .view_email{
	width: 420px;
	padding: 23px;
}
.current_adres {
    width: 300px;
}
#myInter {
	text-align: center;
	width: 420px;
}
#change_Inter_Area{
	display: flex;
}
div#view_my_inter{
	text-align: center;
	padding: 40px;
}
input#change_Image{
	width:85px;
}
</style>
<title>myPage</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".change_pwd").click(function() {
			$(".changePwd").slideToggle();
		})

		$(".open_Category").click(function() {
			$(".open_list").slideToggle();
		})
	});

	/* $(document).ready(function() {
		$(".open_Category").click(function() {
			$(".open_list").slideToggle();
		})
	}) */
	
	$(document).ready(function() {
		$(".myCategory_Switch").click(function() {
			$.ajax({
				type : "POST",
				url : "<c:url value='/viewInter'/>",
				dataType:'json',
				success : function(data) {
					if (data == "") {
						$(".view_MyInter").text("등록 된 관심사가 없습니다.")
					} else {
						$(".view_MyInter").text(data)
					}
				}
			})
		}).click();
	})
	
	$(document).ready(function() {
			$.ajax({
				type : "POST",
				url : "<c:url value='/selectIntro'/>",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				dataType:'text',
				success : function(data) {
					if (data == "") {
						$(".change_Intro").text("등록 된 자기소개가 없습니다.")
					} else {
						$(".change_Intro").text(data)
					}
				}
			})
		})
	
	//등록 된 주소를 가져와서 jsp에 뿌려준다.
	$(document).ready(function() {
			$.ajax({
				type : "POST",
				url : "<c:url value='/selectAddres'/>",
				dataType:'json',
				success : function(data) {
					if (data != "") {
						$(".postcode_view").text(data.POSTCODE),
						$(".adres_view").text(data.ADRES),
						$(".detailadres_view").text(data.DETAILADRES),
						$(".extraadres_view").text(data.EXTRAADRES)
					} else {
						alert("텅 빔")
					}
				}
			})
			$.ajax({
				type : "POST",
				url : "<c:url value='/selectEmail'/>",
				success : function(data) {
					if (data != "") {
						$(".current_Email").text(data)
					} else {
						$(".current_Email").text("등록 된 이메일이 없습니다.");
					}
				}
			})
			$.ajax({
				type : "POST",
				url : "<c:url value='/selectThumbImg'/>",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					if (data != "") {
						data = data.substring(1,data.length);
						$(".current_Thumb").attr("src","<c:url value='/'/>"+data).width(350);
						$(".current_Thumb").attr("src","<c:url value='/'/>"+data).height(200);/* "<c:url value='/"+data+"'/>" */
					} else {
						alert("이게.... 아닌데....")
					}
				}
			})
		})	
</script>
</head>
<body>
<!-- 헤더[S] -->
	<nav class="navbar navbar-light bg-white">
    	<a href="./bandmain"class="navbar-brand" class="navbar-brand">
        	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px;">
 		</a>
        <div class = "headerbar1" style=" vertical-align: middle; height: 80px; align: left; margin-right: 1250px;">
			<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" 
				value="${scri.keyword}" class="form-control" width="50px" id="keywordInput" placeholder="카페 및 게시글 검색"
				 style="width: 200px;  margin-top: 17px; vertical-align: middle; float: left;"/>
         <button class="btn btn-outline-primary" type="button" id="button-addon2" value="" style=" margin-top: 17px; vertical-align: middle;">
 	        <i class="fa fa-search"></i>
         </button>
		</div>
	<form>
	<!-- 아이콘 -->
	<div class="dropmenu" align="right" style="width: 240px; display: inline-block; ">
		<div class="dd">
			<input type="button" id="alarm" name="alarm" value="" >
				<div class="dd-content" >
					<a href="#">새 알림</a> 
					<a href="#">읽은 알림</a>
				</div>
		</div>
		<div class="dd">
				<input type="button" id="msg" name="msg" value="">
			<div class="dd-content">
				<a href="#" onclick="window.open('<c:url value='/message'/>',
						'sendMessage', 'top=100px, left=100px, height=700px, width=700px, status=no, toolbar=no')">메세지 보내기</a>
				<a href="#" id="moveMessageBox" onclick="window.open('<c:url value='/messageBox'/>',
						'sendMessage','top=100px, left=100px, height=600px, width=550px,toolbar=no, menubar=no,status=no,location=no, resizable=no')">메세지 보관함</a>
			</div>
		</div>
		<div class="dd">
			<input type="image" src="" id="user" name="user" value="">
				<div class="dd-content">
					<a href="<c:url value='/myPage'/>">내 정보</a> 
					<a href="<c:url value='/myblist'/>">내 카페</a> 
					<a href="#">설정</a> 
					<a href="<c:url value='/logout'/>">로그아웃</a>
				</div>
		</div>
		<c:choose>
			<c:when test="${authInfo.auth.equals('S1') }">
				<div class="dd">
					<input type="button" id="adminPage" name="adminPage">
						<div class="dd-content">
							<a href="<c:url value='/adminForm'/>">관리자 페이지</a>
						</div>
				</div>
			</c:when>
		</c:choose>
		</div>
 </form>
</nav>
<!-- 헤더[E] -->
<div class="container">
	<div id="img_Area"> <!-- img_Area[S] -->
		<div class="view_My_Thumb">
			<h4>현재 프로필 사진</h4>
			<div style="display: inline-block;"><img class="current_Thumb" src=""></div>
				<div class="change_Thumb" style="display: inline-block;"></div>
		</div>
		<div id="change_thumb_area">
			<form id="imageChangeForm" method="post" action="/changeImg" enctype="multipart/form-data">
				프로필 변경		
				<input type="file" multiple="multiple" id="change_Image" class="change_Image" name="file">
					<button type="button" class="change_Image_btn">변경</button>
					<div class="change_img_area">
						<img class="select_change_Img" src="">
					</div>
			</form>
		</div>
	</div> <!-- img_Area[E] -->
	<form>
		<div id="id_Nic_Pwd_Email_Area"> <!-- id_Nic_Pwd_Email_Area[S] --> 
			<div class="view_MyId">
				<div class="id">
					<h4>아이디 : ${sessionScope.authInfo.id }</h4>
				</div>
			</div>
		<div class="current_NicName">
				<div class="nic"><h4>닉네임 : ${sessionScope.authInfo.nic }</h4></div>
				<span><input type="text" placeholder="닉네임 변경" class="change_nic"></span>
			<button type="button" class="change_nic_btn">변경</button>
		</div>
		<div id="change_Pwd_Area">
			<h4>비밀번호</h4>
			<button type="button" id="change_pwd" class="change_pwd">변경하기</button>
			<div id="changePwd" class="changePwd" style="display:none;">
				<input type="password" id="pwd" class="pwd" placeholder="새 비밀번호를 입력">
				<div>
					<div>
						<div id="alert-success" style="color:#00f" >사용 가능한 비밀번호입니다.</div>
						<div id="alert-danger" style="color:#f00">비밀번호는 숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.</div>
					</div>
					<input type="reset" value="취소"> <input type="button"
						id="pwd_change" value="확인">
				</div>
			</div>		
		</div>
			<div class="view_email">
				<h4>현재 이메일:<br> <span class="current_Email"></span></h4>
			<div>
				<!-- email [S] -->
				<input type="text" class="change_Email" placeholder="이메일 변경" style="width:100px;"> @ 
				<input type="text" class="change_Email_Address" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com"> 
					<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
						<option value="naver.com" selected>naver.com</option> 
						<option value="hanmail.net">hanmail.net</option> 
						<option value="nate.com">nate.com</option> 
						<option value="gmail.com">gmail.com</option>
						<option value="1">직접입력</option> 
					</select>
				<!-- email [E] -->
					<button type="button" class="change_Email_btn">변경</button>
				</div>
			</div>
		</div><!-- id_Nic_Pwd_Email_Area[E] -->
			<div id="address_Area"><!-- address_Area[S] -->
				<div class="current_adres" name="current_adres"> 
					<h4>현재 주소</h4>
				<div class="code"><b>우편번호</b>
					<span class="postcode_view"></span>
				</div>
				
				<div class="addres"><b>주소</b>
					<span class="adres_view"></span>
				</div>
				
				<div class="detailAdrs"><b>상세주소</b>
					<span class="detailadres_view"></span>
				</div>
				<div class="exAdres"><b>참고항목</b>
					<span class="extraadres_view"></span>
				</div>
			</div>
			<br>
			<div class="update_adres" name="update_adres"> 
				<h4>주소 수정</h4>
			
				<div class="post_slide">
				<!-- 우편번호 update[S] -->
				<span class="area_Postcode">우편번호
					<input type="text" name="postcode" class="postcode" id="postcode" placeholder="우편번호" required>
				</span>
				<input type="button" onclick="bandPostcode()" value="우편번호 찾기">
				<br>
				<span class="area_Adres">주소
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="adres" name="adres" id="adres" placeholder="주소">
				</span>
				<br>
				<span class="area_Detailadres">상세주소
					<input type="text" class="detailadres" id="detailadres" name="detailadres"
						placeholder="상세주소">
				</span>
				<span class="area_Extraadres">참고항목
					<input type="text" class="extraadres" id="extraadres" name="extraadres"
						placeholder="참고항목">
				</span>
				<br>
				<button type="button" class="change_Address">주소 변경</button>
				<!-- 우편번호 update[E] -->		
				</div>
			</div>
		</div><!-- address_Area[E] -->
	</form>
	<br>
	<form>
		<div id="myInter_Area">
			<div id="myInter" class="myInter">
				<h3>내 관심사</h3>
				<div class="view_MyInter"></div>
				<div class="hidden_area" style=display:none>
					<button type="button" class="myCategory_Switch"></button>
				</div>
			</div>
			<br> 
				<div id="change_Inter_Area">
					<h4>내 관심사 수정하기</h4>
					<button type="button" id="open_Category" class="open_Category" style="height: 30px;">
						항목 보기</button>
				<div id="open_list" class="open_list" style="display:none;">
					<c:forEach var="cateChange" items="${cateMakes }" varStatus="status">
					${cateChange.intername }&nbsp;
					<input type="checkbox" value="${cateChange.intername }" name="inter"
							class="inter">
							<c:if test="${status.index/2 == 1 }">
								<br>
							</c:if>
					</c:forEach>
					<br>
					<button type="button" id="category_Change">변경</button>
				</div>				
			</div>	
		</div>
	</form>
	<form>
		<div id="view_my_inter">
			<h3>자기소개</h3>
				<textarea rows="10" cols="60" placeholder="자기소개 수정" 
				style="resize: none; , text-align: left" id="change_Intro" class="change_Intro"></textarea>
			<br>
			<button type="button" id="change_Intro_btn" class="change_Intro_btn">수정하기</button>		
		</div>
	</form>
</body>
<script type="text/javascript">
$("#alert-success").hide();
$("#alert-danger").hide();

$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "<c:url value='/selectThumbImg'/>",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			if (data != "") {
				data = data.substring(1,data.length);
				var userImg = $("#user").attr("src","<c:url value='/'/>"+data);
				/* $("#user").attr("src","<c:url value='/'/>"+data).width(40);
				$("#user").attr("src","<c:url value='/'/>"+data).height(40); */
				userImg.width(40);
				userImg.height(40);
			} else {
				alert("이게.... 아닌데....")
			}
		}
	})
})
//이메일 입력방식 선택 
$('#selectEmail').change(function(){ 
	$("#selectEmail option:selected").each(function () { 
		
		if($(this).val()== '1'){ //직접입력일 경우 
			$("#str_email02").val(''); //값 초기화 
			$("#str_email02").attr("disabled",false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력 
				$("#str_email02").attr("disabled",true); //비활성화 
			} 
		}); 
	});

$(function(){
	//email 변경
	$(".change_Email_btn").click(function(){
		var email = $(".change_Email").val();
		if(email == ""){
			alert("변경 사항이 없습니다.")
			return false;
		} else {
			email +='@'+$(".change_Email_Address").val(); 
			alert(email)
			var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var emailAddrRule = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!emailRule.test(email)) {             
	           	alert("형식에 맞지 않는 이메일 입니다.")
	           	$(".change_Email").focus();
	            return false;
			}
			if(!emailAddrRule.test($("#str_email02").val())){
				alert("이메일 주소가 형식에 맞지 않습니다.")
				$("#str_email02").focus();
				return false;
			}
			$.ajax({
				type : "POST",
				url : "<c:url value='/changeEmail'/>",
				data : {
					"email" : email
				},
				success : function(data){
					if(data == "1"){
						alert("이메일이 변경되었습니다.")
					} else if(data == "0"){
						alert("이메일 변경에 실패하였습니다.")
					} 
					
				}
			})
		}
	})
	
	$(".change_nic_btn").click(function(){
		var nic = $(".change_nic").val();
		
		if(nic == ""){
			alert("변경값이 없습니다.")
			$(".change_nic").focus();
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "<c:url value='/changeNic'/>",
				/* dataType : 'text', */
				data : {
					"nic" : nic
				},
				success : function(data){
					if(data == "1"){
						alert("닉네임이 변경되었습니다.")
					} else if(data == "0"){
						alert("닉네임 변경에 실패하였습니다.")
					} 
				}
			})
		}
	})
	
	//이미지 파일 업로드 미리보기
	$(".change_Image").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".change_img_area img").attr("src", data.target.result)
								.width(350);
						$(".change_img_area img").attr("src", data.target.result)
						.height(200);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	
	//이미지 업데이트 script
	$(".change_Image_btn").click(function(){
		if($(".change_Image").val() == null){
			alert("변경 될 이미지가 없습니다.")
			$(".change_Image").focus();
			return false;
			
		} else {
			data = $('#imageChangeForm')[0];
			var formData = new FormData(data);
			
			$.ajax({
				type : "POST",
				url : "<c:url value='/changeImg'/>",
				enctype: 'multipart/form-data',
				contentType : false,
				processData : false,
				data : formData,
				success : function(data){
					if(data == "1"){
						alert("이미지이 변경되었습니다.")
					
						$.ajax({
							type : "POST",
							url : "<c:url value='/selectThumbImg'/>",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								if (data != "") {
									data = data.substring(1,data.length);
									$(".current_Thumb").attr("src","<c:url value='/'/>"+data);
								} else {
									alert("이게.... 아닌데....")
								}
							}
						})
						
					} else if(data == "0"){
						alert("이미지 변경에 실패하였습니다.")
					} 
				}
			})
		}
	})
	
	
})

$(function(){
	$(".change_Address").click(function(){
			var postcode = $(".postcode").val();
			var adres = $(".adres").val();
			var extraadres = $.trim($(".extraadres").val());
			var detailadres = $(".detailadres").val();
			
			if(postcode == "" || adres == "" || detailadres == ""){
				alert("필수 입력 사항입니다.")
				postcode.focus();
				return false;
			}
			console.log(postcode);
			console.log(adres);
			console.log(extraadres);
			console.log(detailadres);			
			$.ajax({
				type : "POST",
				url : "<c:url value='/changeAddress'/>",
				dataType : 'text',
				data : {
					"postcode" : postcode,
					"adres" : adres,
					"extraadres" : extraadres,
					"detailadres" : detailadres
				},
				success : function(data){
					if(data == "1"){
						alert("update에 성공하였습니다")
					} else if(data == "0"){
						alert("update에 실패하였습니다.")
					} 
					
				}
			})
		});
	})

	$(function(){
		$("#change_Intro_btn").click(
			function(){
				
				var newIntro = $(".change_Intro").val()
				alert(newIntro)
				
				$.ajax({
					type : "POST",
					url : "<c:url value='/changeIntro'/>",
					data : {
						"newIntro" : $(".change_Intro").val()
					},
					success : function(data) {
						if (data == "1") {
							alert("자기소개가 변경되었습니다.")
						} else if(data == "0") {
							alert("동일한 내용으로 변경 불가능합니다.");
							$(".change_Intro").focus()
						}
					}
				})
			})
		})
	
	$(function() {
		$("#pwd_change").click(
				function() {
					var pwd = $("#pwd").val();
					var chkNum = pwd.search(/[0-9]/g);
					var chkEng = pwd.search(/[a-z]/ig);

					if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
							.test(pwd)) {
						alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
						$("#alert-danger").show();
						$("#alert-success").hide();
						$('#pwd').val('').focus();
						return false;
					} else if (chkNum < 0 || chkEng < 0) {
						alert("숫자와 영문자를 혼용하여야 합니다.");
						$("#alert-danger").show();
						$("#alert-success").hide();
						$('#pwd').val('').focus();
						return false;
					} else { 
							$("#alert-success").show();
							$("#alert-danger").hide();
							
							$.ajax({
								type : "POST",
								url : "<c:url value='/changePwd'/>",
								data : {
									"pwd" : $("#pwd").val()
								},
								success : function(data) {
									if (data == "-1") {
										alert("기존과 동일한 비밀번호는 사용하실 수 없습니다.")
										$("#alert-danger").show();
										$(".alert-danger").attr("style",
												"color:#f00");
										$("#alert-success").hide();
									} else {
										alert("비밀번호 변경이 완료되었습니다.")
										$("#alert-success").show();
										$(".alert-success").attr("style",
												"color:#00f");
										$("#alert-danger").hide();
										$('#pwd').val('');
										$('#checkPwd').val('');
									}
								}
							})	
						}
					});
				});

	$(function() {
		$("#category_Change")
				.click(
						function() {
						if ($("input[name='inter']:checked").length < 2
								|| $("input[name='inter']:checked").length >= 5) {
							alert("관심사는 두 가지 이상 5가지 이하로 선택해주세요")
							$(".myInter").focus();
							return false;
						}

						var lists = new Array();
						$("input[name='inter']:checked").each(function(i) {
							lists.push($(this).val());
						});
						$.ajaxSettings.traditional = true;
						$.ajax({
							type : "POST",
							url : "<c:url value='/changeInter'/>",
							data : {
								"inter" : lists
								},
								contentType : "application/x-www-form-urlencoded; charset=UTF-8",
								success : function(data) {
									if (data == "1") {
										alert("관심사가 변경되었습니다.");
										$(".myInter").focus();
							/* 관심사를 변경하고 바로 변경 된 내 관심사를 보여주고 싶어서 [S] */
										$(".myCategory_Switch").click(function() {
											$.ajax({
												type : "POST",
												url : "<c:url value='/viewInter'/>",
												contentType: "application/x-www-form-urlencoded; charset=UTF-8",
												dataType:'text',
												success : function(data) {
													if (data == "") {
														$(".view_MyInter").text("등록 된 관심사가 없습니다.")
													} else {
														$(".view_MyInter").text(data)
													}
												}
											})
										}).click();
							/* 관심사를 변경하고 바로 변경 된 내 관심사를 보여주고 싶어서 [E] */
							
									} else if (data == "0") {
										alert("동일한 관심사로 변경은 불가능합니다.")
										$(".myInter").focus();
									}
								}
							})
						})
					})
					
//우편 번호[S]
		function bandPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = '(' + extraAddr + ')';
								}
								document.getElementById("extraadres").value = extraAddr;

							} else {
								document.getElementById("extraadres").value = '';
							}
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("adres").value = addr;
							document.getElementById("detailadres").focus();
						}
					}).open();
		}
		//우편 번호[S]

</script>
</html>
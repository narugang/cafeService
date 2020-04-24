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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 신고</title>
<style>
body {
    padding-top: 25px;
    background-color: #eeeeee;
}
div#main_form{
    position:absolute;
    left:7%;
    padding:25px;
    padding-bottom: 20px;
    padding-top: 10px;
    width: 750px;
}
div#send_btn{
	position:absolute;
    left:43%;
    top:90%;
}
div#main_form{
	background-color: #fff;
	border : 1px solid #fff;
}
#prepcontext {
	resize : none;
}
</style>
</head>
<body onresize="parent.resizeTo(900,600)" onload="parent.resizeTo(900,600)">
	<div id="container">
	<form id="prepPage" method="POST" onsubmit="return submitCheck()">
		<div id="main_form">		
			<h2>게시글 신고하기</h2>
				<input type="hidden" id="check" value="${check}">
				<input type="hidden" id="boardCode" name="boardCode" value="${code}"> <!-- 게시글 코드 -->
			<div>신고 사유 </div>
			<select id="prepReason" name="prepReason"> <!-- 신고 사유 -->
				<option value="0" selected>신고 사유를 선택해주세요</option>
				<option value="부적절한 이미지 이거나 음란물">부적절한 이미지 이거나 음란물</option>
				<option value="허가받지 않은 상품 홍보">허가받지 않은 상품 홍보</option>
				<option value="자해/자살과 관련된 내용">자해/자살과 관련된 내용</option>
				<option value="저작권,명예훼손 등 기타 권리를 침해">저작권,명예훼손 등 기타 권리를 침해</option>
				<option value="특정인의 개인정보가 포함">특정인의 개인정보가 포함</option>
				<option value="혐오를 조장">혐오를 조장</option>
			</select>
				<div class="errorReason">신고 사유를 확인해 주세요</div>
			<br><br>
				<!-- <input type="text" id="prepReason" name="prepReason" placeholder="신고 사유"/> -->
				<!-- <div class="errorReason">신고 사유를 확인해 주세요</div> -->			
			<div>신고 내용</div>
			<textarea rows="10" cols="80" name="prepcontext" id="prepcontext" placeholder="250자 이내로 작성해 주세요"></textarea> <!-- 신고 내용  -->
				<div class="errorContext">신고 내용을 확인해 주세요</div>
			<br><br>
		</div>
		<div id="send_btn">
			<input type="submit" id="sendPrep" value="신고하기">
		</div>
	</form>
	</div>
</body>
<script type="text/javascript">
$(".errorReason").hide();
$(".errorContext").hide();

$("#sendPrep").click(
	function(){
		if($("#prepReason").val() == ("0")){
			$("#prepReason").focus();
			$(".errorReason").show();
			return false;
		}
		if($("#prepcontext").val() == ("")){
			$("#prepReason").focus();
			$(".errorContext").show();
			return false;
		}
	})
	
var bc = $('#boardCode').val();

function submitCheck(){
	console.log(bc);
	var submitCheck = window.confirm('신고하시겠습니까?'); 
	console.log("1: "+submitCheck);
	if(!submitCheck){
		console.log("2: "+submitCheck);
		return false;
	}
	return true;
}

$(document).ready(
	function(){
		var check1 = $('#check').val();
		console.log($('#check').val());
		if(check1 == 'check'){
			self.close();
		}
})
</script>
</html>
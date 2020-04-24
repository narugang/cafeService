<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>관리자 쪽지</title>
<style>
body {
    padding-top: 25px;
    background-color: #eeeeee;
}
div#main_form{
    position:absolute;
    left:20%;
    padding:25px;
    padding-top:0;
    padding-bottom: 20px;
}

div#send_btn{
	position:absolute;
    left:44%;
    top:88%;
}
div#error_Message {
	position:absolute;
    top:102%;
}
div#main_form{
	background-color: #fff;
	border : 1px solid #fff;
}
div#error_Message{
	text-align: center;
}
#content {
	resize : none;
}
</style>
</head>
<body onresize="parent.resizeTo(700,780)" onload="parent.resizeTo(700,780)">
	<form action="<c:url value='/messageAdmin'/>" method="POST" onsubmit="return message_checkEvent()">
		<div id="main_form">		
			<h2>공지 메시지 전달</h2>
		
			<div>보내는 사람 : </div> 
			<input type="text" id="sender" name="sender" value="${authInfo.getNic()}" placeholder="발신인"></input>
			<br><br>
	
			<div>제목 : </div>
			<input type="text" id="title" name="title" placeholder="제 목"/>
			<br><br>
			
			<div>내용</div>
			<textarea rows="10" cols="50" name="content" id="content" placeholder="250자 이내로 작성해 주세요"></textarea>
			<br><br>
			
			<div>받는 사람 :<br>
				<select name="select_Range" id="select_Range">
					<option value="0" selected>개별 발송</option>
					<option value="1">전체 멤버에게 보내기</option>
					<option value="2">카페 관리자에게 보내기</option>
					<option value="3">미구현(카페관리자->카페회원)</option>
				</select>
			</div>
			<br>
			<div>개별 발송 :</div>
			<input type="text" name="target" id="target" placeholder="수신인"/>
			 <br>[여러명에게 보낼 경우]<br> (ex.강태헌,홍영표,박인우,이규철,garnet2929,...로 입력해주세요)
			<br><br>
			
			<div id="error_Message" style="color:#f00;">
				<h5>[발신자,수신자,제목,내용]이 없는 메시지는 발송할 수 없습니다.</h5>
			</div>
		</div>
		<div id="send_btn">
			<input type="submit" id="send" class="send" value="보내기">
			<input type="reset" id="claen" class="claen" value="취소" onclick="window.close();">
		</div>
	</form>
</body>
<script type="text/javascript">
function checkRange() {
	var rangeVal = $('#select_Range option:selected').text();
	$("#target").val(rangeVal);
}

$(document).ready(function(){
	checkRange();
	$("#select_Range").change(function (){
		checkRange();
	})
});		

$("#error_Message").hide();
	function message_checkEvent(){
		if($("#sender").val() == ('')){
			$("#error_Message").show();
			$("#sender").focus();
			return false;
		} else if($("#target").val() == ('')){
			alert($("target").val())
			$("#error_Message").show();
			$("#target").focus();
			return false;
		} else if($("#title").val() == ('')){
			$("#error_Message").show();
			$("#title").focus();
			return false;
		} else if($("#content").val() == ('')){
			$("#error_Message").show();
			$("#content").focus();
			return false;
		} 
	}
</script>
</html>
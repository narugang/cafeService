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
<title>쪽지</title>
<style>
body {
    padding-top: 25px;
    background-color: #eeeeee;
}
div#main_form{
    position:absolute;
    left:20%;
    padding:25px;
    padding-bottom: 20px;
    padding-top: 0;
}

div#send_btn{
	position:absolute;
    left:42%;
    top:83%;
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
<body onresize="parent.resizeTo(700,750)" onload="parent.resizeTo(700,750)">
	<div id="container">
	<form action="<c:url value='/message'/>" method="POST" onsubmit="return message_checkEvent()">
		<div id="main_form">		
			<h2>쪽지보내기</h2>
		
			<div>보내는 사람 : </div> 
			<input type="text" id="sender" name="sender" value="${authInfo.getNic()}" placeholder="발신인"></input>
			<br><br>
	
			<div>제목 : </div>
			<input type="text" id="title" name="title" placeholder="제 목"/>
			<br><br>
			
			<div>내용</div>
			<textarea rows="10" cols="50" name="content" id="content" placeholder="250자 이내로 작성해 주세요"></textarea>
			<br><br>
			
			<div>받는 사람 :</div> 
			<input type="text" name="target" id="target" placeholder="수신인"/>
			 <br>[여러명에게 보낼 경우]<br> (ex.홍길동,임꺽정,alis,...로 입력해주세요)
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
	</div>
</body>
<script type="text/javascript">
$("#error_Message").hide();
	function message_checkEvent(){
		if($("#sender").val() == ('')){
			$("#error_Message").show();
			$("#sender").focus();
			return false;
		} else if($("#target").val() == ('')){
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
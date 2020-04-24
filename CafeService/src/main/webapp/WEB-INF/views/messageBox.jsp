<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메시지 보관함</title>
<style>
body{
	 background-color: #eeeeee;
}
div#container{
	background-color: #fff;
	height: 500px;
	
}
div#sendMessage{
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
    width: 200px;
    height: 200px;
    text-align: center;
    display:table-cell;
    vertical-align:middle;
}
div#receiveMessage{
	display:inline-block;
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
	width: 200px;
    height: 200px;
    display:table-cell;
    vertical-align:middle;
    text-align:center;
}
div#closeBtn{
	display : flex;
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
    width: 55px;
    margin-left: 260px;
    margin-top: 50px;
}
div a{
	color:#fff;
	text-decoration: none;
}
div#send_receiveMessage{
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	place-content: center;
    padding-top: 130px;
    padding-left: 85px;
}
div#margin{
	display: table-cell;
    width: 10px;
}
</style>
</head>
<body>
<body onresize="parent.resizeTo(600,600)" onload="parent.resizeTo(600,600)">
<div id="container">
		<div id="send_receiveMessage">
			<div id="sendMessage">
				<h3><a href="<c:url value='/viewSendMessage'/>">보낸 메시지</a></h3>
			</div>
			<div id="margin"></div>
			<div id="receiveMessage">
				<h3><a href="<c:url value='/receiveMessage'/>">받은 메시지</a></h3>
			</div>
		</div>
		<div id="closeBtn">
			<a href="" id="window_Close">창 닫기</a>
		</div>
	</div>
</body>
<script type="text/javascript">
$("#window_Close").click(function(){
	self.close();
})
</script>
</html>
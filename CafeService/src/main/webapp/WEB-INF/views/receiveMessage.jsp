<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>보낸 메일함</title>
<style type="text/css">
body {
	background: #eeeeee;
}
div#container{
	background-color: #fff;
}
div#message_target_name,#message_Head_Title,#message_receiveTime{
	background-color: #007bff;
	display: inline-block;
	color: #fff;
	margin : 5px;
	padding: 5px;
	border-radius: 5px;
	text-align: center;
}
div#message_target_name{
	width: 110px;
}
div#message_Head_Title{
    width: 250px;
}
div#message_receiveTime{
	width: 100px;
}
div#message_NicName,#message_Title,#message_Date{
	display: inline-block;
	margin: 5px;
	padding : 5px;
	background-color: rgba(0,0,0,.03);
}
div#message_NicName{
	width:110px;
}
div#message_Title{
	width:250px;
	text-decoration: none;
	color:#007bff;
}
div#message_Title a{
	text-decoration: none;
	color:#007bff;
}
div#message_Date{
	width:100px;
}
div#message_NicName,#message_Date{
	text-align: center;
}
div#message_Box_Title{
	text-align: center;
	/* display: inline-block; */
	font-size: 1.25rem;
}
div#context_view_area{
	margin: 5px;
	margin-left: 45px;
	width:500px;
	text-align: left;
}
div#message_Header{
	text-align: center;
}
div#tot_context_area{
	text-align: center;
}
a#move_messageBox{
	text-decoration: none;
	color: #007bff;
}
div#move_messageBox_div{
	background-color: #fff;
	margin: 10px;
	display: inline-block;
	border-radius: 5px;
	width: 200px;
	text-align: center;
}
a {
	text-decoration: none;
}
</style>
</head>
<body>
<body onresize="parent.resizeTo(600,600)" onload="parent.resizeTo(600,600)">
	<div id="container">
		<!-- pageing Test -->
		<div id="outter">
			<div id="message_Box_Title">받은 쪽지함</div>
				<div id="message_Header">
					<div id="message_target_name">보낸 사람</div>
					<div id="message_Head_Title">제 목</div>
					<div id="message_receiveTime">받은 시간</div>
				</div>
					<div id="tot_context_area">
					<c:forEach var="allMessage" items="${viewAll}" varStatus="status">
						<div id="division_area">
							<!-- 받는 사람 -->
							<div id="message_NicName"><c:out value="${listNic[status.index]}"/></div>
							<!-- 제 목 -->
							<div id="message_Title"><a class="getMessage_Index" id="${status.index }" href="<c:out value="${allMessage.num }"/>">
								<c:out value="${allMessage.title }"/>
							</a></div>
							<!-- 보낸 시간 -->
							<div id="message_Date"><fmt:formatDate value="${allMessage.open}" pattern="yyyy-MM-dd"/></div>
							<div id='hide_Num' style="display:none"><c:out value="${allMessage.num }"/></div>
						</div>
						<div id="context_view_area">
							<div id="messageContext${status.index}" style="display:none"></div>
						</div>
					</c:forEach>
				</div>
			<div style="display: block; text-align: center;">		
				<c:if test="${paging.startPage != 1 }">
					<a href="receiveMessage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a href="receiveMessage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a href="receiveMessage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
				</c:if>
			</div>
		</div>
		<!-- pageing Test -->
		</div>
	<div id="move_messageBox_div">
		<a id="move_messageBox" href="<c:url value='/messageBox'/>">메시지 보관함으로 이동</a>	
	</div>
</body>
<script type="text/javascript">
$(".getMessage_Index").on("click",function(event){
	event.preventDefault();
  	var messageNum = $(this).attr("href");
	var messageContext = 'messageContext'+$(this).attr("id");
	$.ajax({
		type : "POST",
		url : "<c:url value='/pullContext'/>",
		data : {
			"num" : $(this).attr("href")
		},
		success : function(data) {
			if (data == "") {
				alert("내용이 없습니다.")
			} else if(data != "") {
				$("#"+messageContext).text("내용 : "+data).slideToggle();
			}
		}
	});
});
</script>
</html>
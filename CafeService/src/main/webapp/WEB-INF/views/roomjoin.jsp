 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>웹 소켓 통신</title>
</head>
<body>
	<input type="hidden" id="userId" value="${mem}">  <!-- 유저아이디  -->
	<header>
		<p>"${param.roomcode}"번 방입니다.</p>
		<Button id="menu_btn">매뉴</Button>
		<div id="menu" style="display:none">
			<label>그룹대화: </label>
			<label id ="memcount">${memcount}</label>
			<label> 명</label>
			<input type="button" value="초대하기" onclick="invite();" />
		</div>
	</header>
	<section>
		<div id="message" style="overflow:auto; width:450px; height:750px; background-color:#ede5ca; overflow:scroll;">
		</div>
	</section>
	<footer>
	<input type="text" id="messageinput">
	<button onclick="send();">Send</button>
	</footer>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        var ws;
        var messages = document.getElementById("message");
        var date = new Date();
        function chatlist(dateval) {
        	$.ajax({
        		url: '<c:url value ="/chatlist"/>',
        		type:'POST',
        		data: {sendda: dateval},
        		dataType: 'json',
        		success: function(chatlist){
        			$('#message').empty();
        			for(var chat in chatlist){
	        			var sendmem = chatlist[chat].sendmem;
	        			var datetext;
	        			if(sendmem == '${mem}'){
	        				var taglist = "<div style=\"position:static; width:100%;\">"+
	        				"<label style=\"float:right\">"+chatlist[chat].nic+"</label><br>"+
							"<p style=\"text-align:right\">"+chatlist[chat].fileadd+"</p><br>"+
		        			"<p style=\"text-align:right\">"+chatlist[chat].contxt+"</p><br>"+
		        			"<p style=\"text-align:right\">"+chatlist[chat].sendda+"</p><br>"+
							"</div>";
	        			}else{
	        				var taglist = "<div style=\"position:static; width:100%;\">"+
	        				"<label style=\"float:left\">"+chatlist[chat].nic+"</label><br>"+
							"<p style=\"text-align:left\">"+chatlist[chat].fileadd+"</p><br>"+
		        			"<p style=\"text-align:left\">"+chatlist[chat].contxt+"</p><br>"+
		        			"<p style=\"text-align:left\">"+chatlist[chat].recda;+"</p><br>"+
							"</div>";
	        			}
	        			
	        			$('#message').append(taglist);
        			}
        			$('#message').scrollTop($('#message').prop('scrollHeight'));
        		}
        	});
        }
        window.onload = function openSocket(){
        	$('html, body').scrollTop($(document).height());
        	$('#message').scrollTop($('#message').prop('scrollHeight'));
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");
                return;
            }
            var locdate = date.toLocaleString();
            chatlist(locdate);
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://localhost:8080/cafeService/echo');
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
                date = new Date();
                chatlist(date.toLocaleString());
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }  
        function send(){
            var text = document.getElementById("messageinput").value;
            ws.send(text);
            text="";
            
        }
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            message.innerHTML+="<br/>"+text;
        }
        
        var inviteWin;
        
        function invite(){
        	inviteWin = window.open("invite",'',"width=500px, height=500px");
        	$('#menu').toggle();
        }
    $(document).ready(function(){
    	$('#menu_btn').click(function(){
    		$('#menu').toggle();
    		$.ajax({
    			url: '<c:url value ="/memcount"/>', // 서버 url
    			type: 'GET',
    			dataType: 'json',//전송방식
    			// 데이터 전송/요청 성공할 떄 실행되는 함수 (반환데이터)
    			success: function(memcount) {
    				console.log(memcount);
    				$('#memcount').empty();
    			    var tagList = memcount;
    		        $('#memcount').append(tagList); 
    			}
    		}); 
    	});
    });
    </script>
</body>
</html>

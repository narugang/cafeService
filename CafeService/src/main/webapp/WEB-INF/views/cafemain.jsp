<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부트 스트랩  테마-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Jquery입니다.-->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- 부트 스트랩 JS-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	input#alarm {
	background:url(/chat3/resources/alarm1.jpg); /*Resource 경로가 매핑되있으시면 그걸 사용하시고 저는 webapp의 resources 폴더를 사용했습니다. chat3는 프로젝트명입니다. */
	background-repeat: no-repeat;
	width:40px;
	height:40px;
	border: 0;
	}
	 input#msg {
	background:url(/chat3/resources/msg1.jpg);
	background-repeat: no-repeat;
	width:40px;
	height:40px;
	border: 0;
	} 
	input#chat {
	background:url(/chat3/resources/chat1.jpg);
	background-repeat: no-repeat;
	width:40px;
	height:40px;
	border: 0;
	}
	 input#user {
	background:url(/chat3/resources/user1.jpg);
	background-repeat: no-repeat;
	width:40px;
	height:40px;
	border: 0;
	}
	.dd {
		position: relative;
		display: inline-block;
	}
	.dd-content {
		display: none;
		position: absolute;
		right: 0px;
		background-color: AliceBlue;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	}
	.dd-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
		border-bottom: 1px solid #bbb;
	}
	.dd-content a:last-child {
		border-bottom: none;
	}
	.dd-content a:hover {
		background-color: Gold;
	}
	.dd:hover .dd-content {
		display: block;
	}
	 #mask {
      position:fixed;
      z-index:9000;
      background-color:#000;
      display:none;
      left:0;
      top:0;
    }
    .window{
      display: none;
      position:absolute;
      left:100px;
      top:100px;
      z-index:10000;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header" style="width:970px; position: fixed;  margin: 0 auto; left: 0; right: 0;">
	<div id="logo" style="width:480px; display:inline-block;">
		<input type="button" id="alarm" name="alarm" value="">
			<div class="main-logo">
			</div>
	</div>
	<div class="dropmenu" align="right"  style="width:480px; margin-right:0px; display:inline-block;">
		<div class="dd">
			<input type="button" id="alarm" name="alarm" value="">
			<div class="dd-content">
				<a href="#">새 알림</a> <a href="#">읽은 알림</a>
			</div>
		</div>
		<div class="dd">
	 		<input type="button" id="msg" name="msg" value="">
	  		<div class="dd-content">
				<a href="#">새 매세지 보기</a><a href="#">메세지 전송</a> <a href="#">메세지 목록</a>
			</div>
		</div>
		<div class="dd">
			<input type="button" id="chat" name="chat" value="">
			<div class="dd-content">
				<a href="#">새 채팅방 만들기</a> <a href="#">참여중인 채팅방</a> <a href="#">채팅방참여</a>
			</div>
		</div>
		<div class="dd">
			<input type="button" id="user" name="user" value="">
			<div class="dd-content">
				<a href="#">내 정보</a> <a href="#">내 밴드</a> <a href="#">설정</a> <a href="#">로그아웃</a>
			</div>
		</div>
	</div>
	<div id="nav">
		<ul>
			<li>
				<a href="/chat3/bandMain" role="button" aria-pressed="false">
					<span class="navTopMenu">전체글
					</span>
				</a>
			</li>
			<li>
				<a href="/chat3/calendar" role="button" aria-pressed="false">
					<span class="navTopMenu">일정
					</span>
				</a>
			</li>
			<li>
				<span class="navTopMenu">멤버
				</span>
			</li>
		</ul>
	</div>
</div>
<div id="section" style="width:970px; position: fixed; margin: 0 auto; left: 0; right: 0; margin-top:115.6px;">
	<div id="left" style="display:inline-table; width:180px">
		<div id="introBox">
			<div id="faceImg">
			<img>
			${band.image}
			</div>
			<div id="bandName">
				<a href="/chat3/bandMain">${band.title}</a>
			</div>
			<p id="bandMember">
				<a></a>
			</p>
			<p id="bandIntroText">
				${band.content}
			</p>
		</div>
		<div id="bandJoinBox">
			<form>
				<c:if test="${countBmem eq 0}">	
					<button type="button" class="bandJoinButton" onclick="joinBand()">가입하기</button>
				</c:if>
				<input type="hidden" id="band" value="${band.seq}">
			</form>
		</div>
		<div id="homegroundBox">
			${band.address}
		</div>
		<div id="visitorBox">
			${band.cnt}
		</div>
		<div id="bandBoardBox">
		
		</div>
	</div>
	<div id="center" style="display:inline-table; width:560px">
		<div id="bandSearchBox">
			<div>
				<input type="text">
				<button type="submit">검색</button>
			</div>
		</div>
		<div id="bandWritingBox">
			<div id="mask"></div>
		    <div class="window" style="width: 500px; height:500px;">
			        <p><input type="button" href="#" class="close" value="X"/>
			        <input type = "text" name="title"/></p>
			        <p><textarea name="content" cols="40" rows="8">
			        </textarea></p>
			        <p><input type = "file" name="file"></p>
			        <p><button type="button" value="글쓰기" onclick="bandWrite"></button></p>
		    </div>
			<button type="button" class="bandWritingBox">글쓰기</button>
		</div>
		<div id="bandContextlistBox">
			<div>
			</div>
		</div>
	</div>
	<div id="right" style="display:inline-table; width:200px">
		<section id="bandChatting" style="position:relative">
			<h2>채팅</h2>
			<div style="position:absolute; top:7px; right:14px;">
				<button type="button" id="roomcreate">방만들기</button>
			</div>
			<div style="overflow:auto; width:200px; height:400px; background-color:#ede5ca;" id="content">
			</div>
		</section>
	</div>
</div>
<script>
/* =============================================================================================================채팅 */
	function roomjoin(i){
		var roomlist = "roomlist"+i;
		var roomjoin = "roomjoin"+i;	
		window.open("",roomjoin,"width=500px, height=500px");
	 	var rl = document.getElementById(roomlist);
		rl.submit();
	}
	function roomdelete(roomcodeval) {
		$.ajax({
			url: '<c:url value ="/roomDelete"/>', // 서버 url
			type: 'POST', //전송방식
			data: {roomcode: roomcodeval},
			dataType: 'json', // 서버로 부터 받아올 데이터 형식
			// 데이터 전송/요청 성공할 떄 실행되는 함수 (반환데이터)
			success: function(roomlist) {
				$('#content').empty();
				for(var room in roomlist){
			        var tagList = ("<form id= \"roomlist"+roomlist[room].code+"\" action=\"<c:url value ='/roomjoin'/>\" target=\"roomjoin"+roomlist[room].code+"\">"
					+"<h3>방제목: "+roomlist[room].sub+"</h3>"
					+"<p>마지막 글내용: "+roomlist[room].lastlog+"</p>"
					+"<p>이미지 주소: "+roomlist[room].img+"</p>"
					+"<p>안읽은 글: "+roomlist[room].unreadmsg+"</p>"
					+"<p>최근 글이 올라온 시간: "+roomlist[room].newdate+"</p>"
					+"<input type=\"hidden\" name=\"roomcode\" value=\""+roomlist[room].code+"\"/>"			
					+"<input type=\"button\" value=\""+roomlist[room].code+"번방 입장\" onclick=\"roomjoin('"+roomlist[room].code+"')\">"
					+"<input  type=\"button\" class =\"roomdelete\" onclick=\"roomdelete('"+roomlist[room].code+"')\" value=\"방나가기\">"
					+"<br><br>"
				+"</form>");
		            $('#content').append(tagList); 
			    }// html 파일에서 listArea영역 지우고
			    return false;
			}
		});
	}
	$(document).ready(function(){
		function roomlist() {
			$.ajax({
				url: '<c:url value ="/roomlist"/>', // 서버 url
				type: 'GET', //전송방식
				dataType: 'json', // 서버로 부터 받아올 데이터 형식
				// 데이터 전송/요청 성공할 떄 실행되는 함수 (반환데이터)
				success: function(roomlist) {
					$('#content').empty();
					for(var room in roomlist){
				        var tagList = ("<form id= \"roomlist"+roomlist[room].code+"\" action=\"<c:url value ='/roomjoin'/>\" target=\"roomjoin"+roomlist[room].code+"\">"
						+"<h3>방제목: "+roomlist[room].sub+"</h3>"
						+"<p>마지막 글내용: "+roomlist[room].lastlog+"</p>"
						+"<p>이미지 주소: "+roomlist[room].img+"</p>"
						+"<p>안읽은 글: "+roomlist[room].unreadmsg+"</p>"
						+"<p>최근 글이 올라온 시간: "+roomlist[room].newdate+"</p>"
						+"<input type=\"hidden\" name=\"roomcode\" value=\""+roomlist[room].code+"\"/>"			
						+"<input type=\"button\" value=\""+roomlist[room].code+"번방 입장\" onclick=\"roomjoin('"+roomlist[room].code+"')\">"
						+"<input  type=\"button\" class =\"roomdelete\" onclick=\"roomdelete('"+roomlist[room].code+"')\" value=\"방나가기\">"
						+"<br><br>"
					+"</form>");
			            $('#content').append(tagList); 
				    }// html 파일에서 listArea영역 지우고
				}
			});
		};
		roomlist();
		$('#roomcreate').click(function() {
		var subname = window.prompt('방제목을 입력해 주세요','');
			if(subname!=null){
				$.ajax({
					url: '<c:url value ="/roomCreate"/>', // 서버 url
					type: 'POST', //전송방식
					data: {sub: subname},
					dataType: 'json', // 서버로 부터 받아올 데이터 형식
					// 데이터 전송/요청 성공할 떄 실행되는 함수 (반환데이터)
					success: function(roomlist) {
						$('#content').empty();
						for(var room in roomlist){
					        var tagList = ("<form id= \"roomlist"+roomlist[room].code+"\" action=\"<c:url value ='/roomjoin'/>\" target=\"roomjoin"+roomlist[room].code+"\">"
							+"<h3 name =\"sub\">방제목: "+roomlist[room].sub+"</h3>"
							+"<p name=\"lastlog\">마지막 글내용: "+roomlist[room].lastlog+"</p>"
							+"<p name=\"img\">이미지 주소: "+roomlist[room].img+"</p>"
							+"<p name=\"unreadmsg\">안읽은 글: "+roomlist[room].unreadmsg+"</p>"
							+"<p name=\"newdate\">최근 글이 올라온 시간: "+roomlist[room].newdate+"</p>"
							+"<input type=\"hidden\" name=\"roomcode\" value=\""+roomlist[room].code+"\"/>"			
							+"<input type=\"button\" value=\""+roomlist[room].code+"번방 입장\" onclick=\"roomjoin('"+roomlist[room].code+"')\">"
							+"<input  type=\"button\" class =\"roomdelete\" onclick=\"roomdelete('"+roomlist[room].code+"')\" value=\"방나가기\">"
							+"<br><br>"
						+"</form>");
				            $('#content').append(tagList); 
					    }// html 파일에서 listArea영역 지우고
					}
				});
			}
		});
	});
/* =============================================================================================================채팅 */
	function joinBand(){
		$.ajax({
			url: '<c:url value ="/joinBand"/>',
			type: 'POST', 
			data: {band: $('#band').val()},
			success: function() {
				$('.bandJoinButton').remove();
			}
		});
	}
	function wrapWindowByMask(){
	       var maskHeight = $(document).height();
	       var maskWidth = $(window).width();  
	       $('#mask').css({'width':maskWidth,'height':maskHeight});  
	       $('#mask').fadeTo("fast",0.8);    
	       $('.window').show();
	   }
	 
	   $(document).ready(function(){
	       $('.bandWritingBox').click(function(e){
	           e.preventDefault();
	           wrapWindowByMask();
	       });
	       $('.window .close').click(function (e) {
	           e.preventDefault();
	           $('#mask, .window').hide();
	       });       
	       $('#mask').click(function () {
	       	var real = confirm('작성한 글은 저장되지 않습니다. 정말 나가시겠습니까?');
	           if(real){
	        	$(this).hide();
	            $('.window').hide();
	        }
	       });
	   });
	function bandWrite(){
		
	}
</script>
<footer>
</footer>
</body>
</html>
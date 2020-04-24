<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<!-- 부트 스트랩  테마-->
<!-- 부트 스트랩 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Jquery입니다.-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- 부트 스트랩 JS-->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fullcalendar/core/main.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fullcalendar/daygrid/main.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fullcalendar/timegrid/main.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fullcalendar/list/main.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/fullcalendar/core/main.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar/daygrid/main.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar/timegrid/main.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar/list/main.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar/interaction/main.js'/>"></script>
<link rel="stylesheet" href="<c:url value='resources/css/bandmain.css'/>">
<style>
ul{
   list-style:none;
}
  html, body {
	background-color: #eeeeee;
	}
	#external-events {
	  position: fixed;
	  z-index: 2;
	  top: 20px;
	  left: 20px;
	  width: 150px;
	  padding: 0 10px;
	  border: 1px solid #ccc;
	  background: #eee;
	}
	#external-events .fc-event {
	  margin: 1em 0;
	  cursor: move;
	}
	#calendar-container {
	  position: relative;
	  z-index: 1;
	  margin-left: 200px;
	}
	#calendar {
	  max-width: 900px;
	  margin: 20px auto;
	}	
        .h7 {
            font-size: 0.8rem;
        }
		.cafehomeLink{
        	display: block;
    		text-decoration-line: none;
    		color: #1d2124;
        }
        .gedf-wrapper {
            margin-top: 0.97rem;
        }

        @media (min-width: 992px) {
            .gedf-main {
                padding-left: 4rem;
                padding-right: 4rem;
            }
            .gedf-card {
                margin-bottom: 2.77rem;
            }
        }
        #cafeImage{
			max-width: -webkit-fill-available;
			margin-bottom:10px;
		}	

        /**Reset Bootstrap*/
        .dropdown-toggle::after {
            content: none;
            display: none;
        }
        .input-group-append{
        	padding-right:10px;
        }
        .input-group{
        	padding-right:10px;
        }
        .navbar-nav{
        	margin: 0 auto;
        }
        .col-md-3{
        	text-align:center;
        }
img {
    vertical-align: 0;
}
/* .container1 {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: 0px;
}

@media ( min-width : 1200px) {
	.container1 {
		width: 500px;
	}
}

.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 1200px) {
	.container {
		width: 970px;
	}
}

.button {
	background-color: blue;
	border: 0px;
	color: white;
	padding: 15px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	overflow: hidden;
} */

</style>
<meta charset="UTF-8">
<title>calendar</title>
</head>
<body>
<nav class="navbar navbar-light bg-white">
            <a href="./bandmain"class="navbar-brand" class="navbar-brand">
           	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px;">
 </a>
           
           
          <div class = "headerbar1" style=" vertical-align: middle; height: 80px; align: left; margin-right: auto;">
		<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" 
				value="${scri.keyword}" class="form-control" width="50px" id="keywordInput" placeholder="카페 및 게시글 검색"
				 style="width: 200px;  margin-top: 17px; vertical-align: middle; float: left; "
														 />
                
                
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
<nav class="navbar navbar-expand-lg navbar-center navbar-light bg-light">
	   <div class="collapse navbar-collapse" id="navbarNavDropdown">
	   		<ul class="navbar-nav">
		    	<li class="nav-item">
		    		<a href="<c:url value="/cafehome?seq=${cafe.seq}"/>" role="button" aria-pressed="false" class="nav-link">전체글 <span class="sr-only">(current)</span></a>
		        </li>
		        <li class="nav-item">
		            <a href="<c:url value="/calendar?seq=${cafe.seq}"/>" role="button" aria-pressed="false" class="nav-link">일정</a>
		        </li>
		        <li class="nav-item">
		        	<a href="<c:url value="/cafemember?seq=${cafe.seq}"/>" role="button" aria-pressed="false" class="nav-link">멤버</a>
		        </li>
		    </ul>
	  	</div>   	
    </nav>
	<div class="container-fluid gedf-wrapper">
    	<div class="row">
   			<div class="col-md-3">
		   		<div class="card">
		        	<div class="card-body">
		        		<img id ="cafeImage" src="<c:url value="/"/>${cafe.image}" alt="">
		            	<div class="h5"><a href="<c:url value="/cafehome?seq=${cafe.seq}"/>" class="cafehomeLink">${cafe.title}</a></div>
		                <div class="h7 text-muted">${cafe.content}</div>
		                <div class="h7">${cafe.address}</div>
		                <form id="cafeSeqFrm" action="<c:url value="/cafesearchSubContent"/>">
							<c:if test="${countCfmem eq 0}">
								<br>   
						       <button type="button" name="cafeJoinButton" class="btn btn-primary" onclick="joinCafe()">가입하기</button>
						    </c:if>
						    <c:if test="${cfmemberAuth eq 0}">
						    	<br>   
						    	<button type="button" name="cafeadminPage" class="btn btn-primary" onclick="cafeAdminPage()">카페설정</button>
						    </c:if>
							<input type="hidden"  name="seq" id="cafe" value="${cafe.seq}">
						    <input type="hidden"  id="category" value="0">
					    </form>
		            </div>
			            <ul class="list-group list-group-flush">
							<li id="caegory0" class="list-group-item"><a href="<c:url value="/cafehome?seq=${cafe.seq}"/>" class="cafehomeLink" role="button" aria-pressed="false">모든글보기</a></li>
						</ul>
					</div>
			        <br><br>
			        <ul class="list-group list-group-flush">
			        	<li class="list-group-item">
			            	<div class="h6 text-muted">전체 방문자 수</div>
			                <div class="h5">${cafe.tocnt}</div>
			            </li>
			            <li class="list-group-item">
			            	<div class="h6 text-muted">오늘 방문자수</div>
			                <div class="h5">${cafe.cnt}</div>
			            </li>
			        </ul>
			   </div>
			   <div id="cafeAdmin">
			   </div>
   <!-- ///////////////////////////////////////////////////////////////////////////////////////////////// -->
	           <div class="col-md-6 gedf-main">
	
	                <!--- \\\\\\\Post-->
	                <div id="cafeSearchBox" class="card gedf-card">
	                    <div class="card-body">
	                        <div class="btn-toolbar justify-content-between" style="float:left;">
								<div id='calendar'></div>
	                        	 <form class="form-inline">
	            						<div class="input-group">
	                						<input type="text" id="searchtext" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
	                						<div class="input-group-append">
	                    						<button class="btn btn-outline-primary" type="button" id="button-addon2" onclick="calendarPostSearchClick()">
	                        						<i class="fa fa-search"></i>
	                    						</button>
	                						</div>
	            						</div>
	        						</form>
	                             <div id="cafeWritingBox" class="btn-group">
						      	 	<input type="hidden" id="postLoadCnt" value="0">
	                             </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- Post /////-->
					<div id="cafeContextlistBox">
					</div>
				</div>
   <!-- ///////////////////////////////////////////////////////////////////////////////////////////////// -->
			    <div class="col-md-3">
			   		<div class="card gedf-card">
			        	<div class="card-body">
			            	<h5 class="card-title">채팅</h5>
			                	<div style="position:absolute; top:7px; right:14px;">
			            			<button type="button" id="roomcreate">방만들기</button>
			         			</div>
			         			<div style="overflow:auto; width:200px; height:400px; background-color:#ede5ca;" id="content">
			         			</div>
			            </div>
			        </div>
			   </div>
		</div>
	</div>
<script>
/* ========================================================================================================================= 달력 */
	var startday;
	var endday;
	$(document).ready(function() {
		var Calendar = FullCalendar.Calendar;
		    var calendarEl = document.getElementById('calendar');
		    var dateStr;
		    var delUpdate;
		    var calendar = new Calendar(calendarEl, {
		      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		      timeZone:'UTC',
		      navLinks: true,
		      locale:"ko",
		      selectable: true,
		      eventLimit: true,
		      editable: true,
		      header: {
		        left: ' today, addEventButton, prev',
		        center: 'title',
		        right: 'next, dayGridMonth, timeGridWeek, timeGridDay'
		      },
		      events: '<c:url value ="/calendarmonth?seq=${cafe.seq}"/>',
		      eventDrop: function(info) {
		    	  var id = info.event.id;
		    	  var between = info.event.start.toISOString();
		    	  var sink = false;
		    	    if (!confirm("변경 하시겠습니까??")) {
		    	    	info.revert();
		    	    	sink = true;
		    	    }else{
		    	    	sink = false;
		    	    }
		    	    if( sink == false){
		    	    	calendarUpdate(id, between);
		    	    }
		      },
		      eventClick: function(info) {
		          var eventObj = info.event;
		          alert('Clicked ' + eventObj.id);
		      },
		      eventResize: function(info) {
		    	    var id = info.event.id;
			    	var between = info.event.end.toISOString();
		    	    var sink = false;
		    	    if (!confirm("변경 하시겠습니까?")) {
		    	    	info.revert();
		    	    	sink = true;
		    	    }else{
		    	    	sink = false;
		    	    }
		    	    if( sink == false){
		    	    	calendarUpdateSize(id, between);
		    	    }
		      },
		      dateClick: function(info) {
		      	if(dateStr != null && dateStr.$('#onDragClick').val()=='true'){
		      		var starttime = prompt('시작 시간을 입력해 주세요(HH24:MI:SS)','');
		      		var endtime = prompt('종료 시간을 입력해 주세요(HH24:MI:SS)','');
		      		var date = info.dateStr;
		      		
		      		var hh = starttime.substr(0, 2);
		      		var mi = starttime.substr(3, 2);
		      		var starttime = hh+':'+mi;
		      		var ehh = endtime.substr(0, 2);
		      		var emi = endtime.substr(3, 2);
		      		var endtime = ehh+':'+emi;
		      		
		      		dateStr.$('#startdate').val(date);
		      		dateStr.$('#enddate').val(date);
		      		dateStr.$('#starttime').val(starttime);
		      		dateStr.$('#endtime').val(endtime);
		      	}
		      	else{
		      		var date = info.dateStr;
		      		var result = selectCalendar(date, date);
		      		startday = date;
		      		endday = date;
		      	}
		      },
		      select: function(info) {
		    	 if(dateStr != null && dateStr.$('#onDragClick').val()=='true'){
		    	  	var starttime = prompt('시작 시간을 입력해 주세요(HH24:MI:SS)','');
		      		var endtime = prompt('종료 시간을 입력해 주세요(HH24:MI:SS)','');
		      		var startdate = info.startStr;
		      		var enddate = info.endStr;
		      		
		      		var hh = starttime.substr(0, 2);
		      		var mi = starttime.substr(3, 2);
		      		var starttime = hh+':'+mi;
		      		var ehh = endtime.substr(0, 2);
		      		var emi = endtime.substr(3, 2);
		      		var endtime = ehh+':'+emi;
		      		
		      		dateStr.$('#startdate').val(startdate);
		      		dateStr.$('#enddate').val(enddate);
		      		dateStr.$('#starttime').val(starttime);
		      		dateStr.$('#endtime').val(endtime);
		      	}
		    	else{
		    		var startdate = info.startStr;
		      		var enddate = info.endStr;
			    	var result = selectCalendar(startdate, enddate);
			    	startday = startdate;
			    	endday = enddate;
			    } 
		     
		      },		     
		  	  customButtons: {
		        addEventButton: {
		        	text: '이벤트 추가',
		        	click: function() {
		        		if(dateStr == undefined){
		        			dateStr = window.open('<c:url value="/calendarInput"/>', "", "width=400px, height=600px");	
		        		}else if(dateStr.closed){
		        			dateStr = window.open('<c:url value="/calendarInput"/>', "", "width=400px, height=600px");
		        		}
		        		
			            var date = new Date(dateStr + 'T00:00:00'); // will be in local time
		        	
	
			            if (!isNaN(date.valueOf())) { // valid?
			            	calendar.addEvent({
			            		title: 'dynamic event',
			                	start: date,
			                	allDay: true
			              	});
			            	alert('Great. Now, update your database...');
			            } else {
			              
			            }
		         	}
		        }
		      }
/* 		      eventClick: function(info) {									*이벤트 클릭: eventClick triggering
		          var eventObj = info.event;

		          if (eventObj.url) {
		            alert(
		              'Clicked ' + eventObj.title + '.\n' +
		              'Will open ' + eventObj.url + ' in a new tab'
		            );

		            window.open(eventObj.url);

		            info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
		          } else {
		            alert('Clicked ' + eventObj.title);
		          }
		        },
		        events: [
		          {
		            title: 'simple event',
		            start: '2020-02-02'
		          },
		          {
		            title: 'event with URL',
		            url: 'https://www.google.com/',
		            start: '2020-02-03'
		          }
		        ]																       
================================================================================================================================================
		      eventColor: 'green',							이벤트 색상지정: Event color customization
		      events: [
		        {
		          title: 'All Day Event',
		          start: '2020-02-01'
		        },
		        {
		          title: 'Long Event',
		          start: '2020-02-07',
		          end: '2020-02-10',
		          color: 'purple' // override!
		        },
		        {
		          groupId: '999',
		          title: 'Repeating Event',
		          start: '2020-02-09T16:00:00'
		        },
		        {
		          groupId: '999',
		          title: 'Repeating Event',
		          start: '2020-02-16T16:00:00'
		        },
		        {
		          title: 'Conference',
		          start: '2020-02-11',
		          end: '2020-02-13',
		          color: 'purple' // override!
		        },
		        {
		          title: 'Meeting',
		          start: '2020-02-12T10:30:00',
		          end: '2020-02-12T12:30:00'
		        },
		        {
		          title: 'Lunch',
		          start: '2020-02-12T12:00:00'
		        },
		        {
		          title: 'Meeting',
		          start: '2020-02-12T14:30:00'
		        },
		        {
		          title: 'Birthday Party',
		          start: '2020-02-13T07:00:00'
		        },
		        {
		          title: 'Click for Google',
		          url: 'http://google.com/',
		          start: '2020-02-28'
		        }
		      ]*/
		    });
		    calendar.render();
	});
	function calendarUpdate(id, between) {
    	$.ajax({
    		url: '<c:url value="/calendarUpdate"/>',
    		type:'POST',
    		data: {id: id, between: between},
    		success:function(){			
    		}
 		});
	};
	function calendarUpdateSize(id, between) {
    	$.ajax({
    		url: '<c:url value="/calendarUpdateSize"/>',
    		type:'POST',
    		data: {id: id, between: between},
    		success:function(){
    		}
 		});
	};
	function selectCalendar(startdate, enddate) {
		$.ajax({
    		url: '<c:url value="/selectCalendar"/>',
    		type:'GET',
    		data: {startdate: startdate, enddate: enddate, cafe:cafe},
    		success:function(data){
    	    	delUpdate = window.open("", "", "width=700px, height=200px");
    	    	delUpdate.document.write(data);
    		}
 		});
	};
/* ========================================================================================================================= 달력끝 채팅 시작 */
	function roomjoin(i){
		var roomlist = "roomlist"+i;
		var roomjoin = "roomjoin"+i;	
		window.open("",roomjoin,"width=500px, height=900px");
	 	var rl = document.getElementById(roomlist);
		rl.submit();
	}
	function roomdelete(roomcodeval) {
		var cafe = $('#cafe').val();
		$.ajax({
			url: '<c:url value ="/roomDelete"/>', // 서버 url
			type: 'POST', //전송방식
			data: {roomcode: roomcodeval, cafe: cafe},
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
			var cafe = $('#cafe').val();
			$.ajax({
				url: '<c:url value ="/roomlist"/>', // 서버 url
				type: 'GET', //전송방식
				data: {cafe : cafe},
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
		var cafe = $('#cafe').val();
			if(subname!=null){
				$.ajax({
					url: '<c:url value ="/roomCreate"/>', // 서버 url
					type: 'POST', //전송방식
					data: {sub: subname, cafe:cafe},
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
		calendarPostLoad();
	});
/*===================================================================================================================================================채팅 끝  */		
	var cafe = $('#cafe').val();
	var cafeAdminWindow;
	function cafeAdminPage(){
		var cafe = $('#cafe').val();
		var tag = "<form id='form1' action=\"<c:url value='/cafeAdminPage'/>\" method='POST' target='popup'>"+
    		"<input type='hidden' name='cafe' value='"+cafe+"'>"+
    		"</form>";
    	$('#cafeAdmin').append(tag);	
    	cafeAdminWindow = window.open("", "popup", "width=700px, height=200px");	//새창열기
    	$('#form1').submit();	//새창에 submit
    	$('#cafeAdmin').empty();	//폼을 지운다. 
	}
	function joinCafe(){
		$.ajax({
			url: '<c:url value ="/joinCafe"/>',
			type: 'POST', 
			data: {cafe: $('#cafe').val()},
			success: function() {
				$('button[name=cafeJoinButton]').remove();
				var tag ="<button type=\"button\" id=\"cafeWritingBoxOpen\" class=\"btn btn-primary\">글쓰기</button>"
				$('#cafeWritingBox').append(tag);
			}
		});
	}
	
	//전체검색기능(bandmain과는 다르니 주의)
	$(function() {
		$('#button-addon2').click(
			function() {
				self.location = "searchall?page=1&perPageNum=10&searchType=tc&keyword="
						+ encodeURIComponent($('#keywordInput').val());
				});
			});


	// 유저 썸네일
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

	/* ====메인사진 */
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "<c:url value='/selectThumbImg'/>",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				if (data != "") {
					data = data.substring(1,data.length);
					$("#fimg").attr("src","<c:url value='/'/>"+data).width(200);
					$("#fimg").attr("src","<c:url value='/'/>"+data).height(200);
					
				} else {
					alert("이게.... 아닌데....")
				}
			}
		})
	});
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    var category = $('#category').val();
	    var cafe = $('#cafe').val();
	    var plc = $('#postLoadCnt').val();
		if(plc == 0)	//불러온글이 없을 때 중복호출을 막는다.
	    	return false;
		//추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가)
	    	var searchtext = $('#searchtext').val(); 
	    	if(searchtext != ""){
	    		calendarPostSearch();
	    		return false;
	    	}
	    	calendarPostLoad();
	    	
	    }
	};
	//일정 목록을 불러옵니다.
	function calendarPostLoad(){
		var postLoadCnt = $('#postLoadCnt').val();
		var cafe = $('#cafe').val()
		var increase = 10;
		var postcd;
		$.ajax({
			url: '<c:url value ="/loadCalendarPost"/>',
			type: 'POST', 
			data: {postLoadCnt : postLoadCnt, cafe:cafe, increase:increase},
			success: function(data) {
				if(data.length == 0 && postLoadCnt ==0){
					var tagList = "<h2>등록된 개시물이 없습니다.</h2>"
					$('#cafeContextlistBox').append(tagList);
					return false;
				}
				$('#cafeContextlistBox').append(data);
				for(var i=1; i<=increase; i++){
					var postObj = $('#calPost'+i);
					if(postObj.val() == undefined){
						break;
					}
					postcd = postObj.val();
					postObj.attr('id', 'postCode');
				}
				postLoadCnt = postcd;
				$('#postLoadCnt').val(postLoadCnt);
			}
		});
	}
	function calendarPostSearchClick(){
		$('#cafeContextlistBox').empty();
		$('#postLoadCnt').val(0);
		calendarPostSearch();
	}
	function calendarPostSearch(){
		var postLoadCnt = $('#postLoadCnt').val();
		var cafe = $('#cafe').val()
		var increase = 10;
		var postcd;
		var searchtext = $('#searchtext').val();
		$.ajax({
			url: '<c:url value ="/searchCalendarPost"/>',
			type: 'POST', 
			data: {postLoadCnt : postLoadCnt, cafe:cafe, increase:increase, searchtext:searchtext},
			success: function(data) {
				if(data.length == 0 && postLoadCnt ==0){
					var tagList = "<h2>등록된 개시물이 없습니다.</h2>"
					$('#cafeContextlistBox').append(tagList);
					return false;
				}
				$('#cafeContextlistBox').append(data);
				for(var i=1; i<=increase; i++){
					var postObj = $('#calPost'+i);
					if(postObj.val() == undefined){
						break;
					}
					postcd = postObj.val();
					postObj.attr('id', 'postCode');
				}
				postLoadCnt = postcd;
				$('#postLoadCnt').val(postLoadCnt);
			}
		});
	}
</script>
</body>
</html>

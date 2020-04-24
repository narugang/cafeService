<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='resources/css/bandmain.css'/>">
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/cafehome.css'/>"> --%>
<meta charset="UTF-8">
<style>
ul {
	list-style: none;
}

body {
	background-color: #eeeeee;
}

.cafehomeLink {
	display: block;
	text-decoration-line: none;
	color: #1d2124;
}

.writeFormBox {
	margin: 0 auto;
	width: 80%;
	padding-top: 10%;
	padding-bottom: 10%;
}

#writeTextarea {
	height: 200px;
	overflow-y: auto;
}

#cafeImage {
	max-width: -webkit-fill-available;
	margin-bottom: 10px;
}

.h7 {
	font-size: 0.8rem;
}

.gedf-wrapper {
	margin-top: 0.97rem;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

.input-group-append {
	padding-right: 10px;
}

.input-group {
	padding-right: 10px;
}

.navbar-nav {
	margin: 0 auto;
}

.col-md-3 {
	text-align: center;
}

#mask {
	position: fixed;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

.window {
	display: none;
	position: absolute;
	left: 100px;
	top: 100px;
	z-index: 10000;
}
</style>
<title>Insert title here</title>
</head>

<body>
	<nav class="navbar navbar-light bg-white">
		<a href="./bandmain" class="navbar-brand" class="navbar-brand"> <input
			type="button" id="mainLogo" name="mainLogo" value=""
			style="margin-top: 0px;">
		</a>


		<div class="headerbar1"
			style="vertical-align: middle; height: 80px; align: left; margin-right: auto;">
			<input type="text" class="form-control"
				aria-label="Recipient's username" aria-describedby="button-addon2"
				value="${scri.keyword}" class="form-control" width="50px"
				id="keywordInput" placeholder="카페 및 게시글 검색"
				style="width: 200px; margin-top: 17px; vertical-align: middle; float: left;" />


			<button class="btn btn-outline-primary" type="button"
				id="button-addon2" value=""
				style="margin-top: 17px; vertical-align: middle;">
				<i class="fa fa-search"></i>
			</button>
		</div>

		<form>

			<!-- 아이콘 -->

			<div class="dropmenu" align="right"
				style="width: 240px; display: inline-block;">
				<div class="dd">
					<input type="button" id="alarm" name="alarm" value="">
					<div class="dd-content">
						<a href="#">새 알림</a> <a href="#">읽은 알림</a>
					</div>
				</div>
				<div class="dd">
					<input type="button" id="msg" name="msg" value="">
					<div class="dd-content">
						<a href="#"
							onclick="window.open('<c:url value='/message'/>',
						'sendMessage', 'top=100px, left=100px, height=700px, width=700px, status=no, toolbar=no')">메세지
							보내기</a> <a href="#" id="moveMessageBox"
							onclick="window.open('<c:url value='/messageBox'/>',
						'sendMessage','top=100px, left=100px, height=600px, width=550px,toolbar=no, menubar=no,status=no,location=no, resizable=no')">메세지
							보관함</a>
					</div>
				</div>
				<div class="dd">
					<input type="image" src="" id="user" name="user" value="">
					<div class="dd-content">
						<a href="<c:url value='/myPage'/>">내 정보</a> <a
							href="<c:url value='/myblist'/>">내 카페</a> <a href="#">설정</a> <a
							href="<c:url value='/logout'/>">로그아웃</a>
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

	<nav
		class="navbar navbar-expand-lg navbar-center navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a
					href="<c:url value="/cafehome?seq=${cafe.seq}"/>" role="button"
					aria-pressed="false" class="nav-link">전체글 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a
					href="<c:url value="/calendar?seq=${cafe.seq}"/>" role="button"
					aria-pressed="false" class="nav-link">일정</a></li>
				<li class="nav-item"><a
					href="<c:url value="/cafemember?seq=${cafe.seq}"/>" role="button"
					aria-pressed="false" class="nav-link">멤버</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<img id="cafeImage" src="<c:url value="/"/>${cafe.image}" alt=""><br>
						<div class="h5">
							<a href="<c:url value="/cafehome?seq=${cafe.seq}"/>"
								class="cafehomeLink">${cafe.title}</a>
						</div>
						<div class="h7 text-muted">${cafe.content}</div>
						<div class="h7">${cafe.address}</div>
						<form id="cafeSeqFrm"
							action="<c:url value="/cafesearchSubContent"/>">
							<c:if test="${countCfmem eq 0}">
								<br>
								<button type="button" name="cafeJoinButton"
									class="btn btn-primary" onclick="joinCafe()">가입하기</button>
							</c:if>
							<c:if test="${cfmemberAuth eq 0}">
								<br>
								<button type="button" name="cafeadminPage"
									class="btn btn-primary" onclick="cafeAdminPage()">카페설정</button>
							</c:if>
							<input type="hidden" name="seq" id="cafe" value="${cafe.seq}">
							<input type="hidden" id="category" value="0">
						</form>
					</div>
					<ul class="list-group list-group-flush">
						<li id="caegory0" class="list-group-item"
							onclick="categoryClick(0)">모든글보기</li>
						<c:forEach var="category" items="${categoryList}" varStatus="i">
							<li id="category${i.count}" class="list-group-item"
								onclick="categoryClick(${category.code})">${category.name}</li>
						</c:forEach>
					</ul>
				</div>
				<br>
				<br>
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
			<div id="cafeAdmin"></div>
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div class="col-md-6 gedf-main">

				<!--- \\\\\\\Post-->
				<div id="cafeSearchBox" class="card gedf-card">
					<div class="card-body">
						<div class="btn-toolbar justify-content-between"
							style="float: left;">
							<form class="form-inline">
								<div class="input-group">
									<input type="text" id="searchtext" class="form-control"
										aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn btn-outline-primary" type="button"
											id="button-addon2" onclick="cafesearchSubContent()">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</form>
							<div id="cafeWritingBox">
								<div id="mask"></div>
								<div class="window"
									style="width: 700px; height: 700px; background-color: #fff;">
									<div class="writeFormBox">
										<form id="writeform" onSubmit="return false;">
											<!-- Form Name -->
											<div class="h3">게시글 작성</div>
											<br>
											<br>
											<!-- Text input-->
											<div class="form-group row">
												<label class="col-sm-2 col-form-label" for="textinput">제목</label>
												<div class="col-sm-10">
													<input id="textinput" name="postsub" type="text"
														class="form-control">
												</div>
											</div>
											<!-- Select Basic -->
											<div class="form-group row">
												<label class="col-sm-2 col-form-label" for="categorySelBox">카테고리</label>
												<div class="col-sm-10">
													<select id="categorySelBox" name="category"
														class="custom-select mr-sm-2">
														<c:forEach var="category" items="${categoryList}">
															<option value="${category.code}">${category.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<!-- Textarea -->
											<div class="form-group row">
												<label class="col-sm-2 col-form-label" for="textarea">글내용</label>
												<div class="col-sm-10">
													<textarea class="form-control" id="writeTextarea"
														name="content">default text</textarea>
												</div>
											</div>

											<!-- File Button -->
											<div class="form-group row">
												<label class="col-sm-2 col-form-label" for="fileidx">파일선택</label>
												<div class="col-sm-10">
													<input type="hidden" id="fileUploadCnt" value="0">
													<input name="fileidx" class="input-file"
														multiple="multiple" type="file">
												</div>
											</div>

											<!-- Button (Double) -->
											<div class="form-group row">
												<label class="col-sm-2 col-form-label" for="button1id"></label>
												<div class="col-sm-10">
													<button class="btn btn-success" onclick="cafeWrite()">작성</button>
													<button class="btn btn-danger" id="close">취소</button>
												</div>
											</div>
										</form>
									</div>
									<input type="hidden" id="postLoadCnt" value="0">
								</div>
								<c:if test="${countCfmem ne 0}">
									<button type="button" id="cafeWritingBoxOpen"
										class="btn btn-primary">글쓰기</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- Post /////-->
				<div id="cafeContextlistBox"></div>
			</div>
			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div class="col-md-3">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">채팅</h5>
						<div style="position: absolute; top: 7px; right: 14px;">
							<button type="button" id="roomcreate">방만들기</button>
						</div>
						<div
							style="overflow: auto; width: 200px; height: 400px; background-color: #ede5ca;"
							id="content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
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
	return false;
})

/* =============================================================================================================채팅 */
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
		var cafe = $('#cafe').val();
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
					/* alert("<c:url value ='/roomjoin'/>"); */
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
		/* =====================================================    ========================================================채팅 */
		cafePostLoadAll(cafe);
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
	    	if(category==0){
				cafePostLoadAll(cafe);
				return false;
			}
			cafePostLoadCategory(category);
	    }
	};
	$(document).ready(function(){ 
		$(document).on('click', '#cafeWritingBoxOpen', function(e){
	           e.preventDefault();
	           wrapWindowByMask();
	       });
	       $('#close').click(function (e) {
	    	   var real = confirm('작성한 글은 저장되지 않습니다. 정말 나가시겠습니까?');
	           if(real){
	        	var category = $('#category').val();
	    	   	e.preventDefault();
	           	$('#mask, .window').hide();
	           	$("#writeform")[0].reset();
	           	$('#categorySelBox').val(category);
	           }
	       });       
	       $('#mask').click(function () {
	       	var real = confirm('작성한 글은 저장되지 않습니다. 정말 나가시겠습니까?');
	           if(real){
	        	var category = $('#category').val();
	        	$(this).hide();
	            $('.window').hide();
	            $("#writeform")[0].reset();
	            $('#categorySelBox').val(category);
	        }
	       });
	});
	//사용자가 게시판 카테고리를 클릭했을때
    function categoryClick(category){	//카테고리 값을 가져온다.
    	var cafe = $('#cafe').val();
    	var plc = $('#postLoadCnt');	//게시글 불러온 숫자를 0으로 바꾼다
    	plc.val('0');
        $('#categorySelBox').val(category);	//글쓰기 폼의 카테고리 변경
        $('#category').val(category);	//글을 불러올때 사용하는 카테고리 번호를 변경
        $('#cafeContextlistBox').empty();	//불러온 게시글을 모두없앤다.
        if(category == 0){	//카테고리의 수정이 없으면 모든글
			cafePostLoadAll(cafe);
			return false;
		}
		cafePostLoadCategory(category);	//카테고리 값이 존재하면 해당 카테고리의 글     
    };
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
	function wrapWindowByMask(){
	       var maskHeight = $(document).height();
	       var maskWidth = $(window).width();  
	       $('#mask').css({'width':maskWidth,'height':maskHeight});  
	       $('#mask').fadeTo("fast",0.8);    
	       $('.window').show();
	   }
	 
	//게시글 추가
	function cafeWrite(e){
		var form = $('#writeform');
		var formData = new FormData(form[0]);
		var cafe = $('#cafe').val();
		var category = $('#category').val(); 
		formData.append('cafe', cafe);
		$.ajax({
			url: '<c:url value ="/writePost"/>',
			type: 'POST', 
			enctype: 'multipart/form-data',
			contentType: false,
			processData: false,
			async:false,
			data: formData,
			success: function(data) {
				$('#cafeContextlistBox').empty();
				$('#postLoadCnt').val(0);
				if(category==0){	//카테고리가 없으면 모든글 불러오기
					cafePostLoadAll(cafe);	
					return false;
				}
				cafePostLoadCategory(category);	//카테고리가 있으면 해당 카테고리글 불러오기
			}
		});
	}
	//모든 게시글 불러오기
	function cafePostLoadAll(cafe){
		console.log('중복 테스트');
		var postLoadCnt = $('#postLoadCnt').val();
		console.log("plc:"+ postLoadCnt);
		var increase = 10;
		var postcd;
		$.ajax({
			url: '<c:url value ="/loadPostAll"/>',
			type: 'POST', 
			data: {postLoadCnt : postLoadCnt, increase: increase, cafe: cafe},
			success: function(data) {
				if(!data && postLoadCnt == 0){
					var tagList = "<h2>등록된 개시물이 없습니다.</h2>"
					$('#cafeContextlistBox').append(tagList);
					return false;
				}
				$('#cafeContextlistBox').append(data);
				for(var i=1; i<=increase; i++){
					var postObj = $('#postCode'+i);
					postcd = postObj.val();
					console.log("postcd: "+postcd);
					postObj.attr('id', 'postCode');
					var footer = $('#card-footer'+i);
					$.ajax({
						url: '<c:url value ="/loadPostFile"/>',
						type: 'POST', 
						data: {postcd :postcd},
						async: false,
						success: function(data) {
							for(file in data){
								console.log(postcd+":"+data.length);
								var tagList = ("<a href=\"<c:url value='/downloadPostFile?idx="+data[file].idx+"'/>\"><div class=\"h7 text-muted\">"+data[file].originalname+"   "+data[file].filesize+"B</div>");								
								footer.append(tagList);
								footer.attr('id', 'postCode');
							}
						}
					});
				}
				console.log("last    postcd: "+postcd);
				postLoadCnt = postcd;
				$('#postLoadCnt').val(postLoadCnt);
			}
		});
		return false;
	}
	//카테고리 별로 게시글 불러오기 
	function cafePostLoadCategory(category){
		var postLoadCnt = $('#postLoadCnt').val();
		var increase = 10;
		var postcd;
		$.ajax({
			url: '<c:url value ="/loadPost"/>',
			type: 'POST', 
			data: {postLoadCnt : postLoadCnt, increase: increase, category: category},
			success: function(data) {
				if(data.length == 0 && postLoadCnt ==0){
					var tagList = "<h2>등록된 개시물이 없습니다.</h2>"
					$('#cafeContextlistBox').append(tagList);
					return false;
				}
				$('#cafeContextlistBox').append(data);
				for(var i=1; i<=increase; i++){
					var postObj = $('#postCode'+i);
					postcd = postObj.val();
					postObj.attr('id', 'postCode');
					var footer = $('#card-footer'+i);
					$.ajax({
						url: '<c:url value ="/loadPostFile"/>',
						type: 'POST', 
						data: {postcd :postcd},
						async: false,
						success: function(data) {
							for(file in data){
								console.log(postcd+":"+data.length);
								var tagList = ("<a href=\"<c:url value='/downloadPostFile?idx="+data[file].idx+"'/>\"><div class=\"h7 text-muted\">"+data[file].originalname+"   "+data[file].filesize+"B</div>");								
								footer.append(tagList);
							}
						}
					});
				}
				postLoadCnt = postcd;
				$('#postLoadCnt').val(postLoadCnt);
			}
		});			
	}
	function cafesearchSubContent(){
		var searchtext = $('#searchtext').val();
		var cafeSeqFrm = $('#cafeSeqFrm');
		cafeSeqFrm.append("<input type='hidden' name='searchtext' value=\""+searchtext+"\">");
		cafeSeqFrm.submit();
	}
	
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
	function updatePostForm(postcd){
		var cafe = $('#cafe').val();
		$.ajax({
			url: '<c:url value ="/updatePostForm"/>',
			type: 'POST', 
			data: {cafe:cafe, postcd:postcd},
			success: function(data)  {
				if($("#postDivUpd").length > 0) 
					
					updateClose();
				$('#postdiv'+postcd).append(data);
				$('#postcdUpd').val(postcd);
			}
		});
	}
	function updateClose(){
		var confirm = window.confirm("작성한 내용은 저장되지 않습니다. 정말 나가시겠습니까?");
		if(confirm)  
			$('#postDivUpd').remove();
	}
	function updatePost(){
		var cafe = $('#cafe').val();
		var postsub = $('#postsubUpd').val();
		var content = $('#contentUpd').val();
		var category = $('#categoryUpd').val();
		var categoryTxt = $('#categoryUpd option:checked').text();
		var postcd = $('#postcdUpd').val();
		$.ajax({
			url: '<c:url value ="/updatePost"/>',
			type: 'POST', 
			dataType: 'json',
			data: {cafe:cafe, code:postcd, postsub:postsub, category:category, content:content},
			success: function(data)  {
				if(data == 0)	//0은 권한이 부족하거나 본인이 아닐경우
					alert("잘못된 접근입니다.");
				alert("수정이 완료되었습니다.");
				$('#postDivUpd').remove();	//수정폼 삭제 
				$('#postsub'+postcd).text(postsub);	//제목변경
				$('#category'+postcd).text(categoryTxt);	//게시판 변경
				$('#content'+postcd).text(content);	//내용변경
			}
		});
	}
	function deletePost(code){
		var cafe = $('#cafe').val();
		var confirm = window.confirm("정말 삭제하시겠습니까?");
		if(!confirm)
			return false;
		$.ajax({
			url: '<c:url value ="/deletePost"/>',
			type: 'POST', 
			dataType: 'json',
			data: {cafe:cafe, code:code},
			success: function(data)  {
				if(data == 0)	//0은 권한이 부족하거나 본인이 아닐경우
					alert("잘못된 접근입니다.");
				alert("삭제 되었습니다.");
				$('#postdiv'+code).remove();	//수정폼 삭제 
			}
		});
	}
	var boardPrepPage;
	function boardPrep(code) {
		boardPrepPage = window.open("<c:url value='/boardPrepPage?code="+code+"'/>", "", "width=900px, height=550px");
	}
	
</script>
	<footer> </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!--부트스트랩-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!--부트스트랩js-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value='resources/css/bandmain.css'/>">
<style type="text/css">
body { 
background: #eeeeee;
background-size: contain;
}
.nav {
  float: left;	
  width: 100px;
  height: 130px;
  color: #fff;
}

ul{
   list-style:none;
   }
.blistcontainer{
 	width: 450px; 
 	float: left;
 	font-color: black;	
}      
.content-list{
  	display: inline-block; 
  	width: 300px; 
  	white-space: nowrap; 
  	overflow: hidden; 
  	text-overflow: ellipsis;
	white-space: normal; 
	line-height: 1.3; 
	height: 3.6em;
}
</style>
<script>
$(document).ready(function() {
	$.ajax({
		type : "POST",
		url : "<c:url value='/selectThumbImg'/>",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			if (data != "") {
				data = data.substring(1,data.length);
				var userImg = $("#user").attr("src","<c:url value='/'/>"+data);
				userImg.width(40);
				userImg.height(40);
			} else {
				alert("이게.... 아닌데....")
			}
		}
	})
})

$(function() {
	$('#button-addon2').click(
		function() {
			self.location = "searchall?page=1&perPageNum=10&searchType=tc&keyword="
					+ encodeURIComponent($('#keywordInput').val());
			});
		});
$(".hover").mouseleave(
	  function () {
	    $(this).removeClass("hover");
	});
	
$(document).ready(function(){
    $("input[id=keywordInput]").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            searchall();
        }
    });
    searchall = function (){
        //검색 찾는 로직 구현
    	self.location = "searchall?page=1&perPageNum=10&searchType=tc&keyword="
			+ encodeURIComponent($('#keywordInput').val());
    }; 
});
</script>
</head>
<body>
<nav class="navbar navbar-light bg-white">
            <a href="./bandmain" class="navbar-brand" class="navbar-brand">
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

	<div class="container" style=" height: 2230px;">
		<div id="left"></div>
		<div id="center"></div>
		<div id="right"></div>
		
		<hr> <!--header-->
		<br>
		<h2>내 목록</h2>
		<div style=" height: 500px;">
			<div align="right" class="col-md-offset-3">
					<a href="<c:url value='/myblist'/>"  style="color:black; text-decoration:none;">내 카페 전체 ></a>
			</div>
			<br>
			<div id = "side_left">
			<div class="sample_image">
				<form action="./createband3">
					<input type="submit" id="createband" name="createband"
								value="" style="cursor: pointer;">
					</form>
			</div>
			<div class="sample_image">	
						<form action="./bandguide1">
							<input type="submit" id="guideband" name="guideband"
										value="" style="cursor: pointer;">
						</form>
			</div>
		</div>	
		 <c:set var="i" value="0" />
 		<c:set var="j" value="3" />
		 <table border=0>
		
		<c:forEach items="${myblist}" var="myblist"  begin="0" end="5" >
			
			 <c:if test="{i%j == 0}">
			 <tr>
     		 </c:if><td>
			<figure class="snip1361" id="tocafe">
  			<img src="<c:url value=" ${fn:substring( myblist.image,1,999) }"/>"  alt="sample45"  style="height: 200px; align: center;"/>
  				<figcaption>
    				<h3><c:out value="${myblist.title}" /></h3>
    				<p><c:out value="${myblist.content}" /></p>
  				</figcaption>
  			<a href="<c:url value='/cafehome?seq=${myblist.seq}' />"></a>
			</figure> 
			</td> 
    		
    		<c:if test="${i%j == j-1}">
    		</tr> 
    		</c:if> 
   			<c:set var="i" value="${i+1}" />
   			
		</c:forEach>
		
		</table>
		</div>
		<hr>
		<br> <br>
		<h2>최신 글 목록</h2>
			<div align="right" class="col-md-offset-3">
				<a href="<c:url value='/list'/>"  style="color:black; text-decoration:none;">게시물 전체 검색 ></a>
			</div>
		<br>
		<section id="container">
		<form role="form" method="get">
			<table class="table table-hover" >
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${list}" var="list" varStatus="i">
					<tr>
						<td><c:out value="${i.count}" /></td>
						<td ><a href="<c:url value='/cafehome?seq=${list.cafe}' />">
						<c:out value="${list.postsub}" /></a></td>
						<td><c:out value="${list.nic}" /></td>
						<td><fmt:formatDate value="${list.writedt}" pattern="yyyy-MM-dd"/></td>
						<td><c:out value="${list.viewcnt}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		</section>
		<br> <br> <br>
		
		<!-- 테스트 -->
		<div class="frame">
		<header><h2>카페 목록</h2></header>
		<div align="right" class="col-md-offset-3">
			<a href="<c:url value='/blist'/>"  style="color:black; text-decoration:none;">카페 전체 검색 ></a>
		</div>
			<hr />
			<div id= "mainblist">
				<div class="inblist1" >
				
				<c:forEach items="${blist}" var="blist" varStatus="status">
					<c:if test="${status.count < 11}">
						<div class="blistcontainer"> <a href="<c:url value='/cafehome?seq=${blist.seq}' />"  style="color:black; text-decoration:none;">
							<div class="nav">
        							<img src="<c:url value=" ${fn:substring( blist.image,1,999) }"/>"  style="width:100px;  height: 100px;"/>
    						</div>
    						 <div class="content">
    						 	<ul class="content-list">
    						 		<li class="content-item">
										<strong><c:out value="${blist.title}" /></strong></li>
									<li><c:out value="${blist.content}" /></li>
    						 	</ul>
    						 	<ul>
    						 	<li>&nbsp;오픈일: <c:out value="${blist.regdate}" /></li>
								<li>&nbsp;방문수: <c:out value="${blist.cnt}" /></li>
    						 	</ul>
    						 	
     						</div>
     						</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<br> <br> <br> 
	</div>
		<br> <br>
</div>	
</body>
</html>
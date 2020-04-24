<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

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
li {
	list-style: none; 
	float: left; 
	padding: 6px;
}
body { 
	background: #eeeeee;
	background-size: contain;
}	
li.presentpage {
font: strong;
}
ul#pagination{
display:table;
margin:0 auto;
}
</style>
<title>전체 게시판 목록</title>
<script >
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
$(function() {
	$('#button-addon2').click(
		function() {
			self.location = "searchall?page=1&perPageNum=10&searchType=tc&keyword="
					+ encodeURIComponent($('#keywordInput').val());
			});
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
$(document).ready(function(){
    $("input[id=keywordInput1]").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            search();
        }
    });
    search = function (){
        //검색 찾는 로직 구현
    	self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput1').val());
    }; 
});
</script>		
</head>
	<body>
		<nav class="navbar navbar-light bg-white">
            <a href="./bandmain"class="navbar-brand" class="navbar-brand">
           	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px;">
 </a>
          <div class = "headerbar1" style=" vertical-align: middle; height: 80px; align: left; margin-right: 1250px;">
		<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" 
				value="${scri.keyword}" class="form-control" width="50px" id="keywordInput" placeholder="카페 및 게시글 검색"
				 style="width: 200px;  margin-top: 17px; vertical-align: middle; float: left; "/>
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
			<div class="container">
			<section id="container">
				<br>
				<h1>전체 게시판</h1>
				<br>
				<form role="form" method="get" >
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
					<br>
					<div class="col-md-offset-3">
						<ul class="pagination" id="pagination">
							
							<c:if test="${pageMaker.cri.page != pageMaker.startPage}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.cri.page - 1)}">이전</a></li>
							</c:if>
							
							
							<c:forEach begin="${pageMaker.startPage}" end="${(pageMaker.cri.page) - 1}" var="idx" >
								 <li id="presentpage"<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li> 
							</c:forEach>
							
							<c:forEach begin="${pageMaker.cri.page}" end="${pageMaker.cri.page}" var="idx" >
								 <li id="presentpage"<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								${idx}</li> 
							</c:forEach>
							
							
							<c:forEach begin="${(pageMaker.cri.page) + 1}" end="${pageMaker.endPage}" var="idx" >
								 <li id="presentpage"<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li> 
							</c:forEach>
							
							<c:if test="${pageMaker.cri.page != pageMaker.endPage}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.cri.page + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
					
					<!-- seach -->
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						    </select>
				    </div>
				    <div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput1" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn1" type="button" class="btn btn-outline-primary">
										 <i class="fa fa-search"></i>
									</button> 	
								</span>
						</div>
					</div> 
				<br> <br> <br>
    <script>
      $(function(){
        $('#searchBtn1').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput1').val());
        });
      });   
    </script>
  </div>
				</form>
			</section>
		</div>
	</body>
</html>

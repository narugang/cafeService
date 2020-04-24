<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="jquery-2.2.4.js"></script>
<title>Insert title here</title>
		
 <style>
 
 .container1 {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: 0px;
}
 
@media (min-width: 1200px) {
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

@media (min-width: 1200px) {
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
}

 input#alarm {
background:url(alarm1.jpg);
background-repeat: no-repeat;
width:40px;
height:40px;
border: 0;
}
 input#msg {
background:url(msg1.jpg);
background-repeat: no-repeat;
width:40px;
height:40px;
border: 0;
} 
input#chat {
background:url(chat1.jpg);
background-repeat: no-repeat;
width:40px;
height:40px;
border: 0;
}
 input#user {
background:url(user1.jpg);
background-repeat: no-repeat;
width:40px;
height:40px;
border: 0;
}

 input#createband {
background:url(createband.jpg);
background-repeat: no-repeat;
width:194px;
height:210px;
border: 4px dashed #bcbcbc;
action: ./band/createband3;
}

 input#guideband {
 margin-left:50px;
background:url(guide11.jpg);
background-repeat: no-repeat;
width:194px;
height:210px;
border: 4px dashed #bcbcbc;
}

 

 form{display:inline}
 
.db {
	background-color: Fuchsia;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dd {
	position: relative;
	display: inline-block;
}

.dd-content {
	right: 0px;
	display: none;
	position: absolute;
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

 </style>   
    
<script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
 </script>
    
</head>
<body>
 <div class="container">
 
 
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
</div>
<div id="left">
	
</div>
<div id="center">
</div>
<div id="right">
</div>
 
<h1 align="center"> <!-- h1 사이즈로 내용 출력  -->
밴드 메인
</h1>
<br><br>
<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>
    </div>
    
    <div class="col-xs-10 col-sm-10">
		<div class="input-group">
			<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
				<span class="input-group-btn">
					<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
				</span>
		</div>
	</div>
    
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
  

<br><br>


			
<h2>게시글 검색결과</h2>
			
			<hr />
			
			<section id="container">
				<form role="form" method="get" >
					<table class="table table-hover">
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.seq}" /></td>
								<td>
									<a href="/board/readView?bno=${list.seq}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.cnt}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					
					
					
		<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
			
        <br><br>
        
        <h2>밴드 검색결과</h2>
			
			<hr />
			
			
				<form role="form" method="get" >
					<table class="table table-hover">
						<tr><th>번호</th><th>제목</th><th>등록일</th><th>조회수</th></tr>
						
						<c:forEach items="${blist}" var = "blist">
							<tr>
								<td><c:out value="${blist.seq}" /></td>
								<td>
									<a href="/band/blist?bno=${blist.seq}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${blist.title}" /></a>
								</td>
								
								<td><fmt:formatDate value="${blist.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${blist.cnt}" /></td>
							</tr>
						</c:forEach>
						
					</table>
					
					
					
		<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="blist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="blist${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="blist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			
        
</div>


</body>
</html>
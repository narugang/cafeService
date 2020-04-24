<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery-2.2.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
		
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>	
		

      <style type="text/css">
         /* 기본 설정*/
         a{text-decoration:none; color:#000000;}         
         a:hover{color:#ff0000;}                    
         
         /* nav tag */
         nav ul{padding-top:10px;
         float:right;}                     /*  상단 여백 10px  */
         nav ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solid #999;             /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
            font:bold 12px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;                         /* 각 메뉴 간격 */
        }
         nav ul li:first-child{border-left:none;}     /* 메뉴 분류중 제일 왼쪽의 "|"는 삭제       
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">

 function keyword_check(){

  if(document.search.keyword.value==''){ //검색어가 없을 경우  

  alert('검색어를 입력하세요'); //경고창 띄움 

  document.search.keyword.focus(); //다시 검색창으로 돌아감 

  return false; 

  }

  else return true;

 }

 
 
 
 
</script>
    
 <style>
 
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
 margin-left:50px;
background:url(createband.jpg);
background-repeat: no-repeat;
width:194px;
height:210px;
border: 4px dashed #bcbcbc;
}

 input#guideband {
 margin-left:50px;
background:url(guide11.jpg);
background-repeat: no-repeat;
width:194px;
height:210px;
border: 4px dashed #bcbcbc;
}

 input#search {
 margin-left: 100px;
background-repeat: no-repeat;
}

 .dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
 
 
 
 
 
 </style>   
    

</head>
<body>

<h1 align="CENTER"> <!-- h1 사이즈로 내용 출력  -->

게시물 검색

</h1>



<form name = "icon" align="right"  style="margin-right: 50px">

<div class="dropdown">

<input type="button" id="alarm" name="alarm" value="">

<!-- Indicates a successful or positive action -->
<input type="button" id="msg" name="msg" value="">

<!-- Contextual button for informational alert messages -->
<input type="button" id="chat" name="chat" value="">

<!-- Indicates caution should be taken with this action -->
<input type="button" id="user" name="user" value="">
 <div class="dropdown-content">
    <a href="#">홈</a>
    <a href="#">회사소개</a>
    <a href="#">제품소개</a>
    <a href="#">오시는길</a>
  </div>

</div>
<br>
</form>

<br> 
<br>

 <div class="container">
			<header>
				<h1> 검색 결과</h1>
			</header>
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
          self.location = "searchband" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
					
		<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="searchband${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="searchband${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="searchband${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>
			</section>
		</div>




</body>
</html>
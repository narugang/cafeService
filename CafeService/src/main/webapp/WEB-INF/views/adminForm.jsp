<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--부트스트랩-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!--부트스트랩js-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
        crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
table {
	width: 20%;
}
td {
	width: 20%;
}
table, tr, td {
	border : 1px solid black;
}
li {list-style: none; float: left; padding: 6px;}
body {background: #eeeeee; background-size: contain;}	
div#col-md-offset-3{text-align: center;	margin:0;}
ul#pagination{display: table;text-align: center;margin:0 auto;}
.container {
	background: #fff;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	border-radius:25px;
	margin-top : 30px;
	margin-bottom : 30px;
	padding-bottom: 30px;
}	
input#mainLogo {
	background: url(/cafeService/resources/img/bandmainLogo_adminForm.jpg);
	background-repeat: no-repeat;
	width: 500px;
	height: 120px;
	border: 1.5px solid #007bff;
	border-radius:15px;
}
#a_link_list{
	display: flex;
	flex-wrap: wrap;
	padding: 30px;
	justify-content: center;
	border-bottom: 0.5px solid #eeeeee;
}
#admin_header_title{
	padding: 20px;
	border-bottom: 0.5px solid #eeeeee;
	text-align: center;
}
#a_link_target{
	background-color: #007bff;
	text-align: center;
	border-radius: 5px;
	padding: 10px;
	margin-right: 20px;
}
h4 a {
	color: #fff;
}
a:hover {
	text-decoration: none;
}
#category_List{
	display: flex; 
	flex-wrap: wrap;
}
#category_pocket{
	background-color : #eeeeee;
	/* color:#007bff; */
	margin: 10px;
	padding:5px;
	border-radius: 5px;
}
#category_List_title{
	margin: 20px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${authInfo.auth.equals('S1') }">
			<!-- 헤더[S] -->
			<nav id="header_logo_section" class="navbar navbar-light bg-white">
		    	<a href="./bandmain"class="navbar-brand" class="navbar-brand">
		        	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px; cursor:pointer;">
		 		</a>
			</nav>
			<!-- 헤더[E] -->
			<div class="container">
				<div id="admin_header_title">
					<h2>관리자 페이지</h2>
				</div>
				<div id="a_link_list">
						<h4 id="a_link_target"><a href="<c:url value='/cateMake'/>">관심사 등록하기</a></h4>
						<h4 id="a_link_target"><a href="<c:url value='#'/>">신고 관리</a></h4>
						<h4 id="a_link_target"><a href="<c:url value='/bandmain'/>">메인 페이지</a></h4>
						<h4 id="a_link_target"><a href="#" onclick="window.open('<c:url value='/messageAdmin'/>','sendMessage', 'top=100px, left=100px, height=700px, width=700px, status=no, toolbar=no')">공지 쪽지 보내기</a></h4>
				</div>
				<div>
					<div id="category_List_title">
						<h3>Category List</h3>
					</div>
					<div id="category_List">
						<c:forEach var="cateMake" items="${cateMakes}" varStatus="status">
							<div id="category_pocket">
								<b>카테고리</b> : ${cateMake.intercate }
									<b>이름</b> : ${cateMake.intername }								
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container">
				<h3>잘못 된 접근입니다.</h3>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
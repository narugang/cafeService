<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<style type="text/css">
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
#category_title, #category_Location {
	padding : 20px;
	border-bottom: 0.5px solid #eeeeee;
}
</style>
<title>카테고리(관심사) 생성 페이지</title>
</head>
<body>
	<nav id="header_logo_section" class="navbar navbar-light bg-white">
		<a href="<c:url value='/adminForm'/>" class="navbar-brand" class="navbar-brand">
			<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px; cursor:pointer;">
		</a>
	</nav>
	<div class="container">
		<form onsubmit="check()">
			<div id="category_title">
				<h3>카테고리 생성</h3>
			</div>
			<div id="category_Location">
				<label class="intername">관심사 이름<br>
					<input type="text" id="intername" class="intername" name="intername"/>
				</label>
				<div id="alert_interName">
					관심사를 입력해주세요
				</div>
			<br><br>
			<label class="intercate">관심사 카테고리<br>
				<input type="text" id="intercate" class="intercate" name="intercate"/>
			</label>
			<div id="alert_interCate">
					카테고리를 입력해주세요
			</div>
				<input type="button" id="create_Inter" class="btn btn-primary" value="등록"/>
			</div>
		</form>
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
</body>
<script>
var interName = false;
var interCate = false;
$("#alert_interName").hide();
$("#alert_interCate").hide();
function check(){
	if($("#intername").val()==""){
		$("#alert_interName").show();
		return false;
	}
	if($("#intercate").val()==""){
		$("#alert_interCate").show();
		return false;
	}
}

$("#create_Inter").click(
	function(){
		var intername = $("#intername").val()
		var intercate = $("#intercate").val()
		
		$.ajax({
			url : "<c:url value='/cateMake'/>",
			type : "POST",
			data : {
				"intername" : intername,
				"intercate" : intercate
			},
			success : function(data) {
				if (data == "1") {
					alert("카테고리 등록 완료")
					window.location.reload();
				} else if(data == "0") {
					alert("카테고리 등록 실패")
				}
			}
		}); // ajax
	});
</script>
</html>
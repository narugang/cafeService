<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
table {
	border: 0px solid #444444;
	 border-collapse:separate;

    border-spacing:20px;
  }
th, td {
    border: 1px solid #444444;
  }

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
  
</style>
<script type="text/javascript">
	function CheckForm(Join) {
		//체크박스 체크여부 확인 [동일 이름을 가진 체크박스 여러개일 경우]
		var isinteChk = false;
		var arr_inte = document.getElementsByName("inte");
		for (var i = 0; i < arr_inte.length; i++) {
			if (arr_inte[i].checked == true) {
				isinteChk = true;
				break;
			}
		}
		if (!isinteChk) {
			alert("관심사를 한개 이상 선택해주세요.");
			return false;
		}
	}
	function count_ck(obj) {
		var intebox = document.getElementsByName("inte");
		var inteCnt = 0;
		for (var i = 0; i < intebox.length; i++) {
			if (intebox[i].checked) {
				inteCnt++;
			}
		}
		if (inteCnt > 3) {
			alert("관심사는 최대 3개 까지 고를 수 있습니다");
			obj.checked = false;
			return false;
		}
	}
	
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
    
   <div class="container">
   <br>
	<h1 align="CENTER">만들고 싶은 모임을 선택하세요</h1>
	<br>
	<h4 align="CENTER">관심사는 복수 선택이 가능합니다 (최대 3개)</h4>
	<form name="frmJoin" action="./createband4"
		onSubmit="return CheckForm(this)" align="CENTER">
		<br /> <br />
		<table align= "CENTER" cellspacing= "20">
			<tr>
			<c:forEach var="cateMake" items="${cateMakes}" >
				<c:if test="${cateMake.intercd%3==1}">
				<tr>
				</c:if>
				<td>${cateMake.intername } <input type="checkbox" name="inte"
					onClick="count_ck(this);" value="${cateMake.intercd }">
					<input type="hidden" name="intName" value="${cateMake.intername }">					
				</td>
				</c:forEach>
			</tr>
		</table>
		<br> <div align="center"><input type="button" value="뒤로" onclick="history.back()"
			align="CENTER" /> &nbsp;&nbsp;
			<input type="submit" value="확인" align="CENTER" ></div>
	</form>
	<br> <br>
	</div>
	
</body>
</html>
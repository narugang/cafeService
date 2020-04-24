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
 input#bandguide3 {
background:url(/cafeService/resources/img/guide3.jpg);
background-repeat: no-repeat;
width:797px;
height:798px;
border: 1px ;
cursor: pointer;
align: CENTER;
}

body { 
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


<div class="container" >
<form   action ="./bandguide4" align="CENTER">
<input type="submit"  id="bandguide3" name="bandguide3" value="" >
</form></div>

</body>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bandguide3</title>
<style>
 input#bandguide3 {
background:url(/cafeService/resources/img/guide3.jpg);
background-repeat: no-repeat;
width:797px;
height:798px;
border: 1px ;
cursor: pointer;
}
</style>
</head>
<body>

<form   action ="./bandguide4" align="CENTER">
<input type="submit"  id="bandguide3" name="bandguide3" value="" >
</form>

</body>
 --%>
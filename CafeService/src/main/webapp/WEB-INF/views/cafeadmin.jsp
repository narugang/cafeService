<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
input#mainLogo {
	background: url(/cafeService/resources/img/cafeAdminLogo.jpg);
	background-repeat: no-repeat;
	width: 500px;
	height: 105px;
	border: 1.5px solid #007bff;
	border-radius:15px;
	text-align: center;
}
#header_logo_section{
	place-content: center;
    padding-bottom: 0px;
    padding-top: 0px;
}
.container {
	background: #fff;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	border-radius:25px;
	margin-top : 30px;
	margin-bottom : 30px;
    padding-top: 30px;
	padding-bottom: 30px;
}
body {background: #eeeeee; background-size: contain;}

.cafe{
	width: 70px;
    text-align: center;
}
.cafe_btn_area{
	text-align: center;
	border-bottom: 0.5px solid #eeeeee;
    padding-bottom: 15px;
}
.category_list_area {
	display: flex;
	background-color: #007bff;
	border-radius: 5px;
    margin: 10px;
    padding: 10px;
}
.checkbox_location{
	place-self: center;
    margin-right: 5px;
}
.board_category_title {
	text-align: left;
	padding-left: 10px;
}
.cafe_prepArea_title {
	text-align : left;
	padding-top : 15px;
	padding-left: 10px;
}
#prepTitle{
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
#prepBoardList{
	display: flex;
	flex-wrap: wrap;
	margin-left: 50px;
}
#numPrep,#reasonPrep,#contextPrep,#datePrep{
	background-color: #eeeeee;
	color: black;
	padding: 10px;
	margin-left:10px; 
	margin-right: 10px;
}
#reasonPrep,#contextPrep{
	padding-left:50px;
	padding-right:50px;
}
#contextPrep{
	padding-left:70px;
	padding-right:70px;
}
#datePrep {
	padding-left:20px;
	padding-right:20px;
}
#prepNum, #prepReaseon, #prepContext, #prepDate{
	margin: 10px;
	background-color: #eeeeee;
}
#prepReaseon{
	margin-left:35px;
}
#prepContext{
	margin-left:55px;
}
#prepDate{
	margin-left: 55px;
}
</style>
<title>업데이트</title>
</head>

<!-- [변경사항] header 추가 / container추가 / 해당 css속성들 추가 / 
	body속성 onresize추가 / checkbox area(div)추가 + css / 게시판 신고내역 관리 추가 + 해당 속성(css)추가  -->

<body onresize="parent.resizeTo(800,1000)" onload="parent.resizeTo(800,1000)">
	<!-- 헤더[S] -->
	<nav id="header_logo_section" class="navbar navbar-light bg-white">
		<a href="./bandmain"class="navbar-brand" class="navbar-brand">
	       	<input type="button" id="mainLogo" name="mainLogo" value="" style ="margin-top: 0px; cursor:pointer;">
		</a>
	</nav>
	<!-- 헤더[E] -->
	<div class="container">
		<div id="date" style="overflow-x:hidden; width:100%; height:80%;">
		<div class="board_category_title"><h3>게시판 관리</h3></div>
		<input type="hidden" id="cafe" value="${cafe}">
		<input type="hidden" id="categoryListCnt" value="${fn:length(categoryList)}">
		<c:forEach var="category" items="${categoryList}" varStatus="i">
			<div id="list${i.index}" class="category_list_area">
			<div class="checkbox_location">
				<input type="checkbox" name="del" value="${i.index}" class="cafeAdmin_Checkbox">
			</div>
				<form action="/updateCategory"  id ="${i.index}" name="unchange" onsubmit="return checkmodi(${i.index});" method="POST">
					<input type="hidden" name="code" id="code${i.index}" value="${category.code}">
					<input type="text" name="name" class="name" value="${category.name}">
					<input type="text" name="cafe" class="cafe" value="${category.cafe}">
				</form>			
			</div>
		</c:forEach>
		</div>
		<div class="cafe_btn_area">
			<input type="button" class="btn btn-primary" value="추가" onclick="insertCategory()">
			<input type="button" class="btn btn-warning" value="수정" onclick="updateCategory()">
			<input type="button" class="btn btn-danger" value="삭제" onclick="deleteCategory()">		
		</div>
		<div class="cafe_prepArea">
			<div class="cafe_prepArea_title">
				<h4>게시글 신고내역 관리</h4>
			</div>
			   <div id="prepTitle">
            <div id="numPrep">신고 번호</div>
            <div id="reasonPrep">신고 사유</div>
            <div id="contextPrep">신고 내용</div>
            <div id="datePrep">신고 날짜</div>
         </div>
            <c:forEach var="prepBoard" items="${prepboard}" varStatus="status">
               <div id="prepBoardList">
                  <div id="prepNum">
                     <c:out value="${prepBoard.postnum}"/>            
                  </div>
                  <div id="prepReaseon">
                     <c:out value="${prepBoard.prepreason}"/>            
                  </div>
                  <div id="prepContext">
                     <a href="#" class="viewContext" id="${status.index }">내용 보기</a><%-- $("#prepContext"+${status.index} --%>
                  </div>
                  <div id="prepDate">
                     <fmt:formatDate value="${prepBoard.prepdate}" pattern="yyyy-MM-dd"/>
                  </div>
                     <div id="prepContext${status.index }" style="display: none;">
                        <c:out value="${prepBoard.prepcontext}"/>
                        <input type="button" id="prep_btn${status.index }" class="${prepBoard.postnum}" value="게시글 삭제" style="display: none;">
                        
                     </div>
               </div>
            </c:forEach>
      </div>
   </div>
<script type="text/javascript">
function insertCategory(){
	var name = window.prompt('카테고리 이름을 입력해 주세요');
	var categoryListCnt = $('#categoryListCnt').val();
	var cafe = $('#cafe').val();
	$.ajax({
		url: '<c:url value ="/insertCategory"/>', 
		type: 'POST',
		data: {name:name, cafe:cafe},
		success: function(data) {
			if(data == 1){
				alert('비정상적인 접근입니다.');
				return false;
			}
			alert(categoryListCnt);
			categoryListCnt = (categoryListCnt*1)+1;
			var tag = "<div id=\"list"+categoryListCnt+"\"><input type=\"checkbox\" name=\"del\" value=\""+categoryListCnt+"\">"+
			"<form action=\"/updateCategory\"  id =\""+categoryListCnt+"\" name=\"unchange\" onsubmit=\"return checkmodi("+categoryListCnt+");\" method=\"POST\">"+
			"<input type=\"hidden\" name=\"code\" id=\"code"+categoryListCnt+"\" value=\""+data+"\"><input type=\"text\" name=\"name\" value=\""+name+"\">"+
			"<input type=\"text\" name=\"cafe\" value=\""+cafe+"\"></form></div>"
			$('#date').append(tag);
			alert(categoryListCnt);
		}
	});
}

var queryString;
var idarray = new Array();
$(document).on("propertychange keyup paste", 'form[name=unchange]', function (e){	//폼으로 개별 추가된 개시판 정보들이 변경되었을 떄 
	console.log('감지');	
	$(this).attr('name', 'change');	//변경되었음을 name을 이용하여 표현하고
	console.log($(this).attr('id'));	
	idarray.push($(this).attr('id'));	//idarray에 form의 id값을 추가한다.
});
function updateCategory(){
	console.log(idarray.length);
	for(var i =0 ; i<idarray.length ; i++){
			queryString +=('&'+$('#'+idarray[i]).serialize()); //idarray에 저잘해 놓은 폼의 id 값을 이용해  form들을 serialize해서 queryString으로 저장한다.
			console.log(queryString);
	}
	$.ajax({
		url: '<c:url value ="/updateCategory"/>', 
		type: 'POST',
		data: queryString,
		success: function(data) {
			if(data == 1){
				alert('비정상적인 접근입니다.');
				return false;
			}
		}
	});
	
}
function deleteCategory(){
	var result = new Array();
	var clean = new Array();
	var cafe = $('#cafe').val();
	
	console.log(result.length);
	$("input:checkbox[name=del]").each(function() {
		if(this.checked == true){
			clean.push(this.value);
			var current = 'code'+this.value;
			var code = $('#'+current).val();
			console.log(code);
			result.push(code);	// category의 code값 
		}
	});
	$.ajax({
		url: '<c:url value ="/deleteCategory"/>', 
		type: 'POST',		
		traditional:true,
		data: {code: result, cafe:cafe},
		success: function(data) {
			if(data == 1){
				alert('비정상적인 접근입니다.');
				return false;
			}
			var leng = clean.length;
			for(var i = 0;i < leng; i++){
				$('#list'+clean[i]).remove();	//div(체크박스+Dto하나 단위의 폼정보) 삭제
			}
			var categoryListCnt = $('#categoryListCnt').val()-leng;
			$('#categoryListCnt').val(categoryListCnt);
		}
	});
}

$(".viewContext").on("click",function(event){
	   event.preventDefault();
	     
	   var num = $(this).attr("id")
	   console.log(num);
	   if($("#prepContext"+num).text() ==""){
	      alert("내용이 없습니다.")
	   }
	   if($("#prepContext"+num).text() !=""){
	      $(this).attr("style","display:flex;")
	      $("#prepContext"+num).slideToggle();
	      $("#prep_btn"+num).attr("style","display:block;")
	      
	      $("#prep_btn"+num).click(function(){
	         console.log($(this).attr("class"))
	         
	        /*  $.ajax({
	            url: '<c:url value ="/updateCategory"/>', 
	            type: 'POST',
	            data: queryString,
	            success: function(data) {
	               if(data == 1){
	                  alert('비정상적인 접근입니다.');
	                  return false;
	               }
	            }
	         }); */
	         
	      })
	   }
	});

</script>
</body>
</html>

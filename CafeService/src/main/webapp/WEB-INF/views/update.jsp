<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트</title>
</head>
<body>
	<div id="date" style="overflow-x:hidden; width:100%; height:80%;">
		<c:forEach var="calendar" items="${calendarDto}" varStatus="i">
			<div id="list${i.index}">
				<input type="checkbox" name="del" value="${i.index}">
				<form action="/updateCalendarList"  id ="${i.index}" class="unchange" onsubmit="return checkmodi(${i.index});" method="POST">
					<input type="hidden" name="code" id="code${i.index}" value="${calendar.id}">
					<input type="text" name="title" value="${calendar.title}">
					<input type="date" name="start" value="${calendar.start}">
					<input type="date" name="end" value="${calendar.end}">
					<input type="text" name="color" value="${calendar.color}">
				</form>			
			</div>
			<br>
		</c:forEach>
	</div>
	<input type="button" value="수정" onclick="submit()">
	<input type="button" value="삭제" onclick="delCalendar()">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var queryString;
var idarray = new Array();
$(document).on("propertychange keyup paste", '.unchange', function (e){
	console.log('감지');
	$(this).attr('class', 'change');
	console.log($(this).attr('id'));
	idarray.push($(this).attr('id'));
});
function submit(end){
	console.log(idarray.length);
	for(var i =0 ; i<idarray.length ; i++){
			queryString +=('&'+$('#'+idarray[i]).serialize());
			console.log(queryString);
	}
	$.ajax({
		url: '<c:url value ="/updateCalendarList"/>', 
		type: 'POST',
		data: queryString,
		success: function() {
			console.log('성공');
			window.opener.$("#calendar").load(window.opener.location.reload());
		}
	});
	
}
function delCalendar(){
	var result = new Array();
	var clean = new Array();
	var date = document.getElementById('date');
	console.log(result.length);
	$("input:checkbox[name=del]").each(function() {
		if(this.checked == true){
			clean.push(this.value);
			var current = 'code'+this.value;
			var code = $('#'+current).val();
			result.push(code);
		}
	});
	$.ajax({
		url: '<c:url value ="/calendarDelete"/>', 
		type: 'POST',		
		traditional:true,
		data: {result: result},
		success: function() {
			var leng = clean.length;
			for(var i = 0;i < leng; i++){
				$('#list'+clean[i]).remove();
			}
			window.opener.$("#calendar").load(window.opener.location.reload());
		}
	});
}
</script>
</body>
</html>

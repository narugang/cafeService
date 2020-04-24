<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).on('click', '.deldate', function(){
		console.log('del');
		var dsda = $(this);
		console.log(dsda);
		$(this).parent().remove();
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value ='/calendarInput'/>" method="POST" id="calendarSubmit">
		<p><input type = "date" id="startdate">&nbsp;<input type = "time" id="starttime"><br>
		<input type = "date" id="enddate">&nbsp;<input type = "time" id="endtime">&nbsp;&nbsp;
		<input type="button" id="input" value="추가" onclick="insert();"></p>
		<div id="startEnd" style="overflow-x:hidden; width:350px; height:200px;">
		</div>
		<P>
			<label>색상 선택: </label><input type="color"  name="color" value="#6495ED">&nbsp;&nbsp;
			<input type="button" value="드래그&클릭" onclick="dragClick();">
			<input type="hidden" value="false" id="onDragClick">
		</P> 
		<P><input type="text" name="title"></P>
		<P><textarea name="contxt" cols="50" rows="10"></textarea></P>
		<P>
			<input type="submit" value="확인">
			<input type="button" value="나가기">
		</P>	
	</form>
<script>
function insert(){
	var startdate = $('#startdate').val();
	var starttime = $('#starttime').val();
	var enddate = $('#enddate').val();
	var endtime = $('#endtime').val();
	var tag = $("<p><div><input type='date' name='startdate' value="+startdate+">&nbsp;<input type='time' name='starttime' value="+starttime+"><br>"+
	"<input type='date' name='enddate' value="+enddate+">&nbsp;<input type='time' name='endtime' value="+endtime+">&nbsp;<input type='button' value='삭' class='deldate'></p></div>");
	$('#startEnd').append(tag);
}
function dragClick(){
	var sdre = $('#starttime').val();
	console.log(sdre);
	if($('#onDragClick').val() == 'false'){
		$('#onDragClick').val('true');
	}else{
		$('#onDragClick').val('false');
	}
}

var seq = window.opener.$("#cafe").val();

$('#calendarSubmit').submit(function(e){
	e.preventDefault();
	var formData = $('#calendarSubmit').serialize() + "&seq=" + seq;
	console.log(formData);
	$.ajax({
		type:'POST',
		url:'<c:url value ="/calendarInput"/>',
		data: formData,
		success: window.opener.location.reload()
	})
})
</script>
</body>
</html>
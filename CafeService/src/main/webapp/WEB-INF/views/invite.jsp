<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>invite</title>
<style>
</style>
</head>
<body>
<header><h3>친구초대</h3></header>
<nav>
이름검색:<input type="text" id="memberSearch">
</nav>
<section>친구목록
	<form id="invite" action="<c:url value="/invite"/>" method = "POST">
	<div id = "member">
	</div>
	<input type="submit" value="확인">
	</form>
</section>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#memberSearch").on("propertychange keyup paste", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		    var oldVal = currentVal;
		    $.ajax({
				url: '<c:url value ="/invitelist"/>', // 서버 url
				type: 'POST', //전송방식
				data: {memid: currentVal},
				dataType: 'json', // 서버로 부터 받아올 데이터 형식
				// 데이터 전송/요청 성공할 떄 실행되는 함수 (반환데이터)
				success: function(memberlist) {
					$('#member').empty();
					for(var mem in memberlist){
				        var tagList = "";
			            tagList += ("<div class = memlist"+memberlist[mem].roomcode+" id = memlist"+memberlist[mem].num+
			            		" style='background-color:green'><label>"
			            		+memberlist[mem].id+"</label><input name = 'num' type='hidden' value=\""
			            		+memberlist[mem].num+"\" disabled='true'></div>"); 
			            $('#member').append(tagList); 
				    }// html 파일에서 listArea영역 지우고
				}
			});  
		});
		$(document).on('click', '.memlist0', function (e){
			var currentcolor = $(this).css("background-color");
			var id = $(this).attr('id');
			if(currentcolor == "rgb(0, 128, 0)"){
				$('#'+id).css("background-color", 'rgb(255,0,0)');
				$('#'+id).children('input').attr('disabled', false);
			}else{
				$('#'+id).css("background-color", 'rgb(0, 128, 0)');
				$('#'+id).children('input').attr('disabled', true);
			}
		});
		$('#invite').submit(function() {
			window.self.close(); 
		});
	});
</script>
</body>
</html>
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

@media (min-width: 1200px) {
  .container {
    width: 970px;
  }
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
<h1 >카페 만들기</h1>

<form:form commandName="cafeDto" method="POST"
	enctype="multipart/form-data" onsubmit="return check()">

<form:label path="intere"></form:label>
	<form:input path="intere" type="hidden" value="${intere }" />
<p>
-선택된 관심사 : 
${interName[0]}
${interName[1]}
${interName[2]}
<br> <br>
			<form:label path="title">카페명</form:label>
			<input class="title" id="title" name="title" required />
		<!-- 카페명 중복 확인[S]  -->
			<button type="button" class="titleCheck">카페명 중복확인</button>
</p>
		<div id="message" class="titleMessage">카페명를 확인하세요</div>
		<!-- 카페명 중복 확인[E] -->
<%-- 
 1. 카페 이름 입력
<br> <br>
<form:label path="title">카페이름</form:label>
<form:input path="title" /> 
<form:errors path="title" />
&nbsp;&nbsp;&nbsp;<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
  --%>
 
2. 카페 설명 입력
<br><br>
<form:textarea cols="50" rows="9" path="content" /> 
<form:errors path="content" />
<br><br>
3. 카페 거점 입력 (상세 주소 생략 가능) 
<br><br>
<form:input path="postcode" type="text" id="postcode" placeholder="우편번호" />
<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
<form:input path="address" type="text" id="address" placeholder="주소" /><br>
<form:input path="detailaddress" type="text" id="detailAddress" placeholder="상세주소" />
<form:input path="extraaddress" type="text" id="extraAddress" placeholder="참고항목" />   
    
<br><br>


4. 카페 공개 여부
<br><br>
  <table width="600" >
    <tr>
    <td>
  <form:radiobutton path="open" name="fruit" checked="checked" value="0" />공개 카페<br>
&nbsp;- 누구나 언제든지 가입할 수 있습니다<br>
&nbsp;- 누구나 게시물을 검색할 수 있습니다 <br>
&nbsp;- 누구나 게시물을 볼 수 있습니다
</td>
<td>
  <form:radiobutton path="open" name="fruit" value="1" /> 비공개 카페<br>
&nbsp;- 가입시 승인이 필요합니다  <br>
&nbsp;- 게시물 검색이 제한됩니다  <br>
&nbsp;- 게시물을 보려면 가입해야합니다<br> 
</td>
</tr>
</table>

<br>
5. 카페 커버 이미지 첨부
<br>
<!-- 이미지 file업로드[S] -->
		<hr>
		<form:label path="image">
			<input type="file" id="image" name="file">
			<div class="selectImg">
				<img src="">
			</div>
		</form:label>
		<hr>
<!-- 이미지 file업로드[E] -->		
<br>
      <div align="center" id="cafeTitleImg">카페 대표 이미지</div>
      <div align="center">
        <div id="preview"></div>
      </div>
<input type="button" value="뒤로" onclick="history.back()"  />
&nbsp;&nbsp;
<input type="submit" value="등록"> 
</form:form>    <br> <br> <br>
</div>
</body>
<script>
var title_Check = false;
var nic_Check = false;
var emailAuthBtn = false;

$(".titleMessage").hide();
$("#cafeTitleImg").hide();
$("#preview").hide();

function check(){
	if(title_Check==false){
		alert("카페명을 확인해주세요.")
		$(".title").focus();
		return false;
	} else {
		alert("카페생성 성공, 이동합니다.")
	}
}
	
//이미지 파일 업로드
$("#fileImg").change(
		function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".selectImg img").attr("src", data.target.result)
							.width(400);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});

//아이디 정규화	
/* $(".idCheck").click( */
$(".titleCheck").click(
		/* $(".id").keyup(	 */
		function() {
			//아이디 정규화[S]
			$(".titleMessage").show();
			var query = $.trim($("#title").val())
			var queryLength = 0;
			var engCheck = /[a-z]/;
			var numCheck = /[0-9]/;
			var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;

			//한글, 영문 길이 2, 1로 바꾸기[S]
			for (var i = 0; i < query.length; i++) {
				chkquery = query.charAt(i);

				if (escape(chkquery).length > 4) {
					queryLength += 2;
				} else {
					queryLength += 1;
				}
			}
			//한글, 영문 길이 2, 1로 바꾸기[E]
			if (queryLength<4 || queryLength>16) {
				$(".titleMessage").text("사용 불가");
				$(".titleMessage").attr("style", "color:#f00");
			} else if (specialCheck.test(query)) {
				$(".titleMessage").text("사용 불가");
				$(".titleMessage").attr("style", "color:#f00");
			} else {
				var query1 = {
					title : query
				}
				$.ajax({
					url : "<c:url value='/titleCheck'/>",
					type : "POST",
					data : query1,
					success : function(data) {
						if (data == 1) {
							$(".titleMessage").text("사용 불가");
							$(".titleMessage").attr("style",
									"color:#f00");
							return title_Check=false;
						} else {
							$(".titleMessage").text("사용 가능");
							$(".titleMessage").attr("style",
									"color:#00f");
							return title_Check=true;
						}
					}
				}); // ajax
			}
		});
//아이디 정규화[E]
</script>
<script type="text/javascript">
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=auto height=250 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
            $("#cafeTitleImg").show();
            $("#preview").show();
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=250 height=auto />';
          $(str).appendTo('#preview');
          $("#cafeTitleImg").show();
          $("#preview").show();
        }
      });//arr.forEach
    }
  });
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>


</html>
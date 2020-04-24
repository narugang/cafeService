<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html><head><title>새 글 쓰기</title></head>
<body>
	<form:form commandName="boardVO" method="POST">
		<table border="1">
			<tr>
				<th><form:label path="title">밴드이름</form:label></th>
				<td><form:input path="title" /> 
				<form:errors path="title" /></td>
			</tr>
			<tr>
				<th><form:label path="content">밴드 소개</form:label></th>
				<td><form:input path="content" /> 
				<form:errors path="content" />
				</td>
			</tr>
			<tr>
				<th><form:label path="intere">관심사(숫자)</form:label></th>
				<td><form:input path="intere" /> 
				<form:errors path="intere" />
				</td>
			</tr>
			<tr>
				<th><form:label path="open">공개여부(숫자)</form:label></th>
				<td><form:input path="open" /> 
				<form:errors path="open" />
				</td>
			</tr>
			<tr>
				<th><form:label path="image">이미지</form:label></th>
				<td><form:input path="image" /> 
				<form:errors path="image" />
				</td>
			</tr>
			<tr>
				<th><form:label path="postcode">postcode</form:label></th>
				<td><form:input path="postcode" /> 
				<form:errors path="postcode" />
				</td>
			</tr>
			<tr>
				<th><form:label path="address">address</form:label></th>
				<td><form:input path="address" /> 
				<form:errors path="address" />
				</td>
			</tr>
			<tr>
				<th><form:label path="detailaddress">detailaddress</form:label></th>
				<td><form:input path="detailaddress" /> 
				<form:errors path="detailaddress" />
				</td>
			</tr>
			<tr>
				<th><form:label path="extraaddress">extraaddress</form:label></th>
				<td><form:input path="extraaddress" /> 
				<form:errors path="extraaddress" />
				</td>
			</tr>
			
			
		</table>
		<div>
		<input type="submit" value="등록"> 
			<a href="<c:url value="/band/bandmain" />">목록</a>
		</div>
	</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${message.title }</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>제목</th>
			<td>${message.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${message.content }</td>
		</tr>
		<tr>
			<th>보낸사람</th>
			<td>${message.sender }</td>
		</tr>
		<tr>
			<th>보낸일</th>
			<td><fmt:formatDate value="${message.send }"
					pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
	<div>
		<a href='<c:url value="/messageList"/>'>목록</a>
	</div>
</body>
</html>
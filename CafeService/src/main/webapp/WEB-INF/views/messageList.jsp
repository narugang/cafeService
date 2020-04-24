<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
</head>
<body>
	<form:form commandName="messageView">
		<p>
			<label>받은사람 : <form:input path="target"/></label>
			<input type="submit" value="검색">
		</p>
	</form:form>
	<c:if test="${!empty messageList }">
	<table border="1">
		<tr>
			<th>보낸사람</th>
			<th>제목</th>
			<th>보낸날짜</th>
		</tr>
		<c:forEach var="message" items="${messageList }">
			<tr>
				<td>${message.sender }</td>
				<td><a href="<c:url value="/message_view/${message.num }" />" style="text-decoration: none;">
					${message.title }</a></td>
				<td><fmt:formatDate value="${message.send }"
					pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<div>
		<a href="<c:url value='/message_OPEN'/>" style="text-decoration: none;">[뒤로가기]</a>
	</div>
</body>
</html>
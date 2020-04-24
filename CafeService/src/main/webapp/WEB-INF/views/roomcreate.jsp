<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomcreate</title>
</head>
<body>
<form action="<c:url value ="/roomCreate"/>" method="post">
제목: <input type="text" name = "sub">
<input type="button" value="뒤로가기" onclick="history.back();" />
<input type="submit" value="submit">
</form>
</body>
</html>
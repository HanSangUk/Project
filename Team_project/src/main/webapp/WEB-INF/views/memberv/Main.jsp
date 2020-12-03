<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main.jsp</h1>
	<c:if test="${!empty sessionScope.loginId}">	
	${sessionScope.loginId}</a> 님 환영합니다.<br>
	<button onclick="location.href='memberlogout'">로그아웃</button>
	</c:if>
</body>
</html>
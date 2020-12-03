<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="homeInclude.jsp" flush="true"/>
	<div style="border:1px black solid; margin-top:10px; width:300px; margin-left:auto;margin-right:auto;">
	<c:forEach var="list" items="${alarmList}">
	<div style="border-bottom:1px black solid;">
	${list.acomnumber}<br>
	[${list.aprodutname}] ${list.acontents}<c:if test="${list.confirm eq '1'}">[확인]</c:if><c:if test="${list.confirm eq '0'}">[New]</c:if><br>
	</div>
	</c:forEach>
	</div>
</body>
</html>
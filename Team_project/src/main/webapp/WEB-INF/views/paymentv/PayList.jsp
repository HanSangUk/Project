<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.PayList{
		
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="true"/>
<div class="PayList">
<c:forEach var="list" items="${paylist}">
       카테고리 : ${list.paycategory}
   payname : ${list.payname}
   payid : ${list.payid}
   paynumber : ${list.paynumber}<br>
</c:forEach>
</div> 
</body>
</html>
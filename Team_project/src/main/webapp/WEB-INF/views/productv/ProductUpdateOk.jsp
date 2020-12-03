<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
 int pnumber = Integer.parseInt( request.getParameter("pnumber"));
%>
<script>
	alert('수정완료되었습니다.');
	location.href = "productupdate?pnumber="+<%=pnumber%>;
</script >
</head>
<body onload = "init()" >
</body>
</html>
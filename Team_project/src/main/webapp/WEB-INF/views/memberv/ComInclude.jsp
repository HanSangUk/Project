<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/7c84f1169d.js" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <img src="${pageContext.request.contextPath}/resources/imglogo/아잉.jpg" style="width : 56px; height : 56px">
        <a class="navbar-brand" href="commaingo">SSadaing</a>
        <div class="com-log">
			<span class="com-member">${sessionScope.loginId} 님</span><br>
			<a href="comlogout" class="com-member"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
			<a href="commypage?comnumber=${sessionScope.loginId}" class="com-member"><i class="far fa-user"></i> 마이페이지</a>
			<a href="commemberpaylist" class="com-member"><i class="fas fa-archive"></i> 판매목록</a>
		</div>
	</nav>
</body>
</html>
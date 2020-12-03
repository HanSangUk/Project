<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table1 {
		display: block;
		margin:auto;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span>  
	<form action="auth.do" method="post">
		이메일 : <input type="email" name="memail"  placeholder="  이메일주소를 입력하세요. ">
		<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
	</form>
</body>
</html>
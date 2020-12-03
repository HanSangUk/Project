<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		display:block;
		margin:auto;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br><br><br><br>
	<form action="join_injeung.do${dice}" method="post">            
		인증번호 입력 : <input type="number" name="email_injeung" placeholder="  인증번호를 입력하세요. ">
		<button type="submit" name="submit">인증번호 전송</button>
	</form>
</body>
</html>
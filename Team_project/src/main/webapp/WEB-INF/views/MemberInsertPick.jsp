<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.button {
		padding: 15px 25px;
		font-size: 24px;
		text-align: center;
		cursor: pointer;
		outline: none;
		color: #fff;
		background-color: black;
		border: none;
		border-radius: 24px;
		box-shadow: 0 9px #999;
		margin:0px 50px;
		margin-top:25px;
		width: 200px;
		height: 100px;
	}

	.button:hover {
		background-color: 1ABC9C;
	}
	.button:active {
		background-color: #3e8e41;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}
	.loginpick {
		width: 1000px;
		height: 1000px;
		padding: 40px;
		margin: 100px auto;
		font-size: 30px;
		text-align: center;
	}
	.img{
		position: absolute;
		display: block; margin: auto;
	}
	p {
		margin: 0px;
	}
</style>
</head>
<body>
<jsp:include page="homeInclude.jsp" flush="false" />
	<div class="loginpick">
		<button class="button" onclick="location.href='memberinsertgogo'"><p>일반</p><p>회원가입</p></button>
		<button class="button" onclick="location.href='commemberinsertgo'"><p>기업</p><p>회원가입</p></button>
	</div>
</body>
</html>
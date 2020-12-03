<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.commy{
		margin:auto;
		display:block;	
		text-align:center;
		margin-top:100px;
	}
	.titlename {
   		font-size : 50px;
   		text-align : center;
   	}
   	.combutton{
		width: 150px;
		height: 30px;
		background-color: #fefefe;
	}
	th{
		height:35px;
	}
	tr:nth-child(even) {
  		background-color: #f2f2f2;
	}
</style>
</head>
<body>
<jsp:include page="ComInclude.jsp" flush="false" />

<div class="commy">
	<table border="1" align="center">
		<tr>
			<th style="width:120px;" >사업자번호</th>
			<th style="width:400px;">${commypage.comnumber}</th>
		</tr>
		<tr>
			<th>기업</th>
			<th>${commypage.company}</th>
		</tr>
		<tr>	
			<th>지점</th>
			<th>${commypage.comoffice}</th>
		</tr>
		<tr>	
			<th>전화번호</th>
			<th>${commypage.comphone}</th>
		</tr>
		<tr>	
			<th>주소</th>
			<th>${commypage.comaddress1} ${commypage.comaddress2} ${commypage.comaddress3} ${commypage.comaddress4}</th>
		</tr>
	</table>
	<br>
	<button class="combutton" onclick="location.href='commemberupdate?comnumber=${sessionScope.loginId}'">회원정보수정</button>
	<button class="combutton" onclick="location.href='commemberout'">회원탈퇴</button>
	<button class="combutton" onclick="location.href='commemberpaylist'">판매목록</button>
</div>

</body>
</html>
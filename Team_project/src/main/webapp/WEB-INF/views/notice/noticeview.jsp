<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function noticelist(){
	location.href="noticelist?page="+${page}
}
</script>
<style>
	.noticeview{
		margin:auto;
		display:block;	
		width: 700px;
		font-size: 20px;
		border: 1px solid black;
		padding: 20px;
	}
	.title{
		font-size:35px;
		text-align:center;
	}
	.buttons{
		width: 100px;
		height: 30px;
		background-color: #fefefe;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<p class="title"> <i class="far fa-eye"></i> 상세보기 <i class="far fa-eye"></i> </p><br>
	<div class="noticeview">
			<i class="fas fa-heading"></i> 제목 : ${ndto.ntitle}<br><br>
			<i class="far fa-clock"></i> 날짜 : ${ndto.ndate}<br><br>
			 <i class="fas fa-stopwatch"></i> 조회수 : ${ndto.nhits}<br><br>
			 <i class="far fa-image"></i> 이미지  <br><img class="img" src="${pageContext.request.contextPath}/resources/uploadfile/${ndto.nfilename}"/><br><br>
			<i class="fas fa-file-contract"></i> 내용 <br>${ndto.ncontents}
			<br><br>
		<button class="buttons" onclick="noticelist()"><i class="fas fa-list"></i> 목록</button>
	</div>
</body>
</html>
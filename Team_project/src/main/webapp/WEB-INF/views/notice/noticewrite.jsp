<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function noticewrite(){
		writeform.submit();
	}
</script>
<style>
	.noticeinsert{
		margin:auto;
		display:block;
		width:500px;
		font-size:20px;
		border: 2px solid black;
		padding: 10px;
	}
	.noticebutton, file{
		width: 100px;
		height: 30px;
		background-color: #fefefe;
	}
	.contents{
		width: 476px;
		height: 300px;
	}
	.noticetitle{
		font-size: 40px;
		text-align:center;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<br><p class="noticetitle"><i class="far fa-edit fa-flip-horizontal"></i> 게시글 작성 <i class="far fa-edit"></i></p><br>
<div class="noticeinsert">
	<form action="noticewrite" name="writeform" 
		method="post" enctype="multipart/form-data">
	<i class="fas fa-heading"></i> 공지사항 제목<br><br>
	<input type="text" name="ntitle" id="ntitle"><br><br>
	<i class="fas fa-scroll"></i> 공지사항 내용<br><br>
	<input class="contents" type="text" name="ncontents" id="ncontents"><br><br>
	<i class="far fa-folder-open"></i> 첨부파일<br><input type="file" name="nfile" id="nfile"><br>
	<button class="noticebutton" onclick="noticewrite()"><i class="far fa-edit"></i> 작성</button>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
	<form action="noticewrite" name="writeform" 
		method="post" enctype="multipart/form-data">
		공지사항 제목<input type="text" name="ntitle" id="ntitle" value="${ndto.ntitle}">
		공지사항 내용<input type="text" name="ncontents" id="ncontents" value="${ndto.ncontents}">
		첨부파일<input type="file" name="nfile" id="nfile" value="${ndto.nfilename}">
		<input type="submit" value="작성">
	</form>
	
</body>
</html>


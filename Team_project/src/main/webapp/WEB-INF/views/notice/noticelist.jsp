<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
<script>

//상세조회
function noticeviewgo(nnumber){
	location.href="noticeview?nnumber="+nnumber+"&page="+${paging.page};
};

//수정
function noticeupdate(nnumber){
	location.href="noticeupdate?nnumber="+nnumber+"&page="+${paging.page};
};

//삭제
function noticedelete(nnumber){
	location.href="noticedelete?nnumber="+nnumber;
};

</script>
<style>
	.tables{
		margin:auto;
		display:block;	
		width: 700px;
		font-size: 20px;
	}
	.paging{
		text-align:center;
		font-size: 20px;
	}
	.noticebutton{
		width: 100px;
		height: 30px;
		background-color: #fefefe;
	}
	.title{
		font-size: 40px;
		text-align:center;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<p class="title"><i class="fas fa-bullhorn"></i> 공지사항 <i class="fas fa-bullhorn fa-flip-horizontal"></i></p><br>
<div class="tables">
		<table border="1">
		<tr>
			<th style="width:100px; height:40px; padding-left:5px;">번호</th>
			<th style="width:330px; padding-left:5px;">제목</th>
			<th style="width:170px; padding-left:5px;">작성일자</th>
			<th style="width:100px; padding-left:5px;">조회수</th>
		</tr>
		<c:forEach var="notice" items="${noticelistpaging}" >
			<tr>
				<td style="height:40px; padding-left:5px;">${notice.nnumber}</td>
				<td style="padding-left:5px;">
				<a href="#" onclick="noticeviewgo('${notice.nnumber}')">${notice.ntitle}</a></td>
				<td style="padding-left:5px;">${notice.ndate}</td>
				<td style="padding-left:5px;">${notice.nhits}</td>
			<c:if test="${sessionScope.loginid eq 'admin'}">	
				<td><button onclick="noticeupdate('${notice.nnumber}')">수정</button></td>
				<td><button onclick="noticedelete('${notice.nnumber}')">삭제</button></td>
			</c:if>	
			</tr>
		</c:forEach>
		<tr>
		</tr>
	</table>
	<br>
	<button class="noticebutton" onclick="location.href='noticewritego'"><i class="far fa-edit"></i> 글쓰기</button>
	<br>
	</div>
	

	<!-- 페이징 처리 -->
<br>
<div class="paging">
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="noticelistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="noticelistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="noticelistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
</div>
</body>
</html>
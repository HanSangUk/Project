<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.totalsearch{
		display:block;
		margin:auto;
		text-align:center;
		font-size:20px;
		padding:0px 20px;
	}
	.title{
		margin-top:40px;
		font-size:40px;
		text-align:center;
	}
	.title2{
		font-size:30px;
	}
</style>
</head>
<body>
<jsp:include page="homeInclude.jsp" flush="true"/>
<p class="title"><i class="far fa-building"></i> 지점리스트</p><br>
<div class="totalsearch">
<c:forEach var="officelist" items="${officelist}" >
	<div class="row1">
 		<div class="column1">
      			<a class="title2" href="officemanagement?pcnumber=${officelist.comnumber}&pcategory=1">${officelist.company} ${officelist.comoffice}점</a>
        		<br>
        		<p></p>
        		<p>${officelist.comphone}</p>
        		<p>-------------------------</p>
  		</div>
	</div>
</c:forEach> 
</div>

	<!-- 페이징 처리 -->
	<c:if test="${boardserch.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="officesearch?page=${paging.page-1}&searchInput=${paging.search}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose> 
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="officesearch?page=${i}&searchInput=${paging.search}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	<c:if test="${paging.page<paging.maxpage}">
		<a href="officesearch?page=${paging.page+1}&searchInput=${paging.search}">[다음]</a>
	</c:if><br>
</body>
</html>
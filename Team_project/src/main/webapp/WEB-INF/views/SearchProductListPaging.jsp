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
		font-size:40px;
		text-align:center;
		margin-top:40px;
	}
	.title2{
		font-size:30px;
	}
	.column {
		float: left;
		width: 19.5%;
		margin-bottom: 16px;
		padding: 0 8px;
	}
	.paging{
		text-align:center;
	}
	.totarl{
		width:100%;
		height:400px;
	}
</style>
</head>
<body>
<jsp:include page="homeInclude.jsp" flush="true"/>
<div class="totarl">
<p class="title"><i class="fas fa-list-ul"></i> 물품리스트</p><br><br>
<div class="totalsearch">
<c:forEach var="productlist" items="${productlist}" >
<div class="column">
	<div class="row1">
 		<div class="column1">
      			<p>상품명 : ${productlist.pname}</p>
      			<a href="productview?pnumber=${productlist.pnumber}&pcategory=1"><img style="width:210px; height:210px; margin-bottom:10px;" src="${pageContext.request.contextPath}/resources/uploadfile/${productlist.pimage}"></a><br>
        		<p>가격 : ${productlist.pprice}원</p>
  		</div>
	</div>
</div>
</c:forEach> 
</div>
</div>
<div class="paging">
	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="productsearch?page=${paging.page-1}&searchInput=${paging.search}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose> 
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="productsearch?page=${i}&searchInput=${paging.search}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	<c:if test="${paging.page<paging.maxpage}">
		<a href="productsearch?page=${paging.page+1}&searchInput=${paging.search}">[다음]</a>
	</c:if><br>
</div>
</body>
</html>
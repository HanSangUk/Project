<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
	.thebutton{
		width: 150px;
		height: 30px;
		background-color: #fefefe;
	}
</style>
</head>
<body>
<jsp:include page="homeInclude.jsp" flush="true"/>
<br><br>
<div class="totalsearch">
<p class="title"><i class="far fa-building"></i> 지점리스트</p><br>
<c:if test="${not empty officelist}">
<c:forEach var="officelist" items="${officelist}" >
	<div class="row1">
 		<div class="column1">
      			<a class="title2" href="officemanagement?pcnumber=${officelist.comnumber}&pcategory=1">${officelist.company} ${officelist.comoffice}점</a>
        		<br>
        		<p>${officelist.comphone}</p>
        		<p>--------------------</p>
  		</div>
	</div>
</c:forEach> 
<button class="thebutton" onclick="location.href='officesearch?searchInput=${paging.search}'">더 보기</button>
</c:if>
<c:if test="${empty officelist}">
	<br><p>검색된 지점이 없습니다.</p>
</c:if>
</div>
<br><br>
<div class="totalsearch">
<p class="title"><i class="fas fa-list-ul"></i> 물품리스트</p><br>
<c:if test="${not empty productlist}">
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
<button class="thebutton" onclick="location.href='productsearch?searchInput=${paging.search}'">더 보기</button>
</c:if>
<c:if test="${empty productlist}">
	<br><p>검색된 상품이 없습니다.</p>
</c:if>
</div>
</body>
</html>
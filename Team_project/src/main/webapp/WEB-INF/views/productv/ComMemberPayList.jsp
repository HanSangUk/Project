<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
.PayList{
	display:block;
	margin:auto;
	text-align:center;
}
.paybutton{
	background-color: #fefefe;
}
</style>
</head>
<body>
<jsp:include page="../memberv/ComInclude.jsp" flush="false" />
<div class="PayList" style="margin-top:10px; width:400px;">
<c:forEach var="list" items="${commemberpayList}" varStatus="vs">
<strong style="font-size:30px;">${list.paynumber}번 상품</strong><br>
<fieldset style="border:1px black solid; padding:10px; margin-bottom:10px;">   
       카테고리 : ${list.paycategory}<br>
       상품명 : ${list.payname}<br>
       가격 : ${list.payamount}원<br>
       갯수 : ${list.payquantity}개<br>
       구매자: ${list.payid}<br>
       상품번호 : ${list.payproduct}<br>
       배송현황 : ${list.payagree}<br>
   
   <c:if test="${list.payagree eq '상품준비중'}">
   <div id="wrap">
   		<button class="paybutton" onclick="location.href='cproductagree?payagree=${list.payagree}&payid=${list.payid}&paynumber=${list.paynumber}&payname=${list.payname}&payoffice=${list.payoffice}'">배송준비중</button>
     <%--  <a href="cproductagree?payagree=${list.payagree}&payid=${list.payid}&paynumber=${list.paynumber}&payname=${list.payname}&payoffice=${list.payoffice}">배송준비중</a> --%>
   </div>
   </c:if>
   <c:if test="${list.payagree eq '배송준비중'}">
   <div id="wrap">
   		<button class="paybutton" onclick="location.href='cproductagree?payagree=${list.payagree}&payid=${list.payid}&paynumber=${list.paynumber}&payname=${list.payname}&payoffice=${list.payoffice}'"><i class="fas fa-shipping-fast"></i> 배송</button>
     <%--  <a href="cproductagree?payagree=${list.payagree}&payid=${list.payid}&paynumber=${list.paynumber}&payname=${list.payname}&payoffice=${list.payoffice}">배송</a> --%>
   </div>
</c:if>
</fieldset>
</c:forEach>
</div>
<!-- 페이징 처리 -->
	<br>
	<div class="pagingnumber">
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="commemberlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="commemberlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="commemberlistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
	</div>
</body>
</html>
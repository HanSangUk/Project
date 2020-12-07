<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.paging{
		text-align:center;
		font-size:20px;
	}
</style>
</head>
<body>
	<jsp:include page="homeInclude.jsp" flush="true"/>
	<br><br>
	<div style="border-top:1px black solid; border-bottom:1px black solid; margin-top:10px; width:400px; margin-left:auto;margin-right:auto; padding:15px;">
	<c:forEach var="list" items="${alarmList}">
	<div style="border:2px black solid; padding:10px; border-radius:10px;">
	${list.acomnumber}<br>
	[${list.aprodutname}] ${list.acontents}<br>
	<c:if test="${list.acontents eq '배송이 시작되었습니다.'}">
	도착 예상시간은
	<c:if test="${list.hour ne 0}">
		${list.hour}시간
	</c:if>
	<c:if test="${list.times ne 0}">
		${list.times}분 소요예정입니다.
	</c:if>
	</c:if>
	<br>
	<c:if test="${list.confirm eq '1'}">[확인]</c:if><c:if test="${list.confirm eq '0'}">[New]</c:if><br>
	</div><br>
	</c:forEach>
	</div>
	<br>
	<div class="paging">
	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="alarmlist?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose> 
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="alarmlist?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	<c:if test="${paging.page<paging.maxpage}">
		<a href="alarmlist?page=${paging.page+1}">[다음]</a>
	</c:if><br>
</div>
</body>
</html>
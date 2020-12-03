<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>Insert title here</title>
<script>
	var mid ="${sessionScope.loginId}";
	function ggymcheck(comnumber){
		$.ajax({
			type : "post",
			url : "ggymcheck",
			data : {"mid" : mid,"comnumber" : comnumber},
			dataType : "text",
			success : function(result){
				if(result =="on")
					{output = "★"
					}
				else
					{output = "☆"
					}
				var starid = "#"+comnumber;
				$(starid).html(output);
			},
			error : function(){
			}
		});
	};
</script>
<style>
	table{
		width:750px;
		height: auto;
		font-size:25px;
		text-align:center;
	}
	th, td{
		height: 50px;
	}
	.pagings{
		text-align:center;
		font-size:25px;
	}
	.ggymtitle{
		font-size:35px;
		text-align:center;
		margin-top:40px;
	}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="true"/>
<p class="ggymtitle"><i class="fas fa-stamp"></i> 찜 리스트 <i class="fas fa-stamp"></i></p><br>
	<table border="1" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th style="text-align:center">기업명</th>
			<th style="text-align:center">지점명</th>
			<th style="text-align:center">지점 전화번호</th>
			
		</tr>
		<c:forEach var="clist" items="${commemberlist}" >
			<tr>
				<td>${clist.ggymcompany}</td>
				<td><a href="productlist?comnumber=${clist.ggymoffice}">${clist.comoffice}</a></td>
				<td>${clist.ggymcomphone}</td>
				<td align = "center">
				<a onclick="ggymcheck('${clist.ggymoffice}')" id="${clist.ggymoffice}">${clist.star}</a></td>
			</tr>
			
		</c:forEach>
	</table>
	<br><br>
<div class="pagings">
	<!-- 페이징 처리 -->
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
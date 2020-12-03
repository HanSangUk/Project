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
#tablestyle {
	text-align: center;
}
</style>
<script>
	function productView(pnumber) {
		location.href = "productview?pnumber=" + pnumber;
	}
	function Chagne(comnumber){
		var pcategory = $('#pcategory').val();
		console.log(comnumber);
		location.href = "productlist?comnumber="+comnumber+"&pcategory="+pcategory;
	}
</script>
<style>
section#content ul li {
	margin: 10px auto;
	padding: 10px 0;
	width: 1000px;
	display: block;
	border-bottom: 1px solid #999;
}

section#content ul li img {
	width: 250px;
	height: 250px;
}

section#content ul li::after {
	content: "";
	display: block;
	clear: both;
}

section#content div.thumb {
	float: left;
	width: 250px;
}

section#content div.gdsInfo {
	float: right;
	width: calc(100% -320px);
}

section#content div.gdsInfo {
	font-size: 20px;
	line-height: 2;
}

section#content div.gdsInfo span {
	display: inline-block;
	width: auto;
	font-weight: bold;
	margin-right: 10px;
}

section#content div.gdsInfo .delete {
	text-align: right;
}

section#content div.gdsInfo .delete button {
	font-size: 18px;
	padding: 5px 10px;
	border: 1px solid #eee;
	background: #eee;
}
</style>
</head>
<body>
	<% 
		String comnumber = request.getParameter("comnumber");
	%>
	<jsp:include page="../homeInclude.jsp" flush="true" />
	<section id="content">
		<ul>
			<li style="font-size: 30px">상품 리스트<br>
				<form action="productlist">
					<select id="pcategory" name="pcategory" onchange="Chagne('<%=comnumber%>')">
						<option value="1" <c:if test="${pcategory eq '1'}">selected</c:if>>전체</option>
						<option value="Snack" <c:if test="${pcategory eq 'Snack'}">selected</c:if>>과자류</option>
						<option value="Drink" <c:if test="${pcategory eq 'Drink'}">selected</c:if>>음료류</option>
						<option value="Icecream" <c:if test="${pcategory eq 'Icecream'}">selected</c:if>>아이스크림류</option>
						<option value="Noodle" <c:if test="${pcategory eq 'Noodle'}">selected</c:if>>면류</option>
						<option value="Food" <c:if test="${pcategory eq 'Food'}">selected</c:if>>식사류</option>
					</select>
				</form>
			</li>
			<c:forEach var="list" items="${productlist}">
				<li>
					<div class="thumb">
						<a href="productview?pnumber=${list.pnumber}&pcategory=${pcategory}"><img class="img"
							src="${pageContext.request.contextPath}/resources/uploadfile/${list.pimage}"></a>
					</div>
					<div class="gdsInfo">
						<p>
							<span>상품 분류 : </span>${list.pcategory}<br /> <span>상품 이름
								: </span>${list.pname}<br /> <span>상품 가격 : </span>${list.pprice}<br />
							<span>상품 갯수 : </span>${list.pcount}<br />
						</p>
					</div>
				</li>
			</c:forEach>
		</ul>
	</section>
</body>
</html>
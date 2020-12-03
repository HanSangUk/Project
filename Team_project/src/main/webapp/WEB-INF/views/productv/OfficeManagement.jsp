<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function proudctInsertGo(){
	 location.href = "productinsertgo";
}
function productUpdate(pnumber){
	location.href = "productupdate?pnumber="+pnumber;
}
function productDelete(pnumber){
	location.href = "proudctdelete?pnumber="+pnumber;
}
</script>
<style>
section#content ul li { margin:10px auto; padding:10px 0; width:1000px; display:block; border-bottom:1px solid #999; }
section#content ul li img{ width:250px; height:250px; }
section#content ul li::after{content:""; display:block; clear:both; }
section#content div.thumb {float:left; width:250px;}
section#content div.gdsInfo {float:right; width:calc(100%-320px); }
section#content div.gdsInfo {font-size:20px; line-height:2; }
section#content div.gdsInfo span{display:inline-block; width:auto; font-weight:bold; margin-right:10px; }
section#content div.gdsInfo .delete{text-align:right; }
section#content div.gdsInfo .delete button {font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
</style>
</head>
<body>
 <jsp:include page="../homeInclude.jsp" flush="false" />
<h2>OfficeManagement.jsp</h2>
<section id="content">
	<ul>
		<li style="font-size:30px">
			상품 리스트
		</li>
		<c:forEach var="list" items="${productlist}">
			<li>
				<div class="thumb">
				<img class="img" src="${pageContext.request.contextPath}/resources/uploadfile/${list.pimage}" style = "width : 50px; hegith : 50px"alt="사진">
				</div>
				<div class="gdsInfo">
					<p>
						상품 분류 : ${list.pcategory}
						상품 이름 : ${list.pname}
						상품 가격 : ${list.pprice}
						상품 갯수 : ${list.pcount}
					</p>
				</div>
			</li>
		</c:forEach>
	</ul>
</section>
</body>
</html>
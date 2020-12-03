<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tablestyle{
		text-align : center;
	}
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
<script>
	var mid = "${sessionScope.loginId}";
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
	.pagingnumber{
		text-align:center;
		font-size:25px;
	}
</style>
</head>
<body>
<jsp:include page="homeInclude.jsp" flush="true"/>
<section id="content">
	<ul>
		<li style="font-size:30px">
			지점 리스트
		</li>
		<c:forEach var="list" items="${officelist}">
			<li>
				<c:if test = "${list.company eq 'CU' }">
				<div class="thumb">
				<a href = "productlist?comnumber=${list.comnumber}&pcategory=1"><img class="img" src="${pageContext.request.contextPath}/resources/imglogo/cu.png"></a><br>
				</div>
				<div class="gdsInfo">
		  	 	<p>${list.company} ${list.comoffice}점
		  	 	<a onclick="ggymcheck('${list.comnumber}')" id="${list.comnumber}">${list.star}</a>
				</p>
				</div>
				</c:if> 
				
				<c:if test = "${list.company eq '7-ELEVEN' }">
				<div class="thumb">
				<a href = "productlist?comnumber=${list.comnumber}&pcategory=1"><img class="img" src="${pageContext.request.contextPath}/resources/imglogo/7.png"></a><br>
				</div>
				<div class="gdsInfo">
				<p>${list.company} ${list.comoffice}점
				<a onclick="ggymcheck('${list.comnumber}')" id="${list.comnumber}">${list.star}</a>
				</p>
				
				</div>	
				</c:if>
				
				<c:if test = "${list.company eq 'GS' }">
				<div class="thumb">
				<a href = "productlist?comnumber=${list.comnumber}&pcategory=1"><img class="img" src="${pageContext.request.contextPath}/resources/imglogo/gs.jpg"></a>
				</div>
				<div class="gdsInfo">
				<p>${list.company} ${list.comoffice}점
				<a onclick="ggymcheck('${list.comnumber}')" id="${list.comnumber}">${list.star}</a>
				</p>
				</div>	
				</c:if>
				
				<c:if test = "${list.company eq 'E-MART' }">
				<div class="thumb">
				</div>
				<div class="gdsInfo">
				<a href = "productlist?comnumber=${list.comnumber}&pcategory=1"><img class="img" src="${pageContext.request.contextPath}/resources/imglogo/emart.png"></a>
				<p>${list.company} ${list.comoffice}점
						  	 	<a onclick="ggymcheck('${list.comnumber}')" id="${list.comnumber}">${list.star}</a>
				</p>
				</div>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</section>
</body>
</html>
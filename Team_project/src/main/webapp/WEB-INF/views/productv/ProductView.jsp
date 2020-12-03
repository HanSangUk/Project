<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var i = 0;
	if(localStorage.getItem('latelyViewItemList') == null) {
     //latelyViewItemListNew라는 JSON안에 있는 latelyViewItemInList 배열 맨 앞에 값을 추가함
     var latelyViewItemListNew = {
           "latelyViewItemInList" : [
                    
                 ]
               };

     latelyViewItemListNew.latelyViewItemInList.unshift({"pnumber" :"${pDTO.pnumber}" ,"pname" : "${pDTO.pname}"
             ,"pimg" : "${pDTO.pimage}"
             ,"pprice" : "${pDTO.pprice}"});
             
     //JSON을 javascript로 변환해서 로컬 스토리지에 담음
     localStorage.setItem('latelyViewItemList',JSON.stringify(latelyViewItemListNew));
     
   }
else {
     var latelyViewItemListNew = JSON.parse(localStorage.getItem('latelyViewItemList'));
     //latelyViewItemListNew의 배열 맨 앞에 값을 추가함
    	 if(latelyViewItemListNew.latelyViewItemInList[0].pnumber=="${pDTO.pnumber}"){
    		
    	 } else if(latelyViewItemListNew.latelyViewItemInList[1].pnumber=="${pDTO.pnumber}") {
    		 
    	 } else if(latelyViewItemListNew.latelyViewItemInList[2].pnumber=="${pDTO.pnumber}") {
    	
    	 } else {
    		 latelyViewItemListNew.latelyViewItemInList.unshift({"pnumber" :"${pDTO.pnumber}" ,"pname" : "${pDTO.pname}"
	             ,"pimg" : "${pDTO.pimage}"
	             ,"pprice" : "${pDTO.pprice}"});
	     
	     	//JSON을 javascript로 변환해서 로컬 스토리지에 담음
	     	localStorage.setItem('latelyViewItemList',JSON.stringify(latelyViewItemListNew));
    	 }
}
  
console.log(latelyViewItemListNew);                       

var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;
	console.log(hm);
	sum.value = parseInt(hm.value) * sell_price;
	document.getElementById("total_amount").value = sum.value;
	document.getElementById("quantity").value = hm.value;
	document.getElementById("bacount").value = sum.value;
	document.getElementById("batotal").value = hm.value;
	
	
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
		document.getElementById("total_amount").value = sum.value;
		document.getElementById("quantity").value = hm.value;
		document.getElementById("bacount").value = sum.value;
		document.getElementById("batotal").value = hm.value;
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
	document.getElementById("total_amount").value = sum.value;
	document.getElementById("quantity").value = hm.value;
	document.getElementById("bacount").value = sum.value;
	document.getElementById("batotal").value = hm.value;
} 

function basketgo(pquantity){
	var count =  parseInt(document.getElementById("batotal").value);
	if(count <= pquantity){
		console.log(count);
		console.log(pquantity);
	  basketinsertgo.submit();
	}
	else if(pquantity == 0){
		alert('SOLD OUT된 상품입니다.');
	}
	else{
		alert('수량이 '+pquantity+'개 남았습니다.');
	}	
}

function backtothelist(pcnumber,pcategory){
	location.href = 'productlist?comnumber='+pcnumber+'&pcategory='+pcategory;
}

function payquantity(pquantity){
	var number = document.getElementById("batotal").value;
	
	if(pquantity >= number){
		kakaoPaygo.submit();
	}else if(pquantity == 0){
		alert('SOLD OUT된 상품입니다.');
	}
	else{
		alert('수량이 '+pquantity+'개 남았습니다.');
	}
}
</script>
<%
      String category = request.getParameter("pcategory");
   %>

<style>
	.productviewclass{
	 	margin : auto;
	 	margin-top:100px;
	 	display : block; 
	 	width : 700px;
	 	text-align : center;
	 	font-size:20px;
	}
	.productbutton{
		width: 150px;
		height: 30px;
		background-color: #fefefe;
	}
</style>
</head>
<body onload="init();" >
<jsp:include page="../homeInclude.jsp" flush="true"/>
<div class = "productviewclass">
     <table>
         <th>     
     <img src="${pageContext.request.contextPath}/resources/uploadfile/${pDTO.pimage}" style = "width : 500px; hegith : 500px">
    </th>  
    <th style = "text-align: left; width:200px; padding-left:20px;">
	        상품 이름 : ${pDTO.pname}<br><br>
	        개당 금액 : ${pDTO.pprice}<br><br>
	         남은 갯수 : ${pDTO.pcount}개<br><br>
	    <form name="form" method="get">
		수량  <input type=hidden name="sell_price" value="${pDTO.pprice}">
		<input type="text" id = "amount" name="amount" value="1" size="3" onchange="change();">
		<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
		
		금액  <input type="text" id = "sum" name="sum" size="11" readonly>
		</form><br><br>
	
	  <form method = "post" action = "basketinsert" name = "basketinsertgo">
		<input type = "hidden" id = "pnumber" name = "pnumber" value = "${pDTO.pnumber}">
	  	<input type = "hidden" id = "bacount" name = "bacount">
	  	<input type = "hidden" id = "baname" name = "baname" value="${pDTO.pname}">
	  	<input type = "hidden" id = "baid" name = "baid" value ="${sessionScope.loginId}">
	  	<input type = "hidden" id = "batotal" name = "batotal">
	  	<input type = "hidden" id = "baimg" name = "baimg" value = "${pDTO.pimage}">
	    <input type = "hidden" id = "bacategory" name = "bacategory" value = "${pDTO.pcategory}">
	  	<input type = "hidden" id = "category" name = "category" value = "<%=category %>">
	  </form>
	  <button onclick = "basketgo('${pDTO.pcount}')" class="productbutton">장바구니 담기</button><br>
	  <br>
	  <form method="post" action="kakaoPay" name = "kakaoPaygo">
	  	<input type = "hidden" id = "item_name" name = "item_name" value = "${pDTO.pname}">
	  	<input type = "hidden" id = "quantity" name = "quantity">
	  	<input type = "hidden" id = "total_amount" name = "total_amount" >
	    <input type = "hidden" id = "partner_user_id" name = "partner_user_id" value ="${sessionScope.loginId}">
	   	<input type = "hidden" id = "item_code" name = "item_code" value = "${pDTO.pnumber}">
		<input type = "hidden" id = "paycategory" name = "paycategory" value = "${pDTO.pcategory}">
	</form>  
	<button class="productbutton" onclick = "payquantity('${pDTO.pcount}')">결제하기</button><br><br>	 
    <button class="productbutton" onclick = "backtothelist('${pDTO.pcnumber}','${pcategory}')">목록</button>
    </th>   
</table>
<br>
<fieldset>
<legend>Review</legend>
<c:forEach var="reviewList" items="${reviewList}">
   <table>
            <tr>
               <th style="text-align:left; width:100px; height:45px;">${reviewList.rid}</th>
               <th>${reviewList.rdate}</th>
            </tr>
            <tr>
               <td> ≫ ${reviewList.rcontents}</td>
            </tr>
   </table>
</c:forEach>
</fieldset>
<!-- 페이징 처리 -->
	<br>
	<div class="pagingnumber" style="border-bottom:1px solid #e5e5e5; padding-bottm:10px;">
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="productview?page=${paging.page-1}&pnumber=${pDTO.pnumber}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="productview?page=${i}&pnumber=${pDTO.pnumber}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="productview?page=${paging.page+1}&pnumber=${pDTO.pnumber}">[다음]</a>
	</c:if>
	<br>
	</div>
</div>
<br><br>
</body>
</html>
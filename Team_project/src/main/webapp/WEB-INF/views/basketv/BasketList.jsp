<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.allCheck { float:left; width:200px; font-size:30px}
.allCheck input { width:16px; height:16px; }
.allCheck label { margin-left:10px; }
.delBtn { float:right; width:300px; text-align:right; }
.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}

.checkBox { float:left; width:30px; }
.checkBox input { width:16px; height:16px; }
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false" />
<section id="content">
<ul>
 <li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
	<script>
		$("#allCheck").click(function(){
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		});
		
		
	</script>
  
  </div>

  <div class="delBtn">
   <button type = "button" class = "selectpay_btn" >선택 결제</button>
   <button type="button" class="selectDelete_btn">선택 삭제</button> 
   </div>
     <script>
		 $(".selectDelete_btn").click(function(){
		  var confirm_val = window.confirm("정말 삭제하시겠습니까?"); 
		  var checkArr = new Array();
/* 		 	/* var confirm_val = true;	 	 */
		  console.log(confirm_val);
		 
		  if(confirm_val) {
			$("input[class='chBox']:checked").each(function(){
			  checkArr.push($(this).attr("data-cartNum"));
			});
		    
		   $.ajax({
		    url : "deleteCart",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(result){
				if(result==1){
					location.href="basketlist";
				} else {
					alert("삭제실패");
				}
		    }
		   });
		  }
		 });
		 </script>
		 
		 <script>
		 $(".selectpay_btn").click(function(){
			 var cnt = $("input[name='checkboxname']:checked").length;
			 var confirm_val2 = window.confirm("정말 결제하시겠습니까?");
			 var paycheckArr = new Array();
			 var intVar = new Array;
			 var total = 0;
			 var checkbanumber = new Array();
			 var banumber = new Array();
			 var checkpnumber = new Array();
			 var quantityarray = new Array();
			 if(confirm_val2) {
					$("input[class='chBox']:checked").each(function(){
						paycheckArr.push($(this).attr("data-cartPay"));
						checkbanumber.push($(this).attr("data-banumber"));
						checkpnumber.push($(this).attr("data-pnumber"));
						quantityarray.push($(this).attr("data-carquantity"));
						
					});	 
					
					for(var i in paycheckArr)
						{
							intVar = parseInt(paycheckArr[i]);
							console.log(intVar); 
							total += intVar;
						}
					console.log(total);

             					
					console.log(cnt);
					document.getElementById("total_amount").value = total;
					document.getElementById("quantity").value = cnt;
					document.getElementById("array").value = checkbanumber;
					document.getElementById("arraypnumber").value = checkpnumber;
					document.getElementById("arrayquantity").value = quantityarray;	
			 
					bakakaopaygo.submit();
			 }else{
				 location.href = "basketlist";
			 }
			
		 });
		 </script>
  <form method = "post" action = "bakakaopay" name = "bakakaopaygo" >
 		<input type = "hidden" id = "total_amount" name = "total_amount">
 		<input type = "hidden" id = "partner_user_id" name = "partner_user_id" value = "${sessionScope.loginId}"> 
 		<input type = "hidden" id = "quantity" name = "quantity">
		<input type = "hidden" id = "array" name = "array">
		<input type = "hidden" id = "arraypnumber" name = "arraypnumber">
		<input type = "hidden" id = "arrayquantity" name = "arrayquantity">
  </form>
 
  
 </li>
 <c:forEach items="${basketlist}" var="basketlist">
 <li>
 <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${basketlist.banumber}" data-cartPay = "${basketlist.bacount}" data-banumber= "${basketlist.banumber}" data-pnumber = "${basketlist.pnumber}" data-carquantity="${basketlist.batotal}"/>
 	
 	<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
	</script>
 
 </div>	
 	
  <div class="thumb">
  <a href="productview?pnumber=${basketlist.pnumber}&pcategory=1"><img class="img" src="${pageContext.request.contextPath}/resources/uploadfile/${basketlist.baimg}"/></a>
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명 : </span>${basketlist.baname}<br />
    <span>구입 수량 : </span>${basketlist.batotal}개<br />
   	<span>최종 가격 : </span>${basketlist.bacount}원<br><br>
   </p>
   
   <div class="delete">
    <button type="button" class="delete_${basketlist.banumber}_btn" data-cartNum="${basketlist.banumber}" >삭제</button>
  
	<script>
		 $(".delete_${basketlist.banumber}_btn").click(function(){
		  var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   
		   checkArr.push($(this).attr("data-cartNum"));
		              
		   $.ajax({
		    url : "deleteCart",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(result){
		     if(result == 1) {            
		      location.href = "basketlist";
		     } else {
		      alert("삭제 실패");
		     }
		    }
		   });
		  } 
		 });
		
		 
		 
	</script>
	
   </div>
  </div>   
 </li>
 </c:forEach>
</ul>
</section>
</body>
</html>
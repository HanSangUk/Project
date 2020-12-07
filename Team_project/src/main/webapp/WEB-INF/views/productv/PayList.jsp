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
* {
   margin: 0;
   padding: 0;
}

a.button {
   display: inline-block;
   padding: 10px 20px;
   text-decoration: none;
   color: #fff;
   background: #000;
   margin: 20px;
}

#modal {
   display: none;
   position: fixed;
   width: 100%;
   height: 100%;
   top: 0;
   left: 0;
   background: rgba(0, 0, 0, 0.3);
}

.modal-con {
   display: none;
   position: fixed;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   max-width: 60%;
   min-height: 30%;
   background: #fff;
}

.modal-con .title {
   font-size: 20px;
   padding: 20px;
   background: gold;
}

.modal-con .con {
   font-size: 15px;
   line-height: 1.3;
   padding: 30px;
}

.modal-con .close {
   display: block;
   position: absolute;
   width: 30px;
   height: 30px;
   border-radius: 50%;
   border: 3px solid #000;
   text-align: center;
   line-height: 30px;
   text-decoration: none;
   color: #000;
   font-size: 20px;
   font-weight: bold;
   right: 10px;
   top: 10px;
}
.pagingnumber{
	text-align:center;
	font-size:20px;
}
.PayList{
	display:block;
	margin:auto;
	text-align:center;
	font-size:15px;
}
</style>
</head>
<body>
<jsp:include page="../homeInclude.jsp" flush="false"/>
<div class="PayList">
<br>
<c:forEach var="list" items="${payList}" varStatus="vs">
<br>
       구매번호 : ${list.paynumber}<br>    
       카테고리 : ${list.paycategory}<br>
        상품명 : <a href ="productview?pnumber=${list.payproduct}&pcategory=1">${list.payname}</a><br>
       가격 : ${list.payamount}원<br>
       갯수 : ${list.payquantity}개<br>
       구매자: ${list.payid}<br>
       상품번호 : ${list.payproduct}<br>
       배송현황 : ${list.payagree}<br>
   <c:if test="${list.payagree eq '배송중'}">
   <div id="wrap">
	배송시간 : ${list.hour}시 ${list.times}분<br>
      <a href="productagree?paynumber=${list.paynumber}&page=${paging.page}" class="button modal-open">배송완료</a>
   </div>
   </c:if>
   <c:if test="${list.payagree eq '배송완료'}">
      <c:if test="${list.reviewagree eq '0'}">
      <div id="wrap">
      <a href="javascript:openModal('modal${vs.index}');" class="button modal-open">리뷰작성</a>
   </div>
   <div id="modal"></div>
   <div class="modal-con modal${vs.index}">
      <a href="javascript:;" class="close">X</a>
      <p class="title">리뷰</p>
      <div class="con">
         <span><br></span>
         <form action="productreview" method="get">
            <br>
            <textarea rows="10" cols="30" id="rcontents" name="rcontents" style="resize: none;"></textarea>
            <br> <input type="hidden" id="pnumber" name="pnumber" value="${list.payproduct}"><input type="hidden" id="rid" name="rid" value="${sessionScope.loginId}"><input type="hidden" id="paynumber" name="paynumber" value="${list.paynumber}"> 
            <button onclick="javascript:;">작성</button>
         </form>
      </div>
   </div>
   <script>
      function openModal(modalname) {
         document.get
         $("#modal").fadeIn(300);
         $("." + modalname).fadeIn(300);
      }

      $("#modal, .close").on('click', function() {
         $("#modal").fadeOut(300);
         $(".modal-con").fadeOut(300);
      });
   </script>
   </c:if>
   <c:if test="${list.reviewagree eq '1'}">
   <h1>리뷰 작성 완료!</h1>
   </c:if>
   </c:if>
============================================<br>

</c:forEach>
</div>
<!-- 페이징 처리 -->
	<br>
	<div class="pagingnumber">
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="paylistgo?page=${paging.page-1}&payid=${paging.mid}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="paylistgo?page=${i}&payid=${paging.mid}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxpage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxpage}">
		<a href="paylistgo?page=${paging.page+1}&payid=${paging.mid}">[다음]</a>
	</c:if>
	</div>
</body>
</html>
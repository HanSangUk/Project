<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script>
function productUpdateProcess(){
   productupdateprocessname.submit();
}
function init(){
   value = '${list.pcategory}'
   $('#pcategory').val(value).prop("selected", true);   
}
var sel_file;
$(document).ready(function(){
   $("#pfile").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e){
   var files = e.target.files;
   var filesArr = Array.prototype.slice.call(files);
   
   filesArr.forEach(function(f){
      sel_file = f;
      var reader = new FileReader();
      reader.onload = function(e){
         $("#img").attr("src", e.target.result);
      }
      reader.readAsDataURL(f);
   });
}
</script>
<style>
*{ font-family:'Do Hyeon', sans-serif ;}
.productupdatecss{
	position:absolute;
    left:43%;
    top:15%;
    font-size : 25px;
}
.title{
	margin-top: 25px;
	font-size : 40px;
	text-align:center;
}
.buttons{
	width: 242px;
	height: 40px;
	background-color: #fefefe;
}
</style>
</head>
<body onload = "init()">
<jsp:include page="../memberv/ComInclude.jsp" flush="false" />
<p class="title"><i class="fas fa-dolly-flatbed"></i> 상품 수정 <i class="fas fa-dolly-flatbed fa-flip-horizontal"></i></p>
<div class="productupdatecss">
<form action="productupdateprocess" method="post" name ="productupdateprocessname" enctype="multipart/form-data">
<br><i class="fas fa-sort-numeric-up"></i> 상품 번호<br>
   <input type = "text" id = "pnumber" name = "pnumber" value = "${list.pnumber}" readonly><br><br>
   <i class="fas fa-tag"></i> 분류<br>
   <select id = "pcategory" name ="pcategory" class = "pcategory" data-pcategory = "Drink" style = "width : 176px; height : 30px">
                    <option value="Snack">과자류</option>
                    <option value="Drink">음료류</option>
               <option value="Icecream">아이스크림류</option>
               <option value="Noodle">면류</option>
               <option value="Food">식사류</option>
                </select><br><br>
    <i class="fas fa-dice-d6"></i> 상품 이름 <br>
    <input type="text" id = "pname" name = "pname" value ="${list.pname}"/><br><br>
    <i class="fas fa-donate"></i> 상품 가격 <br>
    <input type="text" id="pprice" name="pprice" value = "${list.pprice}" ><br><br>
    <i class="fas fa-sort-numeric-up-alt"></i> 상품 갯수 <br>
    <input type="text" id = "pcount" name ="pcount" value = "${list.pcount}"><br><br>   
    <i class="far fa-image"></i> 상품 사진 <br>
    <img id="img"src="${pageContext.request.contextPath}/resources/uploadfile/${list.pimage}" style = "width : 200px; hegith : 200px"alt="사진"><br>
    <input type="hidden" id="preexistence" name="preexistence" value="${list.pimage}"><br>
         <input type="file" id="pfile" name="pfile" > <br><br>     
   <i class="fas fa-font"></i> 상품 소개 <br>
   <textarea id = "pinfo" name = "pinfo" rows = "5">${list.pinfo}</textarea><br><br>
   </form>
   <button class="buttons" onclick = "productUpdateProcess()">수정 완료</button>
</div>
</body>
</html>
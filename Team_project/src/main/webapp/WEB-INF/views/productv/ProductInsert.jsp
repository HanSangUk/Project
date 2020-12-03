<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function productAdd(){
	productinsertname.submit();
}
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); }; 
		reader.readAsDataURL(event.target.files[0]); 
}
</script>

<style>
.contents{
	position:absolute;
    left:43%;
    top:17%;
    font-size : 25px;
}
.title{
	font-size:40px;
	text-align:center;
	margin-top:25px;
}
.buttons{
	width: 262px;
	height: 40px;
	background-color: #fefefe;
}
img{
	width: 262px;
	height: 140px;
}
</style>
</head>
<body>
<jsp:include page="../memberv/ComInclude.jsp" flush="false" />
<p class="title"><i class="fas fa-box-open"></i> 상품 등록 <i class="fas fa-box-open"></i></p>
<div class="contents">
<form action="productinsert" method="post" name ="productinsertname" enctype="multipart/form-data">
			<i class="fas fa-tag"></i>분류<br> <select id = "pcategory" name ="pcategory">
                    <option value="Snack">과자류</option>
                    <option value="Drink">음료류</option>
					<option value="Icecream">아이스크림류</option>
					<option value="Noodle">면류</option>
					<option value="Food">식사류</option>
                </select><br><br>
         <i class="fas fa-dice-d6"></i> 상품 이름  <br><input type="text" id = "pname" name = "pname"/><br><br>
         <i class="fas fa-donate"></i> 상품가격  <br><input type="text" id="pprice" name="pprice"><br><br>
         <i class="fas fa-sort-numeric-up-alt"></i> 상품갯수 <br><input type="text" id = "pcount" name ="pcount"><br><br>   
         <i class="far fa-image"></i> 상품사진 <br><input type="file" id="pfile" name="pfile" onchange="setThumbnail(event);"><br>
		<div id="image_container"></div><br>
		<i class="fas fa-font"></i>상품소개 <br><textarea id = "pinfo" name = "pinfo" rows = "5"></textarea><br>
	</form>
	<button class="buttons" onclick = "productAdd()">추가</button>
</div>
</body>
</html>
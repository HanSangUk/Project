<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script>
   var val = window.confirm('장바구니로 이동하시겠습니까?');
   if(val){
      location.href = "basketlist";
   }else{
      location.href = "productview?pnumber="+${pnumber}+"&pcategory="+${category};
   }
   </script>
</head>
<body onload = "init()" >

</body>
</html>
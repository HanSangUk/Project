<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     ${kvalue.approved_at}<br/>
주문번호:    ${kvalue.partner_order_id}<br/>
상품명:    ${kvalue.item_name}<br/>
상품수량:    ${kvalue.quantity}<br/>
결제금액:    ${kvalue.amount.total}<br/>
결제방법:    ${kvalue.payment_method_type}<br/>
상품번호:  	${kvalue.item_code}

 
<h2>${kvalue}</h2>
</body>
</html>
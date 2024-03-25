<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인페이지</title>
</head>
<body>
	<h1>도서 주문 페이지</h1>
	<form action="/MVCtest/book?command=cart" method="post">
		<select name = "book">
			<option> 어린 왕자 / 생떽쥐페리 / 15000 </option>
			<option> 연금술사 / 파올로 코엘료 / 15000 </option>
			<option> 파과 / 구병모 / 18000 </option>
			<option> 위저드베이커리 / 구병모 / 18000 </option>	
		</select>
		<b>수량 : </b>
		<input type="text" name="quantity" size="2" value="1" />
		<input type="submit" value="장바구니에 담기" />
	</form>
	
	<hr/>
	<!-- inclue 해서 바로 보여줄수있도록. -->
	<jsp:include page="cart.jsp"></jsp:include>
</body>
</html>
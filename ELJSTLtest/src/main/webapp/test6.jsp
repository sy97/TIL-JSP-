<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="mybean.BeanTest"/>
	<jsp:setProperty property="name" value="홍길동" name="dto"/>
	<jsp:setProperty property="price" value="10000" name="dto"/>
	
	
	이름 : <jsp:getProperty property="name" name="dto"/><br>
	가격 : <jsp:getProperty property="price" name="dto"/><br>
	
	<hr>
	이름 : ${dto.name }<br>
	가격 : ${dto.price } 또는 ${dto["price"]}<br>
	
	<hr>
	<a href="/ELJSTLtest/eltest.do?name=John">서블릿에게 요청</a>
</body>
</html>
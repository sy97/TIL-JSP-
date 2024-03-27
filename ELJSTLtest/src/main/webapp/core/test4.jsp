<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp</h1>
	이름 : ${param.name }<br>
	나이 : ${param.age}
	
	<hr>
	<h1>내가 좋아하는 영화들</h1>
	<c:forEach var="m" items="${movies}">
		${m}<br>
	</c:forEach>
</body>
</html>
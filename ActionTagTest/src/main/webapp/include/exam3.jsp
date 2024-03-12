<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<h1>exam3.jsp</h1>
	exam4에게 데이터를 전달<br>
	1. url 이용(get방식) : http://localhost:8080/ActiontagTest/include/exam4.jsp?id=hong&addr=seoul<br>
	2. 하이퍼링크 이용<br> 
	3. form태그 이용<br>
	4. ActionTag를 이용(그 중에서도 include)<br>
	<jsp:include page="exam4.jsp">
		<jsp:param name="id" value="hong" />
		<jsp:param name="addr" value="seoul" />
	</jsp:include>
	

	
</body>
</html>
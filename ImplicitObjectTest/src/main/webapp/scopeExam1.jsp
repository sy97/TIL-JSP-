<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>scopeExam1.jsp</title>
</head>
<body>
	<h2>session에 값 저장</h2>
	
	<%
		session.setAttribute("i", 10);
	%>
	<br><br>
	<h2>application에 값 저장</h2>
	<% 
		application.setAttribute("j", 100);
	%>
	<br><br>
	<h2>pageContext에 값 저장</h2>
	<% 
		pageContext.setAttribute("k", 1000);
	%>
	
	
	
</body>
</html>
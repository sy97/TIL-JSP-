<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam2.jsp</h1>
	request : <%=request.getAttribute("first") %><br>
	session : <%=session.getAttribute("first") %><br>
	application : <%=application.getAttribute("first") %><br>
	pageContext : <%=pageContext.getAttribute("first") %><br>
	
	<%
	//각각 다른 객체라 변수명 같아도 상관없음.
		request.setAttribute("second", "request 객체");
		session.setAttribute("second", "session 객체");
		application.setAttribute("second", "application 객체");
		pageContext.setAttribute("second", "pageContext 객체");
	%>

	
</body>
</html>
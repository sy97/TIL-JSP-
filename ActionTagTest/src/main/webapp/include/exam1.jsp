<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam1.jsp</h1>
	

	
	<%
	//각각 다른 객체라 변수명 같아도 상관없음.
		request.setAttribute("first", "request 객체");
		session.setAttribute("first", "session 객체");
		application.setAttribute("first", "application 객체");
		pageContext.setAttribute("first", "pageContext 객체");
	%>
	
	request : <%=request.getAttribute("first") %><br>
	session : <%=session.getAttribute("first") %><br>
	application : <%=application.getAttribute("first") %><br>
	pageContext : <%=pageContext.getAttribute("first") %><br>
	
	<hr>
	<jsp:include page="exam2.jsp" />
	
	<%//include file="exam2.jsp" %>
	<hr/>
	
	request : <%=request.getAttribute("second") %><br>
	session : <%=session.getAttribute("second") %><br>
	application : <%=application.getAttribute("second") %><br>
	pageContext : <%=pageContext.getAttribute("second") %><br>
</body>
</html>
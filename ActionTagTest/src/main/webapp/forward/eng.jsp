<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Thank you for visiting our site.</h2><br>
	There are data you input.<br>
	<ul>
		<li>Name : <%=request.getParameter("name") %></li>
		<li>Address : <%=request.getParameter("addr") %></li>
		<li>Language : <%=request.getParameter("lang") %></li>
	</ul>
</body>
</html>
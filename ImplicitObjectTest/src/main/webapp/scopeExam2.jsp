<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>scopeExam2.jsp</title>
</head>
<body>
	<h2>session에 값 확인</h2>
	<%=session.getAttribute("i")%>
	
	<br><br>
	<h2>application에 값 확인</h2>
	<%=application.getAttribute("j")%>
	
	<br><br>
	<h2>pageContext에 값 확인</h2>
	<%=pageContext.setAttribute("k", 1000)%>

</body>
</html>
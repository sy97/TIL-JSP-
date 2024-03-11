<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
		<%
		Date today = (Date)request.getAttribute("currentDate");
		%>
		오늘은 <%=today %>입니다.
		
		<br><br>
		<%
		//request라는 영역에 값을 잠시 보관해두는 용도
		request.setAttribute("currentDate", new Date());
		//값을 꺼내오는 용도
		today = (Date)request.getAttribute("currentDate");
		%>
		오늘은 <%=today %>입니다.
		
		<br><br>
		
		<%
		//removeAttribute
		request.removeAttribute("currentDate");
		today = (Date)request.getAttribute("currentDate");
		%>
		오늘은 <%=today %>입니다.
</body>
</html>
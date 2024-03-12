<%@ page contentType="text/html; charset=utf-8" %>

	<%
	//세션공간 자체를 삭제
	session.invalidate();
	response.sendRedirect("index.jsp");
	%>
	
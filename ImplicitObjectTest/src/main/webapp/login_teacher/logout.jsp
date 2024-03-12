<%@ page contentType="text/html; charset=utf-8" %>
<%
	//이건 세션 공간은 남겨두고있는것임.
	//세션 자체를 완전히 없애는게 좋음.
	//session.removeAttribute("id");
session.invalidate();
response.sendRedirect("index.jsp");
	
%>	
<%@ page contentType="text/html; charset=utf-8" %>
<%
	String id= request.getParameter("id");
	String pw = request.getParameter("pw");

	if(id.equals("hong") && pw.equals("1111")){
		//인증처리
		session.setAttribute("id", id);
		
		response.sendRedirect("index.jsp");	

	}
	
	else{
		response.sendRedirect("login.jsp");	
	}
		
%>
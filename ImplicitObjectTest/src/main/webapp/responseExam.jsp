<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>responseExam.jsp</title>
</head>
<body>
	1. 다른 페이지로 이동
	<%
		//바로 네이버가 나옴.
		//response.sendRedirect("https://www.naver.com");
		//response.sendRedirect("requestExam1.html");
		
	%>
	
	<br><br>
	2. 선택에 의해 페이지 이동
	<%
		String param = request.getParameter("param");
		if(param == null || param.isEmpty()){
		//자바코드를 끊지 않고 이렇게 할 수 있음. 
		out.println("페이지 이동을 하지 않습니다.");
		}
		else{
		response.sendRedirect("requestExam1.html");
		}
	%>
	
</body>
</html>
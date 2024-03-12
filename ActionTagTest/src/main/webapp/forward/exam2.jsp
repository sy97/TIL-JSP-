<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>exam2.jsp</h1>
	irum : <%=request.getParameter("irum") %>
	<!-- exam3에게 재전달 -->
	<%--<jsp:forward page="exam3.jsp"/>--%>
	
	<!-- 위에 forward를 쓰지 않고 자바코드로 구현한다면? -->
	<%
		//어느페이지로 이동할건지만 저장
		RequestDispatcher dispatcher 
			= request.getRequestDispatcher("/forward/exam3.jsp");
		
		dispatcher.forward(request, response);
		
		//원래 이렇게 해야하는데 위에 액션태그로 간단하게 처리가능.
	%>
</body>
</html>
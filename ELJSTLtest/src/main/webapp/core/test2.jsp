<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String str1 = "aaaa";
		if(str1.equals("aaaa")){
			
	%>
		<b>aaaa가 맞습니다.</b>
	<%
		}
	%>
	<hr>
	<c:set var="str2" value="bbbb" />
	<!-- 안에는 el로 묶어줘야함. -->
	<c:if test="${str2 eq 'bbbb'}">
		<b>bbbb가 맞습니다.</b>
	</c:if>
	
	<hr>
	
	<form action="test2.jsp">
		숫자1 : <input type="number" name="num1" /><br><br>
		숫자2 : <input type="number" name="num2" /><br><br>
		<input type="submit" value="최대값 구하기" />
	</form>
	<%
		if(request.getParameter("num1")!=null && request.getParameter("num2")!=null){	
			
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int result = (num1 > num2)? num1 : num2;
		
	%>
		최대값은 <%=result %>입니다.
	<%
		}
	%>
	<br><br>
	
	<c:set var="num1" value="${param.num1}" />
	<c:set var="num2" value="${param.num2}" />
	<c:if test="${num1 gt num2 }">
		<b>더 큰 값은 ${num1 }</b>
	</c:if>
	
	<c:if test="${num2 gt num1 }">
		<b>더 큰 값은 ${num2 }</b>
	</c:if>
			
</body>
</html>
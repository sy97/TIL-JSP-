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

	
	<!-- param으로 넘어오는건 바로 써줄 수 있음. 
	null값 예외처리도 하지 않아도됨. el은 null값 에러가 안나기 때문.-->
	<c:if test="${num1 > num2 }">
		<b>더 큰 값은 ${num1 }</b>
	</c:if>
	
	<c:if test="${num2 < num1 }">
		<b>더 큰 값은 ${num2 }</b>
	</c:if>
	
	<!-- 다중조건 -->
	
	<c:choose>
		<c:when test="${param.num1 > param.num2 }">
			${param.num1 }이 크다.<br>
		</c:when>
		<c:when test="${param.num1 < param.num2 }">
			${param.num2 }이 크다.<br>
		</c:when>	
		<c:otherwise>
			<!-- 값이 비어있지 않을 때만 출력 -->
			<c:if test="${!empty param.num1 }">
				똑같다.
			</c:if>
		</c:otherwise>
	</c:choose>
			
</body>
</html>


























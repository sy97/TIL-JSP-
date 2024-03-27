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
		int var1 = 10;
	%>
	
	<%=var1 %><br>
	<!-- jsp로 시작하는 것들은 표준 액션태그. 구분하기 위해서 표준이 아닌것들은 jsp로 시작하지않음. 
	위에 prefix에 태그 이름을 적어주는것.-->
	<c:set var="var2" value="20"/>
	<!-- 원래 el에서는 지역변수를 쓸 수 없었는데, jstl로 선언한 지역변수는 el에 적어줄 수 있음 -->
	${var2}<br>
	
	<c:set var="var3" value="30"/>
	<c:set var="result" value="${var2 + var3}" />
	두 수의 합은 ${result} 입니다.
</body>
</html>
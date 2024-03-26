<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h2>두 수의 덧셈</h2>
	<%
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	두 수의 합 : <%=num1 %> + <%=num2 %> = <%=num1+num2 %>
	<hr>
	
	<h2>EL</h2>
	<!-- 숫자로 안바꿔줘도 알아서 형변환 해서 덧셈해줌. -->
	${param.num1} + ${param.num2} = ${param.num1+param.num2}

	<hr>
	<h2>두 수는 모두 양수인가? </h2>
	<%
		if(num1>=0 && num2>=0){
	%>
		
		양수이다.
	<%
		}
	%>
	<h2>EL</h2>
	<!-- gt(=greater than) -->
	<!-- 둘다양수면 true 라고 나옴. -->
	${(param.num1 gt 0) and (param.num2 gt 0)}
	
	<h2>두 숫자가 모두 같은 숫자인가? (예/아니오로 대답)</h2>
	<h2>EL로만</h2>
	${(param.num1 eq param.num2)?"예" : "아니오"}
</body>
</html>
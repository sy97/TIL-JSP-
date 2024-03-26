<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

	%>	
		이름 : <%=request.getParameter("name") %><br>
		아이디 : <%= request.getParameter("id")%><br>
		<hr>
		<h2>EL</h2>
		
		이름 : ${param.name} 또는 ${param["name"]}<br>
		아이디 : ${param.id}<br>
		
		<!-- 이름이 같은 파람이 여러개면 배열로 자동으로 묶임. -->
		<%
		String[] foods = request.getParameterValues("food");
		%>
		<hr>
		첫 번째 음식 : <%=foods[0]%><br>
		두 번째 음식 : <%=foods[1]%><br>
		<hr>		
		<h2>EL</h2>
		첫 번째 음식 : ${paramValues.food[0]}
		또는  ${paramValues["food"][0]} 또는  ${paramValues["food"]["0"]} <br>
		두 번째 음식 : ${paramValues.food[1]}
		<hr>
		
		<!-- checkbox 아무것도 선택하지 않고 넘기면 null값 에러가남. 
		아무것도 없는데 값을 꺼내려고 하니까. -->
		<%
			//String[] hobbies = request.getParameterValues("hobby");
			//for(String h : hobbies){
		%>
		
		취미 : <%//h%><br>
		<% 		
			//}
		%>
		
		<!-- but EL은 아무것도 선택하지 않아도 에러 안뜸. -->
		<hr>
		<h2>EL</h2>
		취미1 : ${paramValues.hobby[0]}<br>
		취미2 : ${paramValues.hobby[1]}<br>
		취미3 : ${paramValues.hobby[2]}<br>
		
		<!-- 반복문은 사용하지 못함. 값이 전달되지 않음. jstl이랑 하면 해결됨. -->

</body>
</html>
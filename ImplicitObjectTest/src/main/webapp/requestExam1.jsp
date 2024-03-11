<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이름과 주소 받아와서 출력하기 -->
	<%
		//전달되는 값은 따로 인코딩 해줘야함.
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	%>
	당신의 이름은<%=name %>이고 주소는<%=addr %>입니다.
	<br><br>
	
	당신의 취미는 다음과 같습니다.<br>	
	<%
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies != null){
			for(String hobby : hobbies){		
	%>
			<!-- 조건이 맞으면 html태그를 보여줘야하니까, 중간에 자바코드 끊어야함. -->
			<li><%=hobby %></li>
	<%
			}
		}
	%>
		
</body>
</html>
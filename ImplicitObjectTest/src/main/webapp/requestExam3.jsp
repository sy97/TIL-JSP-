<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- requestExam1 하나로 묶어주기. -->
	<!-- 이름과 주소 받아와서 출력하기 -->
	<%
		//전달되는 값은 따로 인코딩 해줘야함.
		request.setCharacterEncoding("UTF-8");	
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		//포스트방식일 때는 jsp실행되고, get방식일 때는 html이 실해되게. equalsIgnoreCase는 대소문자 상관없이 비교해주는것.
		if(request.getMethod().equalsIgnoreCase("post")){
	%>
	당신의 이름은 <%=name %>이고 주소는 <%=addr %>입니다.
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
		else {
	%>
	
			<li>선택한 내용이 없습니다.<li>
	
	<%
		}
	}
	else {
	%>
		<!-- html은 처음에는 당연히 겟방식으로 실행됨. 그 다음에 값을 입력해주면 post방식으로 requestExam3.jsp가 실행되는것.
		get방식일 때 html이 실행되고, post방식일 때 jsp가 실행되게끔.  -->
		<form action = "requestExam3.jsp" method="post">
		이름 : <input type="text" name="name" /><br><br>
		주소 : <input type="text" name="addr" /><br><br>
		취미 : <br>
			<input type="checkbox" name="hobby" value="클라이밍">클라이밍<br>
			<input type="checkbox" name="hobby" value="뜨개질">뜨개질<br>
			<input type="checkbox" name="hobby" value="여행">여행<br>
			<input type="checkbox" name="hobby" value="독서">독서<br>
		<input type="submit" value="전송" />	
	</form>
	
	<%
	}
	%>	
</body>
</html>
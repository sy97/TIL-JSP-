<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	a {
	color: black;
	text-decoration: none;
	font-weight: bold
	}
	
	a:hover{
	color: blue;
	}
</style>
</head>
<body>
	<%
	if(session.getAttribute("id")==null && session.getAttribute("pw")==null ){
	%>
		<h2>&#128204;로그인이 필요합니다.</h2>
		<a href="index.jsp">&#128682;메인페이지로</a><br>
	<%
	}
	
	else{
		if(session.getAttribute("id").equals("soyeong") 
			&& session.getAttribute("pw").equals("1234")){
	%>
		<h2>&#128184;soyeong님, 즐거운쇼핑되세요!&#128184;</h2>
		
		<a href="index.jsp">&#128682; 메인페이지로</a>
		<br><br>		
		<a href="logout.jsp">&#128275; 로그아웃</a>

	<% 
		}
	}
	%>
</body>
</html>
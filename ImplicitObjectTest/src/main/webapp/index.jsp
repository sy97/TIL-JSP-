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
	
	<h2>&#127808;환영합니다.&#127808;</h2>
		<a href="login.jsp">&#128274; 로그인</a>
		<br><br>
		<a href="shop.jsp">&#127873; 쇼핑몰</a>		
	
	<%
	}
	else{
		if(session.getAttribute("id").equals("soyeong") 
			&& session.getAttribute("pw").equals("1234")){
	%>
		<h2>soyeong님, 환영합니다.&#128151;</h2>
		
		<a href="logout.jsp">&#128275; 로그아웃</a>
		<br><br>
		<a href="shop.jsp">&#127873; 쇼핑몰</a>		
	<% 
		}
	}
	%>
</body>
</html>
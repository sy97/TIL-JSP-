<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
if(id != null){
	%>
	
	<h2>환영합니다.</h2>
	
	<ul>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="shop.jsp">쇼핑몰</a></li>
	</ul>
<%
}
else {
%>

	<h2>환영합니다.</h2>
	로그인을 해주세요.<br><br>
	
	<ul>
		<!-- 로그인 페이지는 어디에서든 누를 수 있으니까, index눌렀을 때 인덱스로 이동할 수 있게. -->
		<li><a href="login.jsp?menu=index">로그인</a></li>
		<li><a href="shop.jsp">쇼핑몰</a></li>
	</ul>
<%
}
%>

	
</body>
</html>
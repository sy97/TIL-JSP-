<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	호스트 정보 : <%=request.getHeader("host") %><br>
	user-agent 정보 : <%=request.getHeader("user-agent") %><br>
	<hr>
	
	<h2>EL</h2>
	호스트 정보 : ${header.host }<br>
	<!-- 여기서는 []안에 써줘야함. .다음에는 특수문자가 들어갈 수 없어서. -->
	user-agent 정보 : ${header["user-agent"]}<br>
	<hr>
	
	<h3>쿠키 저장</h3>
	<%
		//쿠키 만들기
		//쿠키 저장할 때는 공백 없이.. 
		Cookie cookName = new Cookie("name", "KangSoyeong");
		Cookie cookId = new Cookie("id", "Kang" );
	
		//저장 기간 설정
		cookName.setMaxAge(60 * 60 * 24);
		cookId.setMaxAge(60 * 60 * 24);
	
		response.addCookie(cookName);
		response.addCookie(cookId);
		
	%>
	쿠키가 저장되었습니다. 다음 페이지로 이동해 주세요.<br>
	<a href="test3_proc.jsp">다음 페이지로</a>
	
</<body>
</html>
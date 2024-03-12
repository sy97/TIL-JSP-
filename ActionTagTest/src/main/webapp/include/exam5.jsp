<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>	
	<%
		int i= 100; 
	//header에서 적어준 변수인 i를 또 써봐주기.action태그에선 오류 안났는데, 지시자 include는 에러남.
	%>
	
	<jsp:include page="header.jsp"/>
	<h2>exam5.jsp</h2>
	<%@ include file="footer.jsp" %>
</body>
</html>
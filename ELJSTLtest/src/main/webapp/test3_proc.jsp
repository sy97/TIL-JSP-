<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 정보 확인</h2>
	<%
	Cookie[] cooks = request.getCookies();
	//쿠키를 가져올 때는 골라서 가져올 수 없음. 다가져와야함.
	for(int i =0; i < cooks.length; i++){
		//쿠키이름이 name인것만 가져오려면
		if(cooks[i].getName().equals("name")){
	%>
		<%=cooks[i].getName() %><br>
		<%=cooks[i].getValue() %><br>
	
	<%	
		}
	}
	%>
	
	<hr>
	<h2>EL</h2>
	${cookie.id.value}<br>
	${cookie.name.value}
</body>
</html>
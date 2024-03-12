<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "login.jsp" method="post" required="required" />
	ID : <input type="text" name="ID" required="required"/>
	<br><br>
	PW : <input type="password" name="PW" /><br>
	<input type ="submit" value="login" />
	<input type="reset" value="reset"/>
	</form>
	
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id_input = request.getParameter("ID");
	String pw_input = request.getParameter("PW");
	
	String id = "soyeong";
	String pw = "1234";
			
	if(id_input != null && pw_input != null){
	if(id_input.equals(id) && pw_input.equals(pw)){
		session.setAttribute("id", id_input);
		
		response.sendRedirect("index.jsp");	
	}
	else if(id_input.equals(id) && !pw_input.equals(pw)){
	%>	
		<br>
		PW가 틀렸습니다.&#128531;
	<% 
		}
	else if(!id_input.equals(id) && pw_input.equals(pw)) {		
	%>
		<br>
		ID가 틀렸습니다.&#128531;
	<%
		}
	}
	%>


</body>
</html>
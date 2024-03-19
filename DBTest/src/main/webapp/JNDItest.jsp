<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JNDI 테스트</title>
</head>
<body>
	<%
		//내가 찾고자 하는 장소를 하나의 context로 만들어준것.
		//내가 접근하고싶은 물건을 쓰기좋은 곳에 갖다놓는것.
		Context ctx = new InitialContext();
	
		//위치를 찾아서 DataSource에 저장.
		//java:comp/evn까지는 슈도프로토콜이므로 적어줘야함.
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/EmployeeDB");	
	
		//연결 객체 빌려오기
		Connection conn = ds.getConnection();
		if(conn != null){
			out.println("<h2>연결 성공</h2>");
		}
	%>
</body>
</html>
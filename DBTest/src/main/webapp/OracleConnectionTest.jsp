
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>오라클 연결 테스트</title>
</head>
<body>
	<h1>오라클 연결 테스트</h1>
	
	<%
		Connection conn = null;
	
		try{
			
			/*
			class이름이 class. 특별한 기능을 하진 않고, 클래스를 실행시킬 수 있게 해주는 역할.
			어떤 클래스를 실행시키기 위해 메모리로 올려놓기. 메모리 로드. 
			Class.forName("올려놓을 클래스 이름")
			DB를 사용하기 위해서 가장 먼저 해야할 일.
			*/
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			/*
			드라이버이름@DB서버가설치된 컴퓨터주소(지금은 내컴퓨터라 localhost지만, 
			만약 DB서버가 다른 컴퓨터에 깔려있으면 그 컴퓨터주소적어줘야함.):포트번호(오라클 기본포트는 1521):DB이름"
			*/
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			//DriverManager라는 클래스. 실제 DB와 연결 시도
			//(DB주소, ID, PW)
			conn = DriverManager.getConnection(url, "scott", "1111");
		
			if(conn != null){
				out.println("<h2>연결 성공</h2>");
			}
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			conn.close();
		}
	%>
</body>
</html>
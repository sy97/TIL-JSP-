<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	 
	 String id = request.getParameter("e_id");
	 String name = request.getParameter("e_name");
	 String pass = request.getParameter("e_pass");
	 String address = request.getParameter("e_address");
	 
		//DB에 저장하기
		Connection conn = null;
		//Statement stmt = null;
		
		//해킹방지하기위해 이렇게해야함.
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");		
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111");			
			
			//DB에게 전달해야함.
			//문자열은 반드시 ''로 묶어줘야함.
			
			//근데 이렇게 하면 해킹위험이 있음. sqlinjection. sql 조금만 알면 아이디 패스워드 바로 해킹가능.
			//그걸 방지하기위해 preparestatement 사용해야함. 
			/*
			String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass, e_address)" 
			+ "values(seq_eno.nextVal, '"+id + "', '" + 
			name + "', '" + pass + "', '" + address + "')";	
			*/
			
			//사번은 시퀀스통해서 자동으로 추가되게.
			//변수는 ?로 처리가능. 데이터는 나중에 보내겠다. 이거부터 먼저 가져가서 준비해놔라.
			String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass, e_address)" 
			+ "values(seq_eno.nextVal, ?,?,?,?)";	
			//데이터 실어나를 객체 생성
			//stmt = conn.createStatement();
			
			stmt = conn.prepareStatement(sql);
			
			//데이터는 이렇게 보냄
			//(물음표의 순서, 변수)
			
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, pass);
			stmt.setString(4, address);
			
			//아까는 excuteQuery로, 결과값 가져오게끔 하는건데 여긴 결과값 가져오는건 아니니까 excuteUpdate.
			//stmt.executeUpdate(sql);
			
			//위에서 sql넘겨줬으니까 여기는 sql넘기지 않고, 업데이트만해주면됨.
			stmt.executeUpdate();
		
		%>
			<script>
			alert("잘 추가되었습니다.");
			</script>
	
			<ul>
				<li><a href="index.jsp">메인페이지로 이동</a></li>
				<li><a href="addEmp.html">항목 추가하기</a></li>
			</ul>
			
		<%
		}
		
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
			
			//conn이 null값이면 close가 안돼서 오류남. 그러니까 null이 아닌경우만 close 되게끔.			
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		}

	%>
	


</body>
</html>
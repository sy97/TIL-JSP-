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
<title>updateEmp.jsp</title>
</head>
<%	
		//index.jsp에서 넘어온 사번 받아주기.
		String e_no = request.getParameter("e_no");
		String e_name=null, e_pass=null, e_address=null;
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");		
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111");
			
			//모든 데이터를 가져오는게 아니라 수정하려는 데이터만 가져와야함
			String sql = "select * from tblemp where e_no="+e_no;
	
			//하나의 데이터만 가져오므로 반복문은 필요없음.
			stmt = conn.createStatement();
			//받아온 데이터를 변수에 담아놔야함. db와의 연결이 끊어지면 이 메모리도 사라짐.
			rs = stmt.executeQuery(sql);
			
			e_name = rs.getString("e_name");
			e_pass = rs.getString("e_pass");
			e_address = rs.getString("e_address");
			
		}
		catch(Exception err){
			err.printStackTrace();
		}
		finally{
				
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
		}
		%>
<body>
	<!-- 여기는 데이터 조회해서 꺼내와서, 출력까지 해야하므로 java가 필요함. 그래서 입력과다르게 jsp로. -->
	<h1>정보 수정</h1>
	<form action="updateEmp_proc.jsp" method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="e_id"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="e_name"/></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="e_pass"/></td>
		</tr>
		<tr>
			<th>근무지</th>
			<td>
			<select name="e_address">
			<option>서울</option>
			<option>광주</option>
			<option>부산</option>
			<option>제주</option>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="전송"/>
			&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소"/>
			</td>
			</tr>
		</table>
	</form>

</body>
</html>
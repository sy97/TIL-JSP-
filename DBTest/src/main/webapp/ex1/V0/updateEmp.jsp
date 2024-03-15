<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>updateEmp.jsp</title>
</head>
	<%
		//index.jsp로 받아온 e_no
		String e_no = request.getParameter("e_no");
		String e_id=null, e_name=null, e_pass=null, e_address=null;
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111");
			
			//사번만 들고가서 , 데이터 꺼내오게끔. 
			String sql = "select * from tblEmp where e_no=" + e_no;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				e_id = rs.getString("e_id");
				e_name = rs.getString("e_name");
				e_pass = rs.getString("e_pass");
				e_address = rs.getString("e_address");
			
			}
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
	<h1>직원 수정</h1>
	<form action="updateEmp_proc.jsp" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<!-- 아이디는 수정하지못하게 하려면? readonly-->
				<td><input type="text" name="e_id" value="<%=e_id%>" readonly/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="e_name" value="<%=e_name%>"/></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="e_pass" value="<%=e_pass%>"/></td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<!-- 내가 조회해서 가져온 e_address라는 값이 지역과 같다면, 이미 선택되어지게. 그래서 그값이 보여지게. -->
					<select name="e_address">
						<option <%if(e_address.equals("서울")) {%> selected <%}%>>서울</option>
						<option <%if(e_address.equals("광주")) {%> selected <%}%>>광주</option>
						<option <%if(e_address.equals("부산")) {%> selected <%}%>>부산</option>
						<option <%if(e_address.equals("제주")) {%> selected <%}%>>제주</option>
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
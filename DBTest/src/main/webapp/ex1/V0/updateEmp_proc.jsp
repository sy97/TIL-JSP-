<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	//updateEmp.jsp에서 수정한 데이터를 받아와서, 다시 db에 업데이트 시켜주기.
	
	//id는 수정 못하게 막았으니 안받아옴.
	String no = request.getParameter("e_no");
	String name = request.getParameter("e_name");
	String pass = request.getParameter("e_pass");
	String address = request.getParameter("e_address");
	
	
	//DB에 저장하기
	Connection conn = null;


	PreparedStatement stmt = null;

		
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");		
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				conn = DriverManager.getConnection(url, "scott", "1111");			
				
				String sql = "update tblEmp set(e_no, e_name, e_pass, e_address)" 
				+ "values(?,?,?,?,?)";	
	
				
				stmt = conn.prepareStatement(sql);
				
				
				stmt.setString(1, no);
				stmt.setString(2, name);
				stmt.setString(3, pass);
				stmt.setString(4, address);
				
	
				stmt.executeUpdate();
			
			%>
				<script>
				alert("수정되었습니다.");
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
	
				if(conn != null) conn.close();
				if(stmt != null) stmt.close();

			}

		%>
	

%>
</body>
</html>

<!-- 수정기능만들기 . 그리고 삭제 기능 만들고, 체크박스를 만들어서 체크박스로 다중 삭제할 수 있게 기능 구현 -->
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
	<h1>직원 정보</h1>
	<!-- 자바코드가 들어갈 일이 없어서 html로 만들기. -->
	<a href="addEmp.html">직원 추가</a>
	<br><br>
	
	<!-- 검색기능 -->
	<form action="index.jsp" method="post">
		<select name="keyword">
			<option value="e_id">아이디</option>
			<option value="e_name">이름</option>
			<option value="e_address">주소</option>
		</select>
		<input type="text" name="searchText" />
		<input type="submit" value="검색" />
	</form><br>
	
	<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	%>
	
	
	<table border="1">
		<tr>
			<th>사번</th><th>아이디</th><th>이름</th><th>패스워드</th><th>주소</th><th>수정</th><th>삭제</th>
		</tr>
	
		
		<%
		//DB에서 정보 가져와서 뿌려주기. DB사용하기위해서는 여기까지 기본.
		Connection conn = null;
		
		//닫아줘야하기 때문에 바깥에 먼저 따로 선언해주는것이 좋음.
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String searchText = request.getParameter("searchText");
		
		//예외처리 안해주면 널포인트 에러 생기므로 예외처리해줘야함.
		try {
			if(searchText.isEmpty()){
				sql = "select * from tblEmp order by e_no";
			}
			
			//where다음에 공백줘야함!!!!!!!!!!
			else {
				sql = "select * from tblEmp where " + keyword +" like '%" + searchText +"%'";
				
			}
		}
		catch(NullPointerException Err) {
			sql = "select * from tblEmp order by e_no";
		}
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");		
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "scott", "1111");
			
			//연결 성공했으니 명령어를 사용해서 조회해서 결과값 가져오기.
			//명령어 실어나르기
			//명령어 준비
			//String sql = "select * from tblemp order by e_no";
			//db로 전달할 명령어를 포장할 박스 만들기
			stmt = conn.createStatement();
			
			//박스에 담아서 실어나르고, 결과값 받아서 resultset에 저장하기.
			rs = stmt.executeQuery(sql);
			
			//rs는 포인터가 있는데 첫번째 포인터는 제목을 가리키고있음. 우린 제목은 필요없으니 한칸 밑으로 내려야함.
			
			//next라는 메서드의 리턴값은 true/false. 이동할 값이 있으면 true, 없으면 false.
			//참일동안 계속 출력할 수 있게 while로 반복문 돌려주기.
			while(rs.next()){
				%>
				<tr>
					<td><%=rs.getInt("e_no") %></td>
					<td><%=rs.getString("e_id") %></td>
					<td><%=rs.getString("e_name") %></td>
					<td><%=rs.getString("e_pass") %></td>
					<td><%=rs.getString("e_address") %></td>
					<!-- 사번으로만 비교해서 수정할 수 있게, 사번만 갖고 넘어가기. -->
					<td><a href="updateEmp.jsp?e_no=<%=rs.getInt("e_no") %>">수정</a></td>
					<td><a href="deleteEmp.jsp?e_no=<%=rs.getInt("e_no") %>">삭제</a></td>
					
				</tr>	
				
			<% 
			}
			
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

	</table>
	
</body>
</html>
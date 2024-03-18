<%@page import="mybean.dto.Employee"%>
<%@page import="java.util.ArrayList"%>
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
<script>

	//숫자 넘겨줘야하므로 ?이하부분도 잘 적어주기.
	function isDelete(e_no){
	 let cf = confirm("삭제하시겠습니까?");
	 if(cf == true){
		 location.href="deleteEmp.jsp?e_no="+e_no;
	 }
	
	 return;
	 
	}
</script>
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
		
	
		
		<%
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String searchText = request.getParameter("searchText");
		%>
	<jsp:useBean id="list" class="mybean.dao.EmployeeDao"/>
	<%
		ArrayList<Employee> emps= list.getList(keyword, searchText);
		for(int i = 0; i < emps.size(); i++){
		Employee emp = emps.get(i);
	%>
		<td><%=emp.getE_no()%></td>
		<td><%=emp.getE_id() %></td>
		<td><%=emp.getE_name() %></td>
		<td><%=emp.getE_pass() %></td>
		<td><%=emp.getE_address()%></td>
		
		</tr>
	<%
		}
	%>
	</table>
	
</body>
</html>
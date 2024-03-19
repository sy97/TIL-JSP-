
<%@page import="mybean.dto.Employee"%>
<%@page import="java.util.ArrayList"%>
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
<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"/>
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
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		String searchText = request.getParameter("searchText");
		//예외처리 안해주면 널포인트 에러 생기므로 예외처리해줘야함.
	
		try{
			ArrayList<Employee> list = dao.getList(keyword, searchText);
			for(Employee emp : list){
		%>
		
				<tr>
					<td><%=emp.getE_no() %></td>
					<td><%=emp.getE_id() %></td>
					<td><%=emp.getE_name() %></td>
					<td><%=emp.getE_pass() %></td>
					<td><%=emp.getE_address() %></td>
					<!-- 사번으로만 비교해서 수정할 수 있게, 사번만 갖고 넘어가기. -->
					<td><a href="updateEmp.jsp?e_no=<%=emp.getE_no() %>">수정</a></td>
					<td><a href="deleteEmp.jsp?e_no=<%=emp.getE_no() %>">삭제</a></td>
					
				</tr>	
				
			<% 
			}
			
		}
		
		catch(Exception err){
			err.printStackTrace();
		}
		
		%>

	</table>
	
</body>
</html>
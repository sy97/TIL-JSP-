<%@page import="mybean.dto.Employee"%>
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
	
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"/>
	
	<%
		//index.jsp로 받아온 e_no
		String e_no = request.getParameter("e_no");
	
		//dao객체 생성후, 위에 받아온 e_no를 get메서드에 매개변수로 넘겨주기.
		//return 형태가 Employee객체니까 Employee로 받아야함.
		// 그래서 이 사번에 해당하는 정보를 가져오기.
		Employee emp = dao.getEmp(e_no);
	%>
	
<body>
	<h1>직원 수정</h1>
	<form action="updateEmp_proc.jsp" method="post">
	<!-- 겟방식으로 바로 주소에 넘겨줄 수 있지만, 좀 지저분함. 히든 태그 사용하면 됨.-->
	<input type="hidden" name="e_no" value="<%=e_no%>"/>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="e_id" value="<%=emp.getE_id()%>" readonly/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="e_name" value="<%=emp.getE_name()%>"/></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="e_pass" value="<%=emp.getE_pass()%>"/></td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<!-- 내가 조회해서 가져온 e_address라는 값이 지역과 같다면, 이미 선택되어지게. 그래서 그값이 보여지게. -->
					<select name="e_address">
						<option <%if(emp.getE_address().equals("서울")) {%> selected <%}%>>서울</option>
						<option <%if(emp.getE_address().equals("광주")) {%> selected <%}%>>광주</option>
						<option <%if(emp.getE_address().equals("부산")) {%> selected <%}%>>부산</option>
						<option <%if(emp.getE_address().equals("제주")) {%> selected <%}%>>제주</option>
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
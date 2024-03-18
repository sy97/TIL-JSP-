<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateEmp_proc.jsp 수정된 값을 DB에 저장</title>
</head>
<body>
	<%
	 	//updateEmp.jsp에서 전달한 데이터 받아오기
	 	request.setCharacterEncoding("utf-8");
	%>
		<!-- updateEmp.jsp에서 넘어온 데이터를 bean에 저장해주기. -->
		<jsp:useBean id="dto" class="mybean.dto.Employee"/>
		<jsp:setProperty property="*" name="dto"/>
		<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"></jsp:useBean>
	<%
		//넘겨받는 값이 단일이 아니므로, 액션태그 쓸 수 없음.
		//넘겨줄 때 아까 설정한 객체를 매개변수로 넘겨줌.
		dao.updateEmp(dto);
	%>	
		<script>
			alert("수정되었습니다.");
		</script>
	
		<ul>
			<li><a href="index.jsp">메인 페이지로</a></li>
			<li><a href="addEmp.html">추가 페이지로</a></li>
		</ul>

</body>
</html>
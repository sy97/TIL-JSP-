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
	%>
	
	<!-- bean에 데이터 저장하기. -->
	<jsp:useBean id="dto" class="mybean.dto.Employee" />
	<!-- 모든 값을 넘겨줄거니까 *로 처리가능. -->
	<!-- DB에 저장하기 위해 잠시 dto에 보관. -->
	<jsp:setProperty property="*" name="dto"/>
	
	<!-- dto에 보관되어있는 정보들을 DB에 저장. -->
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"/>
	<!-- 값이 여러개이기 때문에 액션태그로 넘겨줄 수 없음. -->
	<%
		dao.setEmp(dto);
	%>
	
	<script>
	alert("잘 추가되었습니다.");
	</script>
	
	<ul>
		<li><a href="index.jsp">메인페이지로 이동</a></li>
		<li><a href="addEmp.html">항목 추가하기</a></li>
	</ul>
			
	

</body>
</html>
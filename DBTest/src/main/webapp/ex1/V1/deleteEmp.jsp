<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteEmp.jsp 값 삭제</title>
</head>
<body>
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"/>
	<!-- 프로퍼티와 param이 이름이 다르기 때문에 param잘 적어줘야함. 
	저 파람이 request.getparameter로 넘어오는 값을 자동으로 넘겨주므로,
	굳이 받아와서 변수에 저장하지 않아도됨.  -->
	<jsp:setProperty property="deleteEmp" name="dao" param="e_no"/>
	
		<script>
			alert("삭제되었습니다.");
		</script>
	
		<ul>
			<li><a href="index.jsp">메인 페이지로</a></li>
			<li><a href="addEmp.html">추가 페이지로</a></li>
		</ul>
		
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR"%>
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
	
	<!-- bean�� ������ �����ϱ�. -->
	<jsp:useBean id="dto" class="mybean.board.BoardDto" />
	<!-- ��� ���� �Ѱ��ٰŴϱ� *�� ó������. -->
	<!-- DB�� �����ϱ� ���� ��� dto�� ����. -->
	<jsp:setProperty property="*" name="dto"/>
	
	<!-- dto�� �����Ǿ��ִ� �������� DB�� ����. -->
	<jsp:useBean id="dao" class="mybean.dao.EmployeeDao"/>
	<!-- ���� �������̱� ������ �׼��±׷� �Ѱ��� �� ����. -->
	<%
		//dao.setEmp(dto);
	%>
	
	<script>
	alert("�� �߰��Ǿ����ϴ�.");
	</script>

</body>
</html>	
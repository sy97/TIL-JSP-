<%@page import="mybean.model.member"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="mybean.model.member"/>
<%
	//controller에서 request에 저장해놨기 때문에 이렇게 꺼내서 사용가능.
	dto = (member)request.getAttribute("dto");
%>
<script>
	function goBack(){
		window.history.back();
	}
</script>
<body>
	<h1>회원가입 확인</h1>
	<form action="/MVCtest/member?command=complete"  method="post">
		당신이 입력한 내용은 다음과 같습니다.<br>
		<ul>
			<li>아이디 : <%=dto.getId() %></li>
			<li>패스워드 : <%=dto.getPass() %></li>
			<li>이메일 : <%=dto.getEmail() %></li>
		</ul>
		<input type="submit" value="가입완료" />&nbsp;&nbsp;&nbsp;
		<input type="button" value="뒤로" onclick="goBack()" />
	</form>
</body>
</html>
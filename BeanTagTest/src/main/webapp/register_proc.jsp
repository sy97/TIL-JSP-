<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>register_proc.jsp</title>
</head>
<body>
	<!-- bean에 값 저장 -->
	<jsp:useBean id="mem" class="mybean.MemberDto"/>
	<!-- param이 숨겨져있기 때문에 html에 form태그로 묶여있는 것들의 값이 넘어오는것. -->
	<!-- 값을 골라서 가져올게 아니라 모두 가져올거라면, *로 처리할 수 있음. -->
	<jsp:setProperty property="*" name="mem"/>
	
	<h2>입력 내용 확인</h2>
	아이디 : <jsp:getProperty property="mem_id" name="mem"/><br>
	비밀번호 : <jsp:getProperty property="mem_pw" name="mem"/><br>
	이름 : <jsp:getProperty property="mem_name" name="mem"/><br>
	이메일 : <jsp:getProperty property="mem_email" name="mem"/><br>
	전화번호 : <jsp:getProperty property="mem_tel" name="mem"/><br>
	주소 : <jsp:getProperty property="mem_addr" name="mem"/>
</body>
</html>
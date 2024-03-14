<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>counter.jsp</title>
</head>
<body>
	<h1>전체 방문자 수 확인</h1>
	<!-- scope를 세션으로 하면 안됨. 전체 몇명이 왔는지 확인해야하므로 application. -->
	<jsp:useBean id="counter" class="scope.CounterBean" scope="application">
	<!-- 처음한번만 실행되게끔 사이에 끼워주기. -->
	<jsp:setProperty property="newVisit" name="counter" value="1"/>
	</jsp:useBean>
	
	<jsp:setProperty property="restart" name="counter"/>
	<h2>전체 방문자 수 : <jsp:getProperty property="visitCount"
	name="counter"/> </h2>
	
	<form>
		<input type="submit" name="refresh" value="새로 고침"/>
		&nbsp;&nbsp;&nbsp;
		<input type="submit" name="restart" value="카운터를 0으로 리셋"/>
	</form>
</body>
</html>

<!-- 방문자 숫자를 파일로 저장할 수 있게. 그리고 새로고침 했을 때, 기존 방문자면 카운트되지않게. -->
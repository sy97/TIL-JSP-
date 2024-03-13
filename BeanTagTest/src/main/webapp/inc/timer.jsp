<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션을 이용한 타이머 예제</h1>
	<jsp:useBean id="timer" class="scope.TimerBean"/>
	세션 시작합니다. 타이머 작동을 시작합니다.
	
	bean의 프로퍼티를 마지막으로 접근한 뒤에 경과한 시간은
	<jsp:getProperty property="elapsedTimeAfterLastAccess" name="timer"/>
	초 입니다.<br><br>
	
	<jsp:setProperty property="restart" name="timer"/>
	
	타이머를 리셋한 뒤에 경과된 시간은   
	<jsp:getProperty property="elapsedTime" name="timer"/>
	초 입니다.<br><br>
	
	타이머가 시작된 뒤에 경과된 시간은   
	<jsp:getProperty property="elapsedTimeAfterInst" name="timer"/>
	초 입니다.<br><br>
	
	<!-- 액션을 생략하면 액션은 기본값으로 자기페이지 -->
	<form method="post">
		<input type="submit" value="경과시간 확인" name="check"/>&nbsp;&nbsp;&nbsp;
		<input type="submit" value="타이머 리셋" name="restart"/>
	</form>
</body>
</html>
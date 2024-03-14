<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션을 이용한 타이머 예제</h1>
	<!-- scope를 세션으로 해줘야 사용자마다의 시간이 저장됨. 
	세션으로 해줄 경우, 브라우저가 다르면 각자 카운트함. but application으로 해주면
	시간이 똑같이 나옴. -->
	<jsp:useBean id="timer" class="scope.TimerBean" scope="session">
	<!-- 처음에만 보이고 다음부턴 안보여주게 객체 생성될 때 한번만 보이도록 여기에 넣어주기. -->
	세션 시작합니다. 타이머 작동을 시작합니다.<br><br>
	</jsp:useBean>	
	
	<!-- bean의 모든 메서드가 프로퍼티. 액션태그로 불러서 쓸 수 있는거는 모두 프로퍼티.
	 다음 메서드 실행하기까지의 경과시간 -->
	bean의 프로퍼티를 마지막으로 접근한 뒤에 경과한 시간은
	<jsp:getProperty property="elapsedTimeAfterLastAccess" name="timer"/>
	초 입니다.<br><br>
	
	<!-- param이 생략되어있기 때문에 프로퍼티랑 이름이 똑같은 restart버튼이 전달됨. -->
	<jsp:setProperty property="restart" name="timer"/>
	
	<!-- 버튼 누르고 나서의 경과시간 -->
	타이머를 리셋한 뒤에 경과된 시간은   
	<jsp:getProperty property="elapsedTime" name="timer"/>
	초 입니다.<br><br>
	
	<!-- 사용자가 처음 접속(객체생성된)한 이후로부터의 시간 -->
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
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
	<jsp:useBean id="parking" class="mybean.ParkingBean" scope="application"/>
<body>
	
	<jsp:setProperty property="enter" name="parking"/>
	
	<h1>주차 관리 프로그램</h1>
	<form method="post">
		주차장에 들어온 차 번호 : <input type="text" name="enter"/>
		&nbsp;&nbsp;&nbsp;<input type="submit" value="입차" />
	</form>
	
	<form method="post">
		주차장에서 나간 차 번호 : <input type="text" name="exit"/>
		&nbsp;&nbsp;&nbsp;<input type="submit" value="출차" />
	</form>
	<hr/>
	
	주차된 차량 목록<br><br>
	<table border="1">
		<tr>
			<td>차량 번호</td> <td>입차 시간</td>
		</tr>
	</table>
	<br>
	총 주차대수 :  <jsp:getProperty property="counter" name="parking"/>대
	
</body>
</html>
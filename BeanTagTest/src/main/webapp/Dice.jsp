<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dice.jsp</title>
</head>
<body>
	<jsp:useBean id="dice" class="scope.DiceBean" scope="session" />
	<jsp:setProperty property="minNumber" name="dice" value="1"/>
	<jsp:setProperty property="maxNumber" name="dice" value="6"/>
	<h1>주사위 게임</h1>
	<h2>주사위 눈금은
	<jsp:getProperty property="randomNumber" name="dice"/>
	 입니다.</h2>
	 
	<!-- 
	scope가 page일때, 
	submit을 누를 때마다 객체가 사라졌다가 계속 다시 생성되고. 이걸 반복하고있음.
	
	 -->
	<form>
		<input type="submit" value="주사위 다시 굴리기" />
	</form>
	<br><br>
	카운터 : <jsp:getProperty property="counter" name="dice"/>
</body>
</html>
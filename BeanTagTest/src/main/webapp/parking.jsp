<%@page import="mybean.CarDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
	<!-- 입출차 시스템을 여러명이 볼 수 있어야하니까 스코프는 application. -->
	<jsp:useBean id="parking" class="mybean.ParkingBean" scope="application"/>
	<% 
	//어차피 출력되는 곳은 여기니까 여기에 인코딩
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	%>

<body>
	
	<jsp:setProperty property="enter" name="parking"/>
	
	<h1>주차 관리 프로그램</h1>
	<form method="post">
		주차장에 들어온 차 번호 : <input type="text" name="enter"/>
		&nbsp;&nbsp;&nbsp;<input type="submit" value="입차" />
	</form>
	
	<jsp:setProperty property="exit" name="parking"/>
	<form method="post">
		주차장에서 나간 차 번호 : <input type="text" name="exit"/>
		&nbsp;&nbsp;&nbsp;<input type="submit" value="출차" />
	</form>
	<hr/>
	
	주차된 차량 목록<br><br>
	<table border="1">
		<tr>
			<td>차량 번호</td> <td>입차 시간</td>
			<!-- getproperty는 값을 하나만 가져올 수 있을 때만 쓸수있음.  -->
			</tr>
			<%
			//usebean에서 만든건 스크립트릿 안에서 쓸 수 있음.
			//둘다 import해줘야함. ctrl+spacebar
			ArrayList<CarDto> cars= parking.getCarInfo();
			//얘가 carList
			
				for(int i = 0; i < cars.size(); i++){
					//컬렉션이니까 이렇게 꺼내와야함.
					CarDto car = cars.get(i);
				
			%>
					<td><%=car.getPlateNumber() %></td>
					<td><%=car.getParkingTime() %></td>
										
				</tr>
			<%
				}
			%>	
	
	</table>
	<br>
	총 주차대수 :  <jsp:getProperty property="counter" name="parking"/>대
	
</body>
</html>
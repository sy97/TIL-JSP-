<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date, java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>calendar.jsp</title>
</head>
<body>
	<%
		Date today = new Date();
	
		//calendar는 싱글톤이라서 객체생성이 조금 다름.  
		Calendar cal = Calendar.getInstance();
	%>
	
	오늘은 <%=today %>입니다.<br>
	<%=cal.get(Calendar.YEAR) %>년 &nbsp;
	<!-- 월은 더하기 1해줘야함. Calendar에서 월은 0부터시작하기때문에, 3월인 현재 2월로나옴. -->
	<%=cal.get(Calendar.MONTH) + 1 %>월 &nbsp;
	<%=cal.get(Calendar.DATE) %>일 &nbsp;
	
	<hr/>
	
	<!-- 이거랑 똑같은 모양으로 액션태그 사용해서 출력 -->
	<jsp:useBean id="curDate" class="simple.CalendarBean" scope="page"/>
	오늘은 <jsp:getProperty property="today" name="curDate"/>입니다. <br>
	<jsp:getProperty property="year" name="curDate"/>년&nbsp; 
	<jsp:getProperty property="month" name="curDate"/>월&nbsp; 
	<jsp:getProperty property="date" name="curDate"/>일 입니다. 
	<br><br>
	<jsp:setProperty property="greeting" name="curDate"
		value="좋은 아침입니다."/>
	인사말 : <jsp:getProperty property="greeting" name="curDate"/>
</body>
</html>

<!-- 클래스 설계도 
	
	class name: simple.CalendarBean
	constructor : yes
	property:
	w가 없는 이유는 세터가없으면 생성자로 만들면 되기 때문..?.... 먼소리.
		name		r/w			date type
		---------------------------------
		today		r			Date
		year		r			int
		month		r			int
		date		r			int

-->
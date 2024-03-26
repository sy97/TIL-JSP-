<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h2>기존 프린트 방식</h2>
	<%request.setAttribute("cnt1", 100);%>
	<%out.println(request.getAttribute("cnt1") + "<br>");%>
	<%= request.getAttribute("cnt1") %><br>
	<%
		int cnt2 = (int)(request.getAttribute("cnt1"));
	%>
	<%=cnt2 %><br>
	<hr>
	
	<h2>EL로 바꾸기</h2>
	
	<!-- EL안에 attribute 이름이 올 수 있다. -->
	${cnt1}<br>
	<!-- cnt2는 안됨. cnt2는 단순 지역변수이기 때문에. -->
	${cnt2}
	<!-- 원래는 이렇게 적어줘야함. 근데 생략해줘도 가능함. -->
	${requestScope.cnt1}<br>
	<!-- pageScope는 안나옴.정확하게 request에 저장된 속성이기 때문에 request에서 꺼내오는게맞음. -->
	${pageScope.cnt1}<br>
	<!-- 그럼 위에 cnt1만 적어줬을 때는 request인지 어떻게 알고 꺼내온걸까?
	알고 꺼내온게 아니고, 처음에 page에서 찾고, 없으면 request에서 찾고, 거기도 없으면 session, 없으면 application에서 찾음. -->
	<% session.setAttribute("cnt3", 300); %>
	${cnt3}<br>
	<!-- 원래는 아래처럼 적어줘야함. -->
	${sessionScope.cnt3}<br>
	${sessionScope["cnt3"]}
	
</body>
</html>
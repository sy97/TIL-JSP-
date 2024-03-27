<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String[] foods = {"불고기", "오므라이스", "짜장면"};
	
	 //el에서도 쓸수있게 request에 저장하기
	 request.setAttribute("foods", foods);
	%>
	
	<%
		//먼저 꺼내오기
		String[] arrFoods = (String[])request.getAttribute("foods");
		for(String s : arrFoods){
	%>
		<%=s %><br>
	<% 		
		}
	%>
	<hr>
	<h2>EL/JSTL</h2>
	<!-- 시작값, 끝값 , 증가값, 인덱스값 저장할 변수-->
	<c:forEach begin="0" end="3" step="1" var="i">
		<!-- request에 저장되어있기 때문에 이렇게만 적어줘도됨. -->
		${foods[i]}<br>
	</c:forEach>
	<hr>
	<!-- string str : foods 랑 같은것. -->
	<c:forEach var="str" items="${foods}">
		${str}<br>
	</c:forEach>
	<hr>
	<c:set var="guests" value="토끼/거북이*너구리-기린,고양이"/>
	<!-- stringtoknizer와 반복문을 합쳐놓은 액션태그가있음.
	delims에는 구분자 모두 적어주기 -->
		
	<c:forTokens items="${guests}" delims="/*-," var="token">
		${token}<br>
	</c:forTokens>
	
	<hr>
	<!-- 페이지 이동. 실행하면 바로 test4로 감. 파라미터도 안에 품고 갈 수 있음.-->
	<c:redirect url="test4.jsp">
		<c:param name="name" value="강소영" />
		<c:param name="age" value="27세" />
	</c:redirect>
</body>
</html>
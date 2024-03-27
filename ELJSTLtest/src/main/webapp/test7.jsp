<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 서블릿에서 req.setattribute에서 담은 걸 꺼내오기 
	원래는 정확하겐 requestScope.name이라고 해야하는데 생략가능하니까 name
	그런데 req.setattribute안해줘도 이미 request의 parameter에 있기 때문에 param.name으로 해줘도됨.-->
	<h2>${param.name }님! 환영합니다.</h2>
	<!-- requestScope는 생략 가능 -->
	총 방문자 수 : ${visitCount }명<br>
	<hr>
	${param.name }님이 좋아하는 음식<br>
	<!-- foods는 param에 담겨져있는게 아니기 때문에 그냥 바로 적어줘도됨. -->
	${foods[0]}
	${foods[1]}
	${foods[2]}
	${foods[3]}
	${foods[4]}
	<hr>
	
	모모의 주인 이름 : ${person.name }<br>
	강소영의 강아지 이름 : ${person.dog.name}<br>
</body>
</html>
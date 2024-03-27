<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4.jsp</h1>
	이름 : ${param.name }<br>
	나이 : ${param.age}
	
	<hr>
	<h1>내가 좋아하는 영화들</h1>
	<c:forEach var="m" items="${movies}">
		${m}<br>
	</c:forEach>
	s
	<hr>
	<h1>댓글 리스트</h1>
    <!-- 여기에 임의의 댓글을 출력한다. -->
    <br><br><br>
    <c:forEach var="c" items="${com}">
		${c}<br>
	</c:forEach>
    
    <!-- 회원일 경우에만 아래의 댓글 작성 폼이 보여지게 한다. -->
    <form>
    	댓글 작성<br>
    	<textarea rows="3" cols="60"></textarea>
    	<input type="submit" value="댓글 달기" />
    	
    </form>
</body>
</html>
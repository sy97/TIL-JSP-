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
	
	<hr>
	<h1>댓글 리스트</h1>
    <!-- 여기에 임의의 댓글을 출력한다. -->
  
  	<c:forEach begin="0" end="2" step="1" var="i">
		<!-- request에 저장되어있기 때문에 이렇게만 적어줘도됨. -->
		유저${i+1} :  ${com[i]}<br>
	</c:forEach>
    
    
    <br><br>
    <!-- 회원일 경우에만 아래의 댓글 작성 폼이 보여지게 한다. -->
    <c:choose>
    	<c:when test="${empty param.id }">
    		<form>
        	ID : <input type="text" name="id"/>
    		PW : <input type="password" name="pass"/>
    		<input type="submit" value="login" />
    		</form>
    	</c:when>
    	<c:otherwise>
    		<c:if test="${param.id eq 'soyeong'}">
    			<form>
    			<b>댓글 작성</b><br><br>
				<textarea rows="3" cols="60" name="reply"></textarea><br>
				<input type="submit" value="댓글 달기" />
				</form> 
   			</c:if>
   		</c:otherwise>
   	</c:choose>
</body>
</html>
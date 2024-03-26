<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="test2_proc.jsp">
		이름 : <input type="text" name="name" /><br><br>
		ID : <Input type="text" name="id" /><br><br>
		
		첫번째 좋아하는 음식 : <input type="text" name="food"/><br><br>
		두번째 좋아하는 음식 : <input type="text" name="food"/><br><br>
		
		<input type="checkbox" name="hobby" value="게임"/>게임<br>
		<input type="checkbox" name="hobby" value="클라이밍"/>클라이밍<br>
		<input type="checkbox" name="hobby" value="뜨개질"/>뜨개질<br>
		
		<br><br>
		<input type="submit" value ="전송" />
	</form>
</body>
</html>
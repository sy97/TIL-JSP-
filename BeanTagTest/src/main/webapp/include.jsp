<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
</head>
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"></jsp:useBean>
<jsp:setProperty property="header" name="incl" />
<jsp:setProperty property="footer" name="incl" />
<body>
	<jsp:include page="inc/header.jsp"></jsp:include>
	<hr>
	
	<form method="post">
	<!--  입력한 머리말 꼬리말 내용을 빈객체에 저장해놓고 액션태그로 꺼내옴-->
	머리말에 들어갈 내용 : <br>
	<textarea rows="2" cols="60" name="header"></textarea>
	<br><br>
	
	꼬리말에 들어갈 내용 : <br>
	<textarea rows="2" cols="60" name="footer"></textarea>
	<br><br>
	
	<input type="submit" value="새로 고침" />
	</form>

	<hr>
	<jsp:include page="inc/footer.jsp"></jsp:include>

</body>
</html>
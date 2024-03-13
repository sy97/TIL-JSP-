<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
</head>
<% 
//어차피 출력되는 곳은 여기니까 여기에 인코딩
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"/>
<jsp:setProperty property="header" name="incl" param="header"/>
<jsp:setProperty property="footer" name="incl" param="footer"/>
<!-- 이전까지는 value로 값을 넘겨줬음. 이건 고정값. 지금은 상황이다름. 우리가 입력한 내용을 전달하는것.
이럴 땐 value라고 쓰면 안됨. 실행중에 값이 입력될 때는 param. 아래 form태그에 있는 header랑 footer랑 연결
기본값은 원래 param임.그래서 안써줬는데도 된것.그리고 아까 안써줬는데도 된건, 안써주면 property이름이 자동으로 param이름이됨.-->
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
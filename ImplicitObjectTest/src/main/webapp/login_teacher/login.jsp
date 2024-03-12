<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String id= request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//로그인되고나서 그냥 바로 쇼핑몰로 이동할 수 있게끔 하기
	String menu = request.getParameter("menu");
		

	//if문으로 묶어주지 않아도 비교순서를 바꿔주면 에러가나지않음.
	if("hong".equals(id) && "1111".equals(pw)){
		//인증처리
		session.setAttribute("id", id);
		
		if(menu.equals("shop"))
		response.sendRedirect("shop.jsp");
		
		else
		response.sendRedirect("index.jsp");
			
		}
		
	%>
	
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id" /><br><br>
		비밀번호 : <input type="password" name="pw" /><br><br>
		
		<!-- 화면에 보이지는 않지만 데이터는 전달하는 태그, 여기서 메뉴 값 받아오기 -->
		<input type="hidden" name="menu" value="<%=menu%>" />
		<input type="submit" value="로그인"/>
		<input type="reset" value="취소"/>
	</form>
	


</body>
</html>
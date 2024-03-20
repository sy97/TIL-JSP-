<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	
	<!-- bean에 데이터 저장하기. -->
	<jsp:useBean id="dto" class="mybean.board.BoardDto" />
	<!-- 모든 값을 넘겨줄거니까 *로 해주려고했는데 이게 불가능. property랑 넘어오는 name이 다르기 때문.
	그럼 이 이름하나 때문에 헤택을 못받는다. post이름 바꿔주기.
	 -->
	<jsp:setProperty property="*" name="dto"/>
	
	
	<!-- dto에 보관되어있는 정보들을 DB에 저장. -->
	<jsp:useBean id="dao" class="mybean.board.BoardDao"/>
	<!-- 값이 여러개이기 때문에 액션태그로 넘겨줄 수 없음. -->
	<%
		dao.setBoard(dto);
		response.sendRedirect("List.jsp");
	%>
	
	
	<script>
	alert("잘 추가되었습니다.");
	</script>
	
</body>
</html>	
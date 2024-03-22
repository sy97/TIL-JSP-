<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>replyproc.jsp</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	
	<!-- reply에서 히든태그로 넘어온 pos와depth가 dto로 묶여서 같이 넘어옴. -->
	<jsp:useBean id="dto" class="mybean.board.BoardDto" />
	<!-- 지금 여기는 답변글의 내용만 담겨있음. -->
	<jsp:setProperty property="*" name="dto"/>


	<jsp:useBean id="dao" class="mybean.board.BoardDao"/>

	
	<%
	//일반 글쓰기처럼 그냥 저장하면 안됨.
		dao.replyBoard(dto);
		response.sendRedirect("List.jsp");
	%>
	
	
	<script>
	alert("잘 추가되었습니다.");
	</script>
	
</body>
</html>	
<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

		<jsp:useBean id="dto" class="mybean.board.BoardDto"/>
		<jsp:setProperty property="*" name="dto"/>
		<jsp:useBean id="dao" class="mybean.board.BoardDao"/>
	<%
	 	//updateEmp.jsp에서 전달한 데이터 받아오기
		BoardDto original = dao.getBoard(dto.getB_num());


		//넘겨받는 값이 단일이 아니므로, 액션태그 쓸 수 없음.
		//넘겨줄 때 아까 설정한 객체를 매개변수로 넘겨줌.
	
		if(dto.getB_pass().equals(original.getB_pass())){
			dao.updateBoard(dto);
			response.sendRedirect("List.jsp");
		}
		
		else{	
		
	%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>

	<%
		}
	%>
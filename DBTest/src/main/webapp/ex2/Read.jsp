<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
	
	<jsp:useBean id="dao" class="mybean.board.BoardDao"/>
	<jsp:useBean id="dto" class="mybean.board.BoardDto"/>
	
	<%
		//list.jsp로 받아온 b_pass
		int b_num = Integer.parseInt(request.getParameter("b_num"));
	
		//dao객체 생성후, 위에 받아온 e_no를 get메서드에 매개변수로 넘겨주기.
		//return 형태가 Employee객체니까 Employee로 받아야함.
		// 그래서 이 사번에 해당하는 정보를 가져오기.
		BoardDto board = dao.getBoard(b_num);
		dao.setCount(b_num);
	%>
<script>
function list() {
    window.location.href = 'List.jsp';
}
</script>	
<body>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=9CA2EE height=25 align=center class=m>글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr> 
	 <td align=center bgcolor=#dddddd width=10%> 이 름 </td>
	 <td bgcolor=#ffffe8><%=board.getB_name() %></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록날짜 </td>
	 <td bgcolor=#ffffe8><%=board.getB_regdate() %></td>
	</tr>
    <tr>
	 <td align=center bgcolor=#dddddd width=10%> 메 일 </td>
	 <td bgcolor=#ffffe8 ><%=board.getB_email() %></td> 
	 <td align=center bgcolor=#dddddd width=10%> 홈페이지 </td>
	 <td bgcolor=#ffffe8 ><a href="http://" target="_new">http://<%=board.getB_homepage() %></a></td> 
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=#ffffe8 colspan=3><%=board.getB_subject() %></td>
   </tr>
   <tr>
   	<!-- 글 쓴 사람이 엔터 쳤다면, 엔터까지 인식을 해줘야함. 엔터는 \n 인데, html은 저걸 인식못하고
   	<br>태그로 인식하기 때문에. 그래서 \n을 <br>태그로 바꿔줘야함. --> 
    <td colspan=4><%=board.getB_content().replace("\n", "<br>") %></td>
   </tr>
   <tr>
    <td colspan=4 align=right>
     <%=board.getB_ip() %>로 부터 글을 남기셨습니다./  조회수 : <%=board.getB_count() + 1%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:list()">목 록</a> |
	<!-- 여기서 가져가는 글번호가 부모글이 되는것. -->
	<a href="Reply.jsp?b_num=<%=b_num%>">답 변</a> | 
	<a href="Update.jsp?b_num=<%=b_num%>">수 정</a> |
	<a href="Delete.jsp?b_num=<%=b_num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>
</body>
</html>

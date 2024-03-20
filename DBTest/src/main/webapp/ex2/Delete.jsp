<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.b_pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.b_pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
		<jsp:useBean id="dto" class="mybean.board.BoardDto"/>
		<jsp:useBean id="dao" class="mybean.board.BoardDao"/>
	<%
		int b_num = Integer.parseInt(request.getParameter("b_num"));	
		BoardDto original = dao.getBoard(b_num);

		//넘겨받는 값이 단일이 아니므로, 액션태그 쓸 수 없음.
		//넘겨줄 때 아까 설정한 객체를 매개변수로 넘겨줌.
	try{
		if(dto.getB_pass().equals(original.getB_pass())){
			dao.deleteBoard(b_num);
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
	}
 	catch(Exception e) {
 		
 	}
	%>
	
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="Delete.jsp?b_num=<%=b_num %>" >
 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="b_pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>

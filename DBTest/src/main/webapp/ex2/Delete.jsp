<%@page import="mybean.board.BoardDto"%>
<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {
		if (document.form.b_pass.value == "") {
		alert("�н����带 �Է��ϼ���.");
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

		//�Ѱܹ޴� ���� ������ �ƴϹǷ�, �׼��±� �� �� ����.
		//�Ѱ��� �� �Ʊ� ������ ��ü�� �Ű������� �Ѱ���.
	try{
		if(dto.getB_pass().equals(original.getB_pass())){
			dao.deleteBoard(b_num);
			response.sendRedirect("List.jsp");
		}
		
		else{	
		
	%>
		<script>
			alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
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
      ������� ��й�ȣ�� �Է��� �ּ���.</td>
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
	  <input type=button value="�����Ϸ�" onClick="check()"> 
      <input type=reset value="�ٽþ���"> 
      <input type=button value="�ڷ�" onClick="history.back()">
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

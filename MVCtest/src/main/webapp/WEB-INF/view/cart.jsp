<%@page import="mybean.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
 ArrayList<Book> bookList = (ArrayList<Book>)session.getAttribute("bookList");
%>
<body>
	<b>현재 주문한 도서</b>
	<table border="1">
		<tr>
			<th width="150px">도서 제목</th><th width="100px">작가</th><th width="80px">가격</th><th>수량</th><th>삭제</th>
		</tr>
		<tr>	
			<%
			if(bookList != null){
			for(int i = 0; i < bookList.size(); i++){
				Book b = bookList.get(i);
			%>
		<tr>
			<td><%=b.getTitle() %></td>
			<td><%=b.getAuthor() %></td>
			<td><%=b.getPrice() %></td>
			<td><%=b.getQuantity() %></td>
			<td>
				<form action="/MVCtest/book?command=del" method="post">
				<input type="submit" value="삭제"/>
				<input type="hidden" name="index" value=<%=i %> />
				</form>
			</td>
		</tr>	
			
			<%	
				}
			}
			%>
		</tr>
	</table>
	<br>
	
	<!-- 구매 페이지로 -->
	<form action="/MVCtest/book?command=checkout" method="post">
		<input type="submit" value="체크아웃" />
	</form>
</body>
</html>
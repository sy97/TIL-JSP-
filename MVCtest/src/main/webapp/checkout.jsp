<%@page import="mybean.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="dto" class="mybean.model.Book" />
<%
//세션에 담아둔걸 꺼내오기.
ArrayList<Book> bookList = (ArrayList)session.getAttribute("bookList");
int totalprice = 0;
	for(Book b : bookList){
		totalprice += Integer.parseInt(b.getPrice()) * (b.getQuantity());
	}
%>
<body>
	<h1>도서 구매 주문 페이지</h1>
	<b>주문한 도서</b>
	<table border="1">
		<tr>
			<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th>
		</tr>
			<%
			if(bookList != null){
			for(Book b : bookList){
				
			%>
		<tr>
			<td><%=b.getTitle() %></td>
			<td><%=b.getAuthor() %></td>
			<td><%=b.getPrice() %></td>
			<td><%=b.getQuantity() %></td>
		</tr>	
			
			<%
			}
			}
			%>
		</tr>
		<tr>
		</tr>
	</table>
	<br>
	<b>전체 구입액수 : <%=totalprice %> 원</b>
	<br>
	<form method="post">
		<input type="submit" value="결제" />
	</form>
</body>
</html>
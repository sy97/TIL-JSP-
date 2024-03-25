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
<jsp:useBean id="dto" class="mybean.model.Book"/>
<%! 
//메서드가 실행될 때마다 생성되면 안되기 때문에 인스턴스 변수로 선언부에 한번만.
ArrayList<Book> bookList;
%>
<body>
	<%
		
		//bookshop에서 넘겨받은 옵션값 받아오기.
		String book = request.getParameter("book");
		String q = request.getParameter("quantity");


		/*
		if(book != null){
			String[] bookInfo = book.split("/");
			dto.setTitle(bookInfo[0].trim());
			dto.setAuthor(bookInfo[1].trim());
			dto.setPrice(bookInfo[2].trim());
		}
		*/
		if(book != null){
		
		StringTokenizer token = new StringTokenizer(book, "/");
		String title = token.nextToken().trim();
		String author = token.nextToken().trim();
		String price = token.nextToken().trim();
		
		int quantity = Integer.parseInt(q);
		
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setPrice(price);
		dto.setQuantity(quantity);
		
		//페이지가 생성될 때마다 arrayList가 생기면 전혀 쌓이지 않음.
		//세션이 없는 경우, 즉 처음일경우에만 ArrayList를 생성해서 저장해주면됨.
		//setattribute로 세션에 저장했으니까, getattribute는 null이 아니므로 ArrayList는 생성되지않고
		//세션에 저장되어있는 값이 나옴.
		bookList = (ArrayList)session.getAttribute("bookList");
		if(bookList == null){
			bookList = new ArrayList<Book>();
		}
		
		bookList.add(dto);
		session.setAttribute("bookList", bookList);
		}
	%>


	<b>현재 주문한 도서</b>
	<table border="1">
		<tr>
			<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th>
		</tr>
		<tr>	
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
	</table>
	<br>
	
	<!-- 구매 페이지로 -->
	<form action="/MVCtest/book?command=checkout" method="post">
		<input type="submit" value="체크아웃" />
	</form>
</body>
</html>
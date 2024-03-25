package mybean.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.model.Book;

//중간에서 통제할 서블릿 만들기.
@WebServlet("/book")
public class BookController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파라미터를 받아오는데, 그럼 어디서 오는 파라미터인지 어떻게알지? 각 페이지마다 요청이 다른데 이걸 어떻게 처리를 해줘야하나.
		//그래서 각 페이지 주소 적어줄 때 command 변수로 넘겨줌.
		req.setCharacterEncoding("utf-8");
		String command = req.getParameter("command");
		String url ="";
		
		//페이지가 생성될 때마다 arrayList가 생기면 전혀 쌓이지 않음.
		//세션이 없는 경우, 즉 처음일경우에만 ArrayList를 생성해서 저장해주면됨.
		//setattribute로 세션에 저장했으니까, getattribute는 null이 아니므로 ArrayList는 생성되지않고
		//세션에 저장되어있는 값이 나옴.
		//서블릿에서는 세션이렇게 사용해야함.
		
		HttpSession session = req.getSession();
		ArrayList<Book> bookList = (ArrayList)session.getAttribute("bookList");
		


		//그래서 각 요청에 따라 처리해주기.
		if(command.equals("shop")) {
			url = "bookshop.jsp";
			
			
		}
		else if(command.equals("cart")) {
			url = "bookshop.jsp";
			
			if(bookList == null){
				bookList = new ArrayList<Book>();
			}
			
			bookList.add(getBook(req));
			session.setAttribute("bookList", bookList);
		}
		
		else if(command.equals("checkout")) {
			url = "checkout.jsp";
		}
		
		//그래서 각 요청페이지로 보내주기.
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
		

		}	
	
	
	public Book getBook(HttpServletRequest req) {
		String book = req.getParameter("book");
		String q = req.getParameter("quantity");
		Book dto = new Book();
		StringTokenizer token = new StringTokenizer(book, "/");
		String title = token.nextToken().trim();
		String author = token.nextToken().trim();
		String price = token.nextToken().trim();
		
		int quantity = Integer.parseInt(q);
		
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setPrice(price);
		dto.setQuantity(quantity);
		
		return dto;
		
	}
	
	

}

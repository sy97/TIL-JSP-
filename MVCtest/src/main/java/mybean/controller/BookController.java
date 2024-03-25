package mybean.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//그래서 각 요청에 따라 처리해주기.
		if(command.equals("shop")) {
			url = "bookshop.jsp";
			
		}
		else if(command.equals("cart")) {
			url = "cart.jsp";
		}
		
		else if(command.equals("checkout")) {
			url = "checkout.jsp";
		}
		
		//그래서 각 요청페이지로 보내주기.
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
	
	

}

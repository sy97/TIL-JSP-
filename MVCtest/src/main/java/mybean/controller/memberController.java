package mybean.controller;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.model.Book;
import mybean.model.member;

@WebServlet("/member")
public class memberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		String url ="";
		
		if(command.equals("confirm")) {
			member dto = new member();
			dto.setId(req.getParameter("id"));
			dto.setPass(req.getParameter("pass"));
			dto.setEmail(req.getParameter("email"));

			//dto객체를 담아서 보내기.
			req.setAttribute("dto", dto);
			url = "/WEB-INF/member/registerConfirm.jsp";
			
			RequestDispatcher dispatcher 
			= req.getRequestDispatcher(url);
			
			dispatcher.forward(req, resp);
			
			
		}
		else if(command.equals("complete")) {
			url = "/WEB-INF/member/registerComplete.jsp";
		}
		
		else if(command.equals("register")) {
			url = "/WEB-INF/member/register.html";
		}
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
		
	}

	

}

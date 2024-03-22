package mybean.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybean.model.DepartmentBean;

@WebServlet("/depart") //http://localhost:8080/
public class DepartmentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//html로부터 요청을 받음
		String depart = req.getParameter("depart"); // depart 고객으로부터 요청 받음
		
		DepartmentBean bean = new DepartmentBean();
		//부서장(컨트롤러,서블릿)이 전달받은걸 김대리(모델,bean)한테 전달.
		ArrayList<String> advice = bean.getAdvice(depart);
		
		//탁자위에올려놔야함. 탁자위에 올려놓고 박사원한테 고객한테 보여주라고 시켜야함.
		//누구나 공유할수 있는 공유 책상위에 올려놔야함. 그 책상이 바로 request.
		//request라는 메모리에 결과를 올려놓음.
		//결과를 req에 올려놨으니, 박사원(dispatcher)가 고객에게 전달.
		
		//책상위에 올려놓음
		req.setAttribute("advice", advice);
		RequestDispatcher dispatcher 
		= req.getRequestDispatcher("/WEB-INF/view/depart_proc.jsp");
		
		//클라이언트에게 다시 보여줌.
		dispatcher.forward(req, resp);
	}
}
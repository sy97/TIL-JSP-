package mybean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/eltest.do")
public class test6_servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		
		//전달받은 john이라는 이름을 test7에게 어떻게 넘겨줄것인가?
		//view전에 적으면 안됨.
		//req.setAttribute("name", name);
		//이미 request 객체에 담겨있기 때문에 굳이 set으로 안담아도됨.
		req.setAttribute("visitCount", 100);
		String[] favoriteFoods = {"냉면", "돼지갈비", "순대국", "콩국수", "파스타"};
		req.setAttribute("foods", favoriteFoods);
		
		Person kang = new Person();
		Dog momo = new Dog();
		
		kang.setName("강소영");
		momo.setName("모모");
		
		//여기에 모모의 정보를 저장시켜줘야함.
		kang.setDog(momo);
		
		req.setAttribute("person", kang);
		
		
		RequestDispatcher view = req.getRequestDispatcher("test7.jsp");
		view.forward(req, resp);
		
		
	}
	
	

}

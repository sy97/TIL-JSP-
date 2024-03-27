package mybean;

import java.io.IOException;
import java.util.ArrayList;

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
		
		ArrayList<String> movies = new ArrayList<String>();
		movies.add("파묘");
		movies.add("해리포터");
		movies.add("라스트 홀리데이");
		
		//req로 담으려면 먼저 req로 보내줘야지!
		req.setAttribute("movies", movies);
		
		//원래는 DB연동해서 댓글 가져와야하는데 지금은 가져왔다고 가정.
		String[] comment = {" 이 사이트는 매우 훌륭합니다.",
				"정말 좋은 사이트인듯...",
				"자주 방문할게요."
		};
		
		req.setAttribute("com", comment);
		
		//RequestDispatcher view = req.getRequestDispatcher("test7.jsp");
		RequestDispatcher view = req.getRequestDispatcher("core/test4.jsp");
		view.forward(req, resp);
		
		
	}
	
	

}

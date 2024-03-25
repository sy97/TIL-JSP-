package mybean.model;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse res) {
		member dto = new member();
		dto.setId(req.getParameter("id"));
		dto.setPass(req.getParameter("pass"));
		dto.setEmail(req.getParameter("email"));

		//dto객체를 담아서 보내기.
		req.setAttribute("dto", dto);
		
		return "/WEB-INF/member/registerConfirm.jsp";
	}
	
	

}

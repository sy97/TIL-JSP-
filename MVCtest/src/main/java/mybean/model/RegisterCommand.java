package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterCommand implements ICommand {

	//인터페이스 상속받았으니까 오버라이딩 필수.
	@Override
	
	//왜 Object일까. 문자열로 처음부터해주었으면 편했을텐데. 이유는 미리 다양하게 쓸 수 있는 형태로 반환하게 해줌.
	
	public Object processCommand(HttpServletRequest req, HttpServletResponse res) {
		
		return "/WEB-INF/member/register.html";
	}
	
}

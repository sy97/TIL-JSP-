package mybean.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse res);
	//interface니까 내용구현 아니고 껍데기만 만드는것.

}

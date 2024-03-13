package simple;

public class MessageBean {
	private String msg;

	//값을 넣고 꺼내오려면 게터세터 있어야함.
	
	/*
	1.jsp에서는 강제적으로 게터메서드는 get을 붙여야함. 액션태그를 사용하기위해. 
	2.게터는 값을 꺼내줘야하는 목적이니까 void형이면 안됨.
	3.매개변수가 있으면 안됨.1
	*/
	public String getMsg() {
		return msg;
	}
	

	/*
	1.jsp에서는 강제적으로 세터메서드는 set을 붙여야함.
	2.set,get다음 오는 첫글자는 반드시 대문자
	3.반드시 void형이어야함. 값을 저장하는 기능으로만 쓰여야하니까.
	4.매개변수를 사용하지 않더라도, 반드시 써야함. 단, 매개변수는 한개.
	*/
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}

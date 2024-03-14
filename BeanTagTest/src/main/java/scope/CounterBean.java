package scope;

import javax.servlet.http.HttpSession;

public class CounterBean {
	private int visit = 0;

	public CounterBean() {
	
	}
	
	public void setNewVisit(int n) {
		//value에 넘겨준 값 받아오기
		visit = n;
	}
	
	public void setRestart(boolean b) {
		visit = 0;
	}
	
	public int getVisitCount() {
		//새로고침 누를 때마다 증가시키기
		if(visit != 1) {
			return visit++;
		}
		else {
			return visit;
		}
	}
}

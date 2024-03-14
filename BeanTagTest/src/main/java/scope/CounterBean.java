package scope;

public class CounterBean {
	private int count = 0;

	public void setNewVisit(int n) {
		//value에 넘겨준 값 받아오기
		count = n;
	}
	
	public void setRestart(boolean b) {
		count = 0;
	}
	
	public int getVisitCount() {
		//새로고침 누를 때마다 증가시키기
		return count++;
	}
}

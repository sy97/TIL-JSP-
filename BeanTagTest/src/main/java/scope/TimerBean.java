package scope;

public class TimerBean {
	private long startTime; //타이머를 리셋
	private long instTime; //객체생성되고나서 총 시간
	private long lastAccessTime; //프로퍼티에 마지막으로 접근한 시간
	//세개의 변수는 처음 시작될 때는 다 똑같은 시간이 저장되어있음.
	
	//똑같은 시간을 저장해주기위해 생성자에 초기화
	public TimerBean() {
		//시간을 확인만 하는게 아니라, 얼마나 지났는지 시작시간에서 끝나는 시간 빼줘야함.
		//시간을 숫자로 바꿔서 확인해야함.
		
		//현재시간을 초 단위로 환산해서 보여줌.
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
		//처음엔 다 똑같은 시간으로 시작 
		
		
	}
	
	//타이머가 리셋된 후에 경과된 시간.
	public long getElapsedTime() {
		//이 메서드를 호출했을 때 그 때가 몇시인지 확인해야 하기 때문에 다 메서드마다 적어줘야함.
		lastAccessTime = System.currentTimeMillis();
		
		//현재시간 - 리셋메서드호출된 시간 
		return (lastAccessTime-startTime) / 1000;
	}
	
	//boolean b는 형식을 맞춰주기 위한 임의의 매개변수.
	public void setRestart(boolean b) {
		lastAccessTime = System.currentTimeMillis();
		//타이머를 리셋한걸 알아야함.
		
		//스타트 타임에 다시 현재시간으로 재세팅 되어야함.
		startTime=System.currentTimeMillis();
	}
	
	//전체시간구하는 메서드.
	public long getElapsedTimeAfterInst() {
		lastAccessTime = System.currentTimeMillis();
		
		//이 메서드가 호출된 시간에서 시작 시간 빼주면 경과시간나옴.
		return (lastAccessTime - instTime) / 1000;
	}

	//빈의 프로퍼티 마지막 접근 후 경과시간
	public long getElapsedTimeAfterLastAccess() {
		//다른 프로퍼티가 호출되고나서의 시간은 lastAccessTime에 모두 저장되어있음.
		long current = System.currentTimeMillis();
		//lastAccessTime에서 현재시간 빼주기 
		long elapsed = (current - lastAccessTime) / 1000;
		
		lastAccessTime = System.currentTimeMillis();
		
		return elapsed;
	}
	

}

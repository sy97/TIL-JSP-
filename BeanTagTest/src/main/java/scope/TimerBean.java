package scope;

public class TimerBean {
	private long elapsedTime;
	private boolean restart;
	private long elapsedTimeAfterInst;
	private long elapsedTimeAfterAcess;
	

	public void setRestart(boolean restart) {
		this.restart = restart;
	}


	public long getElapsedTime() {
		return elapsedTime;
	}


	public long getElapsedTimeAfterInst() {
		return elapsedTimeAfterInst;
	}


	public long getElapsedTimeAfterLastAccess() {
		return elapsedTimeAfterAcess;
	}

	

	

}

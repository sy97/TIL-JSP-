package scope;

import java.util.Random;

public class DiceBean {
	private int min;
	private int max;
	private Random random = new Random();
	private int cnt;

	
	public DiceBean() {
		cnt++;
	}
	
	public void setMinNumber(int num) {
		this.min = num;
	}


	public void setMaxNumber(int num) {
		this.max = num;
	}


	public int getRandomNumber() {
		return random.nextInt(max-min+1) + min;
	}
	
	public int getCounter() {
		return cnt;
	}
	
}

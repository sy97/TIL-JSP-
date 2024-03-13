package scope;

import java.util.Random;

public class DiceBean {
	private int min;
	private int max;
	private Random random = new Random();
	private int cnt=0;


	
	public void setMinNumber(int num) {
		this.min = num;
	}


	public void setMaxNumber(int num) {
		this.max = num;
	}


	public int getRandomNumber() {
		return random.nextInt(max-min+1) + min;
	}
	
	//return이므로, 넘겨주고 증가하면 안되고 증가하고 넘겨줘야하니까 전위증가로.
	public int getCounter() {
		return ++cnt;
	}
	
}

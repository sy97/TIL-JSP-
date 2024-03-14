package mybean;

import java.util.ArrayList;

public class ParkingBean {
	//CarDto만 저장할 수 있게 generic으로 만들기.
	private ArrayList<CarDto> carList = new ArrayList<CarDto>();
	
	//입차
	//이 메서드가 호출될 때마다, cardto에 저장된 정보를 carList에 저장하도록.
	//출차는 그 반대.
	public void setEnter(String plate) {
	//메서드 호출 되면 carDto생성되어서 거기에 값 저장하고, 그걸 carList에 저장.
		carList.add(new CarDto(plate, System.currentTimeMillis()/1000)); 
	}
	
	//출차
	public void setExit(String plate) {
		
	}
	
	//입차되어있는 차 갯수 
	public int getCounter() {
		return carList.size();
	}
	
}

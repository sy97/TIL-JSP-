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
		carList.add(new CarDto(plate, System.currentTimeMillis())); 
	}
	
	//출차
	public void setExit(String plate) {
		//우리가 지금 가져온건 차량번호이고, 우리가 제거하려는건 carlist안에있는 배열인데 비교를 어떻게하지?
		//carlist안에있는건 cardto라는 뭉탱이임. 거기서 번호만 가져와서 비교해서 일치하면 삭제해야함.
		
		for(int i=0; i<carList.size(); i++) {
			//뭉탱이에서 차 번호만 가져오기.
			//equals로 비교해야됨. string이니까 !!
			if(plate.equals(carList.get(i).getPlateNumber())) {
				carList.remove(i);
				break;
			}
		}
	}
	
	//입차되어있는 차 갯수 
	public int getCounter() {
		return carList.size();
	}
	
	//제너릭하는걸 습관화하자.
	//이건 indexproperty. 배열 프로퍼티라서 표준액션태그로 가져올 수 없음.
	//이런 경우에는 어쩔수 없이 자바코드 써야함.
	public ArrayList<CarDto> getCarInfo() {
		return carList;
	}
}

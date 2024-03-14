package mybean;

public class CarDto {
	//이 두개를 묶어서 하나의 데이터처럼 쓰겠다.
	private String plateNumber;
	private long parkingTime;
	
	//차번호를 수정할 일 없으니 세터만들지 않고 생성자로 만들어주기.
	public CarDto(String plateNumber, long parkingTime) {
		this.plateNumber = plateNumber;
		this.parkingTime = parkingTime;
	}
	
	//생성자를 만들어두고나서는, 기본 생성자를 명시해두는게 좋음.
	public CarDto() {}
	
	
}


package mybean.dto;

public class Employee {
	//dto패턴으로 저장해서 이 정보가 필요할 때마다 꺼내쓸 수 있게.
	//실제 테이블명과 똑같이 해줘야 편리함.
	private String e_no;
	private String e_id;
	private String e_name;
	private String e_pass;
	private String e_address;
	
	
	
	public String getE_no() {
		return e_no;
	}
	public void setE_no(String e_no) {
		this.e_no = e_no;
	}
	
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	
	public String getE_id() {
		return e_id;
	}
	
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	
	public String getE_name() {
		return e_name;
	}
	
	public void setE_pass(String e_pass) {
		this.e_pass = e_pass;
	}
	
	public String getE_pass() {
		return e_pass;
	}
	
	public void setE_address(String e_address) {
		this.e_address = e_address;
	}
	
	
	public String getE_address() {
		return e_address;
	}
	
	
	
}

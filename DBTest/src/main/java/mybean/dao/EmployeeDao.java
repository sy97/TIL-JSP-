package mybean.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

import mybean.dto.Employee;

 	public class EmployeeDao{
 		private Connection conn;
		private PreparedStatement stmt;
		private ResultSet rs;
		
	//생성자로 DB연결되게.
	public EmployeeDao() {
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(url, "scott", "1111");			
	}
	catch(Exception err){
		System.out.println("연결 객체 생성 실패 : " +err);
		}
	}	
	
	
	//DB와의 작업을 하는 패턴을 dao라고함
	//사원 정보를 DB에 저장하는 기능을 할 메서드
	//이미 dto에 변수선언다 해놨으니까 변수는 여기서 가져와주면됨.
	public void setEmp(Employee emp) {
		String sql = "insert into tblEmp(e_no, e_id, e_name, e_pass, e_address)" 
				+ "values(seq_eno.nextVal, ?,?,?,?)";	
			
			//db연결은 항상 예외처리해주는것이 좋음. 어떤 일이 일어날지 모르니까.
			try {	
				stmt = conn.prepareStatement(sql);		
				
				stmt.setString(1, emp.getE_id());
				stmt.setString(2, emp.getE_name());
				stmt.setString(3, emp.getE_pass());
				stmt.setString(4, emp.getE_address());
			}
			
			catch(Exception err){
				System.out.println("setEmp(에서 오류 : " + err);
				
			}
		
		}
	
	}


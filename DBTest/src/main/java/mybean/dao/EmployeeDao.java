package mybean.dao;

/*
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;

import mybean.dto.Employee;

 	public class EmployeeDao{
 		
 		private Connection conn;
		private PreparedStatement stmt;
		private ResultSet rs;
		private String keyword;
		private String searchText;
		
		
	//생성자로 DB연결되게. 생성자로 해주기때문에 DB연결 메서드를 매번 써주지않아도됨.
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
	
	//close하는 메서드 매번 반복되니까 메서드로 만들어주기.
	public void freeConn() {
		if(conn != null) try {conn.close();} catch(Exception err) {};
		if(stmt != null) try {stmt.close();} catch(Exception err) {};
		if(rs != null) try {rs.close();} catch(Exception err) {};
		
	}
	
	
	//DB와의 작업을 하는 패턴을 dao라고함
	//사원 정보를 DB에 저장하는 기능을 할 메서드
	//이미 dto에 변수선언다 해놨으니까 변수는 여기서 가져와주면됨.
	//addEmp_proc.jsp
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
				
				stmt.executeUpdate();
			}
			
			catch(Exception err){
				System.out.println("setEmp()에서 오류 : " + err);
				
			}
			finally {
				//다 하고나면 연결을 끊어줘야함. 나 혼자 쓰는게 아니기 때문에.
				//얘도 예외처리를 해줘야함.
				freeConn();
			}
		
		}
	
	//updateEmp.jsp
	//여기서는 특정 데이터를 조회해서 꺼내보여줘야함.
	//사원번호를 받아서 비교해서 넘겨주기. 
	//여기는 return타입이 여러개이고, 매개변수가 어쩔수없이 있어야하기 때문에 액션태그로 불러올수없음.
	public Employee getEmp(String no) {
		
		//DB에서 조회
		String sql = "select * from tblEmp where e_no=?";	
			
		//db연결은 항상 예외처리해주는것이 좋음. 어떤 일이 일어날지 모르니까.
		//emp객체 생성한 후, 담아서 리턴.
		Employee emp = new Employee();
		
			try {	
				stmt = conn.prepareStatement(sql);		
				
				stmt.setString(1, no);
				//조회한 결과를 rs라는 변수에 저장
				rs = stmt.executeQuery();
				
				if(rs.next()) {
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
				}
			}
			
			catch(Exception err){System.out.println("getEmp()에서 오류 : " + err);}
			
			finally {
				freeConn();
				
			}
			//return은 try바깥에 있어야함.
			return emp;	

	}
	
	//updateEmp_proc.jsp
	//업데이트된 값을 DB에 저장하기.
	//매개변수가 단일값이 아니라 다중값이기 때문에 어차피 액션태그를 쓸 수 없음.
	public void updateEmp(Employee emp) {
		
		try{			
			//update문으로 바꿔보기
			String sql = "update tblEmp set e_name=?, e_pass=?, e_address=? where e_no=?";

			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_name());
			stmt.setString(2, emp.getE_pass());
			stmt.setString(3, emp.getE_address());
			stmt.setString(4, emp.getE_no());
			
			stmt.executeUpdate();

		}
		catch(Exception err){System.out.println("updateEmp()에서 오류 : " + err);}
	
		finally{
			freeConn();
		}
	}
	
	public void setDeleteEmp(String no) {
		
		try {
		//delete문으로 바꾸기
		String sql = "delete from tblEmp where e_no=?";

		stmt = conn.prepareStatement(sql);
		stmt.setString(1, no);
		
		stmt.executeUpdate();
		
		}
		
		catch(Exception err) {System.out.println("deleteEmp()에서 오류 : " +err);}
		finally {freeConn();}
		}

	
	//index.jsp 다중값이므로 인덱스프로퍼티로.
	public ArrayList<Employee> getList(String keyword, String searchText){
		String sql = "";
		ArrayList<Employee> list = new ArrayList<Employee>();
		
		try {
			if(searchText==null || searchText.isEmpty()){
				sql = "select * from tblEmp order by e_no";
			}
			
			//where다음에 공백줘야함!!!!!!!!!!
			else {
				sql = "select * from tblEmp where " + keyword +" like '%" + searchText +"%'";

			}
		
			stmt = conn.prepareStatement(sql);		
			
			rs = stmt.executeQuery();
			
			//있는 갯수만큼 돌려야하니까, while로. 
			while(rs.next()) {
			//db에서 받아온 정보를 dto set메서드에 저장시켜주고, 그걸 list배열에 담기.
			Employee emp = new Employee();
			emp.setE_no(rs.getString("e_no"));
			emp.setE_address(rs.getString("e_address"));
			emp.setE_id(rs.getString("e_id"));
			emp.setE_name(rs.getString("e_name"));
			emp.setE_pass(rs.getString("e_pass"));
			
			list.add(emp);
			}
		}
		
		catch(Exception err){System.out.println("getList()에서 오류 : " + err);}
	
		finally{
			freeConn();
		}
	
		return list;
	
	
	}
	
	
 }	
*/


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;

import mybean.DBConnectionMgr;
import mybean.dto.Employee;

 	public class EmployeeDao{
 		
 		private Connection conn;
		private PreparedStatement stmt;
		private ResultSet rs;
		private DBConnectionMgr pool;
		

	public EmployeeDao() {
	try {
		//직접 DB랑 연결하지 않음. DBCP를 이용.
		//DBCP의 위치 가져오기.
		pool = DBConnectionMgr.getInstance();
		//위치 확인 후 가서 빌려오기 
		conn = pool.getConnection();		
	}
	catch(Exception err){
		System.out.println("연결 객체 생성 실패 : " +err);
		}	
	
	//freeconnection 메서드 사용해주기.
	finally {pool.freeConnection(conn,stmt);}
	}
	//DB와의 작업을 하는 패턴을 dao라고함
	//사원 정보를 DB에 저장하는 기능을 할 메서드
	//이미 dto에 변수선언다 해놨으니까 변수는 여기서 가져와주면됨.
	//addEmp_proc.jsp
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
				
				stmt.executeUpdate();
			}
			
			catch(Exception err){
				System.out.println("setEmp()에서 오류 : " + err);
				
			}
			finally {pool.freeConnection(conn,stmt);}
		
		}
	
	//updateEmp.jsp
	//여기서는 특정 데이터를 조회해서 꺼내보여줘야함.
	//사원번호를 받아서 비교해서 넘겨주기. 
	//여기는 return타입이 여러개이고, 매개변수가 어쩔수없이 있어야하기 때문에 액션태그로 불러올수없음.
	public Employee getEmp(String no) {
		
		//DB에서 조회
		String sql = "select * from tblEmp where e_no=?";	
			
		//db연결은 항상 예외처리해주는것이 좋음. 어떤 일이 일어날지 모르니까.
		//emp객체 생성한 후, 담아서 리턴.
		Employee emp = new Employee();
		
			try {	
				stmt = conn.prepareStatement(sql);		
				
				stmt.setString(1, no);
				//조회한 결과를 rs라는 변수에 저장
				rs = stmt.executeQuery();
				
				if(rs.next()) {
				emp.setE_address(rs.getString("e_address"));
				emp.setE_id(rs.getString("e_id"));
				emp.setE_name(rs.getString("e_name"));
				emp.setE_pass(rs.getString("e_pass"));
				}
			}
			
			catch(Exception err){System.out.println("getEmp()에서 오류 : " + err);}
			
			finally {pool.freeConnection(conn,stmt, rs);}
			//return은 try바깥에 있어야함.
			return emp;	

	}
	
	//updateEmp_proc.jsp
	//업데이트된 값을 DB에 저장하기.
	//매개변수가 단일값이 아니라 다중값이기 때문에 어차피 액션태그를 쓸 수 없음.
	public void updateEmp(Employee emp) {
		
		try{			
			//update문으로 바꿔보기
			String sql = "update tblEmp set e_name=?, e_pass=?, e_address=? where e_no=?";

			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, emp.getE_name());
			stmt.setString(2, emp.getE_pass());
			stmt.setString(3, emp.getE_address());
			stmt.setString(4, emp.getE_no());
			
			stmt.executeUpdate();

		}
		catch(Exception err){System.out.println("updateEmp()에서 오류 : " + err);}
	
		finally {pool.freeConnection(conn,stmt);}
	}
	
	public void setDeleteEmp(String no) {
		
		try {
		//delete문으로 바꾸기
		String sql = "delete from tblEmp where e_no=?";

		stmt = conn.prepareStatement(sql);
		stmt.setString(1, no);
		
		stmt.executeUpdate();
		
		}
		
		catch(Exception err) {System.out.println("deleteEmp()에서 오류 : " +err);}
		finally {pool.freeConnection(conn,stmt);}
		}

	
	//index.jsp 다중값이므로 인덱스프로퍼티로.
	public ArrayList<Employee> getList(String keyword, String searchText){
		String sql = "";
		ArrayList<Employee> list = new ArrayList<Employee>();
		
		try {
			if(searchText==null || searchText.isEmpty()){
				sql = "select * from tblEmp order by e_no";
			}
			
			//where다음에 공백줘야함!!!!!!!!!!
			else {
				sql = "select * from tblEmp where " + keyword +" like '%" + searchText +"%'";

			}
		
			stmt = conn.prepareStatement(sql);		
			
			rs = stmt.executeQuery();
			
			//있는 갯수만큼 돌려야하니까, while로. 
			while(rs.next()) {
			//db에서 받아온 정보를 dto set메서드에 저장시켜주고, 그걸 list배열에 담기.
			Employee emp = new Employee();
			emp.setE_no(rs.getString("e_no"));
			emp.setE_address(rs.getString("e_address"));
			emp.setE_id(rs.getString("e_id"));
			emp.setE_name(rs.getString("e_name"));
			emp.setE_pass(rs.getString("e_pass"));
			
			list.add(emp);
			}
		}
		
		catch(Exception err){System.out.println("getList()에서 오류 : " + err);}
	
		finally {pool.freeConnection(conn,stmt,rs);}
	
		return list;
	
	
	}
	
	
 }	

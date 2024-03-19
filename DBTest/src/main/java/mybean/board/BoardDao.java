package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mybean.dto.Employee;

public class BoardDao {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BoardDao() {
	//어떤 DBCP를 이용할것인가.
		try {
			ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/EmployeeDB");
			conn = ds.getConnection();
		
		} 
		catch (Exception e) {
			System.out.println("DB연결 실패 : "  + e);
		}
	
	
	}
	
	public void freeConn() {
		if(conn != null) try {conn.close();} catch(Exception err) {};
		if(stmt != null) try {stmt.close();} catch(Exception err) {};
		if(rs != null) try {rs.close();} catch(Exception err) {};
			
	}

	private int b_num;
	private String b_name;
	private String b_email;
	private String b_homepage;
	private String b_subject;
	private String b_content;
	private String b_pass;
	private int b_count;
	private String b_ip;
	private String b_regdate;
	private int pos;
	private int depth;
	
	//PostProc.jsp 
	public void setEmp(BoardDto board) {
		String sql = "insert into tblBoard(b_num, b_name, b_email, b_homepage, b_subject, b_content, b_pass)" 
				+ "values(seq_b_num.nextVal, ?,?,?,?,?,?)";	
			
			//db연결은 항상 예외처리해주는것이 좋음. 어떤 일이 일어날지 모르니까.
			try {	
				stmt = conn.prepareStatement(sql);		
				
				//stmt.setString(1, board.setB_name());
				stmt.setString(1, board.getB_email());
				stmt.setString(1, board.getB_name());
				stmt.setString(1, board.getB_name());
				stmt.setString(1, board.getB_name());
				stmt.setString(1, board.getB_name());
	
				
				stmt.executeUpdate();
			}
			
			catch(Exception err){
				System.out.println("setEmp()에서 오류 : " + err);
				
			}
			finally {
				//pool.freeConnection(conn,stmt);
				freeConn();}
		
		}
	
	//list.jsp에서 사용하기 위한 메서드 준비
	public ArrayList<BoardDto> getBoardList(String keyword, String searchText){
		String sql = "";
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			if(searchText==null || searchText.isEmpty()){
				sql = "select * from tblBoard order by b_num";
			}
		
			else {
				sql = "select * from tblBoard where " + keyword +" like '%" + searchText +"%'";

			}
		
			stmt = conn.prepareStatement(sql);		
			rs = stmt.executeQuery();
			
			//있는 갯수만큼 돌려야하니까, while로. 
			while(rs.next()) {
			//db에서 받아온 정보를 dto set메서드에 저장시켜주고, 그걸 list배열에 담기.
			BoardDto board = new BoardDto();
			board.setB_num(rs.getInt("b_num"));
			board.setB_name(rs.getString("b_name"));
			board.setB_email(rs.getString("b_email"));
			board.setB_homepage(rs.getString("b_homepage"));
			board.setB_subject(rs.getString("b_subject"));
			board.setB_content(rs.getString("b_content"));
			board.setB_pass(rs.getString("b_pass"));
			board.setB_count(rs.getInt("b_count"));
			board.setB_regdate(rs.getString("b_regdate"));
			board.setPos(rs.getInt("pos"));
			board.setDepth(rs.getInt("depth"));
		
			
			list.add(board);
			}
		}
		
		catch(Exception err){System.out.println("getBoardList()에서 오류 : " + err);}
	
		finally {//pool.freeConnection(conn,stmt,rs);
			freeConn();
		}
	
		return list;
	
	
	}
	
}
	


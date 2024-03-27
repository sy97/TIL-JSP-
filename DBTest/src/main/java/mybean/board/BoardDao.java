package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	private int totalRecord = 0; //총 글의 갯수
	private int numPerPage = 5; //한 페이지당 보여질 글의 갯수
	private int totalPage = 0; // 총 페이지 수
	private int nowPage = 0; //현재 페이지번호
	private int beginPerPage = 0; //페이지별 시작번호. 1페이지에 1,2,3 있으면 2페이지는 4,5,6으로 나와야함. 현재페이지 번호 * 보여질 글의 갯수
	private int pagePerBlock = 3; //블럭당 페이지 수. 한 화면에 보여지는 페이지수.
	private int totalBlock = 0; //총 블럭 수
	private int nowBlock = 0; //현재 블럭. 첫번째 블럭이면 123, 두번째 블럭이면 456
	
	//0으로 되어있는 것들은 우리가 계산해줘야하는것들.
	
	
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
	public void setBoard(BoardDto dto){
		String sql = null;
		try {
		conn = ds.getConnection();
		
		//저장하기 전에 먼저 pos 업데이트.
		sql = 	"update tblboard set pos = pos + 1";
		stmt = conn.prepareStatement(sql);
		stmt.executeUpdate();
		
		sql =	"insert into tblboard(b_num," +
				"b_name, b_email, b_homepage, b_subject, b_content, " +
				"b_pass, b_count, b_ip, b_regdate, pos, depth) " +
				"values(seq_b_num.nextVal, ?,?,?,?,?,?, 0, ?, sysdate, ?, ?)";		
		
		stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, dto.getB_name());
		stmt.setString(2, dto.getB_email());
		stmt.setString(3, dto.getB_homepage());
		stmt.setString(4, dto.getB_subject());
		stmt.setString(5, dto.getB_content());
		stmt.setString(6, dto.getB_pass());
		stmt.setString(7, dto.getB_ip());
		stmt.setInt(8, dto.getPos());
		stmt.setInt(9, dto.getDepth());
		
		stmt.executeUpdate();
		}
		catch(Exception e) {
		System.out.println("setBoard : " + e);
		}
		finally {
		freeConn();
		}

}
	
	//read.jsp, update.jsp
	public BoardDto getBoard(int num) {
		
		//DB에서 조회
		String getsql = "select * from tblBoard where b_num=?";
		BoardDto board = new BoardDto();
			try {	
				stmt = conn.prepareStatement(getsql);		
				
				stmt.setInt(1, num);
				
				//조회한 결과를 rs라는 변수에 저장
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					board.setB_name(rs.getString("b_name"));
					board.setB_email(rs.getString("b_email"));
					board.setB_homepage(rs.getString("b_homepage"));
					board.setB_subject(rs.getString("b_subject"));
					board.setB_content(rs.getString("b_content"));
					board.setB_pass(rs.getString("b_pass"));
					board.setB_count(rs.getInt("b_count"));
					board.setB_regdate(rs.getString("b_regdate"));
					board.setB_ip(rs.getString("b_ip"));
					board.setPos(rs.getInt("pos"));
					board.setDepth(rs.getInt("depth"));
					
				
				}
			
				
			}
			
			catch(Exception err){System.out.println("getBoard()에서 오류 : " + err);}
			
			finally {freeConn();}
			//return은 try바깥에 있어야함.
			return board;	

	}
	
	//update_proc.jsp
	public void updateBoard(BoardDto dto) {
		
		try{			
			//update문으로 바꿔보기
			String sql = "update tblboard set b_name=?, b_email=?, " +
					"b_subject=?, b_content=? where b_num=?";
			conn = ds.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getB_name());
			stmt.setString(2, dto.getB_email());
			stmt.setString(3, dto.getB_subject());
			stmt.setString(4, dto.getB_content());
			stmt.setInt(5, dto.getB_num());
			
			stmt.executeUpdate();

		}
		catch(Exception err){System.out.println("updateBoard()에서 오류 : " + err);}
	
		finally {freeConn();}
	}
	
	//list.jsp에서 사용하기 위한 메서드 준비
	public List<BoardDto> getBoardList(String keyword, String searchText){
		String sql = "";
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			if(searchText==null || searchText.isEmpty()){
				sql = "select * from tblBoard order by pos";
			}
		
			else {
				sql = "select * from tblBoard where " + keyword +" like '%" + searchText +"%' order by b_num desc";

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
	
	public void deleteBoard(int b_num) {
		String sql = "delete from tblBoard where b_num=?";
		
		try {
		conn = ds.getConnection();
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, b_num);
		stmt.executeUpdate();
		
		}
		
		catch(Exception err) {System.out.println("deleteBoard()에서 오류 : " +err);}
		finally {freeConn();}
		}
	
	

	public void setCount(int num) {
		String sql = "update tblboard set b_count = b_count + 1 where b_num=?";

		try {
			conn = ds.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, num);
			
			stmt.executeUpdate();
			
		} 	
		catch(Exception err){System.out.println("setCount()에서 오류 : " + err);}
	
		finally {freeConn();}
	
	
	}
	
	//ReplyProc.jsp
	//답변 달 내용을 전달해야하니까 BoardDto dto로 받기.
	public void replyBoard(BoardDto dto) {
		String sql = null;
				try {
				//이 dto에 있는건 reply.jsp에서 히든태그로 넘겨준 부모의 pos.
				sql = "update tblBoard set pos = pos + 1 where pos > ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, dto.getPos());
				stmt.executeUpdate();
				
				sql =	"insert into tblboard(b_num," +
						"b_name, b_email, b_homepage, b_subject, b_content, " +
						"b_pass, b_count, b_ip, b_regdate, pos, depth) " +
						"values(seq_b_num.nextVal, ?, ?, ?, ?, ?, ?, 0, ?, sysdate, ?, ?)";		
				
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, dto.getB_name());
				stmt.setString(2, dto.getB_email());
				stmt.setString(3, dto.getB_homepage());
				stmt.setString(4, dto.getB_subject());
				stmt.setString(5, dto.getB_content());
				stmt.setString(6, dto.getB_pass());
				stmt.setString(7, dto.getB_ip());
				
				//지금 여기있는 pos와 depth는 아까 넘어온 부모의 pos와 depth.
				stmt.setInt(8, dto.getPos() + 1);
				stmt.setInt(9, dto.getDepth() + 1);
				
				stmt.executeUpdate();
				}
				catch(Exception e) {
				System.out.println("replyBoard : " + e);
				}
				finally {
				freeConn();
				}
		
	}
	
	
	public String useDepth(int depth) {
		String result = "";
		//depth*3은 공백을 얼마나 줄것인지.
		for(int i = 0; i<depth*3; i++) {
			result += "&nbsp;";
		}
		
		return result;
	}
	
}





























	


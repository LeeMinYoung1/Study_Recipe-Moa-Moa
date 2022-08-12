package moamoa.comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import moamoa.comment.CommentDTO;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public CommentDAO() {
		try {
			Class.forName(driver);
			System.out.println("오라클드라이버 성공");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("오라클드라이버 실패");
		}
	}
	/////////////connection
	public Connection getConnection() {
		
		try {
			conn=DriverManager.getConnection(url, "end", "end");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	
	public void write(CommentDTO dto) { //댓글 작성
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO post_comment(post_comment, post_title,  post_comment_writer, post_comment_wirte_date, post_comment_content) VALUES(?,?,?,sysdate,?)";
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPost_comment());
			//pstmt.setString(2, getDate());
			pstmt.setString(2, dto.getPost_title());
			pstmt.setString(3, dto.getPost_comment_writer());
			pstmt.setString(4, dto.getPost_comment_content());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<CommentDTO> makeCommentList(ResultSet rs) throws SQLException{ //댓글 목록 만들기
		List<CommentDTO> commentList = new ArrayList<>();
		while(rs.next()) {
			String code = rs.getString("post_comment");
			String title = rs.getString("post_title");
			String id = rs.getString("post_comment_writer");
			String date = rs.getString("post_comment_wirte_date");
			String content = rs.getString("post_comment_content");
			
			CommentDTO comment = new CommentDTO(code, title, id, date, content);
			commentList.add(comment);
		}//while----
		return commentList;
	}
	public List<CommentDTO> commentSet(String title) 
	throws SQLException{ //댓글 목록 선택하기
		try {		
			conn=null;
			pstmt = null;
			conn = getConnection();
			String sql="select * from post_comment where post_title like ?";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs=pstmt.executeQuery();
			
			return makeCommentList(rs);
			
			
		}finally {
			conn.close();
		}
	}
}
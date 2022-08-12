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
			System.out.println("����Ŭ����̹� ����");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("����Ŭ����̹� ����");
		}
	}
	/////////////connection
	public Connection getConnection() {
		
		try {
			conn=DriverManager.getConnection(url, "end", "end");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Ŀ�ؼǽ���");
		}
		
		return conn;
	}
	
	public void write(CommentDTO dto) { //��� �ۼ�
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO post_comment(post_comment, post_title,  post_comment_writer, post_comment_wirte_date, post_comment_content) VALUES(?,?,?,sysdate,?)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
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
	
	private List<CommentDTO> makeCommentList(ResultSet rs) throws SQLException{ //��� ��� �����
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
	throws SQLException{ //��� ��� �����ϱ�
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
package moamoa.post;

import java.awt.print.Printable;
import java.sql.*;
import java.util.*;

import moamoa.signup.SignupDAO;
import moamoa.signup.SignupDTO;

public class PostDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public PostDAO() {
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
//	public String getDate() { // �޼ҵ� ���� ��¥/�ð� return
//		String SQL="SELECT SYSDATE FROM DUAL";
//		try {
//		
//			pstmt=conn.prepareStatement(SQL);
//			rs=pstmt.executeQuery();
//			System.out.println(rs.getString(1));
//			if(rs.next()) {
//				return rs.getString(1); // ���� ��¥ ��ȯ
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}	
	
	public void write(PostDTO dto) { //�Խñ۾���
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO MILKITO_POST(post_title, post_write_date, post_ingredient, post_content, small_code) VALUES(?,sysdate,?,?,?)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			//pstmt.setString(2, getDate());
			pstmt.setString(2, dto.getIngredient());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getCategory());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public PostDTO getPost(String code) { // ��ȸ�� �Խñ� ��������
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="SELECT post_title, post_write_date, post_ingredient, post_content, small_code FROM MILKITO_POST WHERE post_title=?";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				PostDTO post=new PostDTO();
				post.setTitle(rs.getString(1));
				post.setDate(rs.getString(2));
				post.setIngredient(rs.getString(3));
				post.setContent(rs.getString(4));
				post.setCategory(rs.getString(5));
				System.out.println(post.getTitle());
				
				
				return post;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<PostDTO> getAllPostDatas(){ // �Խñ� ��� ��� ��������
		List<PostDTO> list = new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql = "select * from MILKITO_POST order by post_code asc";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				PostDTO dto = new PostDTO();
				
				dto.setPost_code(rs.getString("post_code"));
				dto.setTitle(rs.getString("post_title"));
				dto.setId(rs.getString("id"));
				dto.setIngredient(rs.getString("post_ingredient"));
				dto.setContent(rs.getString("post_content"));
				dto.setCategory(rs.getString("small_code"));
				dto.setDate(rs.getString("post_write_date"));
				list.add(dto);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args) {
		PostDAO dao = new PostDAO();
	}
}
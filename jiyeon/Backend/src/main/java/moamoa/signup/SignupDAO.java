package moamoa.signup;

import java.sql.*;
import java.util.*;

public class SignupDAO {

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public SignupDAO() {
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
		Connection conn = null;
		
		try {
			conn=DriverManager.getConnection(url, "TEST_USER", "12345");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	////////////insert
	public void signuplnsert(SignupDTO dto) { // 회원가입
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		//SQL 문 작성
		String sql = "insert INTO MEMBER(id, pwd, name, phone_num, email) values(?, ?, ?, ?, ?)";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getJoin_id());
			pstmt.setString(2, dto.getJoin_pw());
			pstmt.setString(3, dto.getJoin_name());
			pstmt.setString(4, (dto.getJoin_cell1() +"-"+ dto.getJoin_cell2() +"-"+ dto.getJoin_cell3()));
			pstmt.setString(5, (dto.getJoin_email0() +"@"+ dto.getJoin_email1()));
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	////////////select
	public Vector<SignupDTO> getAllMemberDatas(){
		Vector<SignupDTO> list = new Vector<SignupDTO>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		//SQL 문 작성
		String sql = "select * from MEMBER order by num asc";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SignupDTO dto = new SignupDTO();
				
				dto.setJoin_id(rs.getString("id"));
				dto.setJoin_pw(rs.getString("pwd"));
				dto.setJoin_name(rs.getString("name"));
				
				list.add(dto);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public boolean loginCheckId(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		//SQL 문 작성
		String sql = "select id from MEMBER where id=?";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public static void main(String[] args) {
		SignupDAO dao = new SignupDAO();
	}
	
}

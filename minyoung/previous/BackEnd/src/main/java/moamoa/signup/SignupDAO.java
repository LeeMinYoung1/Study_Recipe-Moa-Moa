package moamoa.signup;
/*DAO: Data 처리
DAO(Data Access Object)란 데이터베이스에 접속해서 데이터 수정, 삭제, 추가 등의 작업을 하는 클래스입니다.
일반적인 JSP 혹은 Servlet 페이지 내에서 위의 로직들을 함께 쓸 수 있지만 유지보수 및 코드의 모듈화를 위해 DAO라는 클래스를 따로 만들어 사용합니다.
DTO란 DAO클래스를 이용하여 데이터베이스에서 데이터를 관리할 때 데이터를 일반적인 변수에 저장하여 사용할 수 있지만 해당 데이터의 클래스를 만들어 사용합니다.

*/

import java.sql.*;
import java.util.*;

public class SignupDAO {
	
	String driver="oracle.jdbc.driver.OracleDriver"; //DB 켠다.
	String url="jdbc:oracle:thin:@localhost:1521:XE"; // DB 연결=connection
	
	//생성자
	public SignupDAO() {
		try {
			Class.forName(driver);
			System.out.println("오라클드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("오라클드라이버 실패");
		}
	}
	
	////////connection
	public Connection getConnection()
	{		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(url, "end", "end");
		} catch (SQLException e) {
			System.out.println("커넥션실패");
		}
		return conn;
	}
	
	//////insert
	public void SignupInsert(SignupDTO dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert INTO MEMBER(id, pwd, name, phone_num, email) values(?, ?, ?, ?, ?)";
		
		conn = getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//??에 대한 바인딩
			pstmt.setString(1/*물음표 안에 들어가는 순서*/, dto.getJoin_id());
			pstmt.setString(2, dto.getJoin_pw());
			pstmt.setString(3, dto.getJoin_name());
			pstmt.setString(4, (dto.getJoin_cell1() +"-"+ dto.getJoin_cell2() +"-"+ dto.getJoin_cell3()));
			pstmt.setString(5, dto.getJoin_email0() +"@"+ dto.getJoin_email1());
			
		
			
			//update
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		

	}

}

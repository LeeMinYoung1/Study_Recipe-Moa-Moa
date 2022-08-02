package moamoa.contract;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import moamoa.product.ProductDTO;

public class ContractDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public ContractDAO() {
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
			conn=DriverManager.getConnection(url, "TEST_USER", "12345");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	
	public void writeMealkit(ProductDTO dto) { //밀키트 작성
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO mealkit(mealkit_num, post_code, mealkit_title, mealkit_count, mealkit_price, mealkit_content, mealkit_sell_period, main_ingredient, addition_ingredient, view_count, mealkit_sort) VALUES(?,?,?,?,?,?,sysdate,?,?,?,?)";
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMealkit_num());
			pstmt.setString(2, dto.getPost_code());
			pstmt.setString(3, dto.getMealkit_title());
			pstmt.setInt(4, dto.getMealkit_count());
			pstmt.setInt(5, dto.getMealkit_price());
			pstmt.setString(6, dto.getMealkit_content());
			/* pstmt.setString(7, dto.getMealkit_sell_period()); */
			pstmt.setString(7, dto.getMain_ingredient());
			pstmt.setString(8, dto.getAddition_ingredient());
			pstmt.setInt(9, dto.getView_count());
			pstmt.setString(10, dto.getMealkit_sort());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void writeContract(ContractDTO dto) { //밀키트 계약서 작성
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO mealkit_rel_con(contract_code, id, mealkit_title, contract_day, contract_facts, milkit_registration_amount, contract_amount) VALUES(?,?,?,sysdate,?,?,?)";
	
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContract_code());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getMealkit_title());
			/* pstmt.setString(4, dto.getContract_day()); */
			pstmt.setString(4, dto.getContract_facts());
			pstmt.setInt(5, dto.getMilkit_registration_amount());
			pstmt.setInt(6, dto.getContract_amount());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

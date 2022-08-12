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
	
	public void writeMealkit(ProductDTO dto) { //��ŰƮ �ۼ�
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO mealkit(mealkit_num, post_code, mealkit_title, mealkit_count, mealkit_price, mealkit_content, mealkit_sell_period, main_ingredient, addition_ingredient, view_count, mealkit_sort) VALUES(?,?,?,?,?,?,sysdate,?,?,?,?)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
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
	public void writeContract(ContractDTO dto) { //��ŰƮ ��༭ �ۼ�
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO mealkit_rel_con(contract_code, id, mealkit_title, contract_day, contract_facts, milkit_registration_amount, contract_amount) VALUES(?,?,?,sysdate,?,?,?)";
	
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
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
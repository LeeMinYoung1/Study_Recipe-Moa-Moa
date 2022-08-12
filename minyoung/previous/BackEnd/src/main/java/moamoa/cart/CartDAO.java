package moamoa.cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import moamoa.post.PostDTO;
import moamoa.product.ProductDTO;

public class CartDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	String code ="";
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	private ArrayList<ProductDTO> listOfProducts = new ArrayList<>();
	
	public CartDAO() {
		try {
				Class.forName(driver);
				System.out.println("����Ŭ����̹� ����");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("����Ŭ����̹� ����");
		}
	}
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn=DriverManager.getConnection(url, "end", "end");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Ŀ�ؼǽ���");
		}
		
		return conn;
	}
	
	public void addCart(ProductDTO dto) { //��ٱ��Ͽ� ��ǰ �߰�
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO shopping_cart(cart_code, id, mealkit_num, mealkit_title, mealkit_count, mealkit_price, mem_sort) VALUES(?,?,?,?,?,?,?)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, "bu");
			pstmt.setString(2, "bu");
			pstmt.setString(3, dto.getMealkit_num());
			pstmt.setString(4, dto.getMealkit_title());
			pstmt.setInt(5, 1);
			pstmt.setInt(6, dto.getMealkit_price());
			pstmt.setString(7, "����");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public  ArrayList<CartDTO> getCartByid(String id) { // ��ٱ��Ͽ� ���̵� ���� ��� �����ֱ�
		ArrayList<CartDTO> list = new ArrayList<>();
		conn=null;
		pstmt = null;
		conn=getConnection();
		String SQL="SELECT cart_code, id, mealkit_num, mealkit_title, mealkit_count, mealkit_price, mem_sort FROM shopping_cart WHERE id=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setCart_code(rs.getString(1));
				cart.setId(rs.getString(2));
				cart.setMealkit_num(rs.getString(3));
				cart.setMealkit_title(rs.getString(4));
				cart.setMealkit_count(rs.getInt(5));
				cart.setMealkit_price(rs.getInt(6));
				cart.setMem_sort(rs.getString(7));
				list.add(cart);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public void DeleteCartByid(String id) { // ��ٱ��� ��� ����
		conn=null;
		pstmt = null;
		conn=getConnection();
		String SQL="delete FROM shopping_cart WHERE id=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
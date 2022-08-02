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
				System.out.println("오라클드라이버 성공");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("오라클드라이버 실패");
		}
	}
	
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
	
	public void addCart(ProductDTO dto) { //장바구니에 상품 추가
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO shopping_cart(cart_code, id, mealkit_num, mealkit_title, mealkit_count, mealkit_price, mem_sort) VALUES(?,?,?,?,?,?,?)";
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, "bu");
			pstmt.setString(2, "bu");
			pstmt.setString(3, dto.getMealkit_num());
			pstmt.setString(4, dto.getMealkit_title());
			pstmt.setInt(5, 1);
			pstmt.setInt(6, dto.getMealkit_price());
			pstmt.setString(7, "개인");
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public  ArrayList<CartDTO> getCartByid(String id) { // 장바구니에 아이디에 따라 목록 보여주기
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
	public void DeleteCartByid(String id) { // 장바구니 목록 삭제
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

package moamoa.product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import moamoa.post.PostDTO;
import moamoa.product.ProductDTO;

public class ProductDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	String code ="";
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	private ArrayList<ProductDTO> listOfProducts = new ArrayList<>();
	
	public ProductDAO() {
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
	public ProductDTO getProductByTitle(String t) {
		conn=getConnection();
		String SQL="SELECT mealkit_num, post_code, mealkit_title, mealkit_count, mealkit_price, mealkit_content, mealkit_sell_period, main_ingredient, addition_ingredient, view_count, mealkit_sort FROM mealkit WHERE mealkit_title=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,t);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setMealkit_num(rs.getString(1));
				product.setPost_code(rs.getString(2));
				product.setMealkit_title(rs.getString(3));
				product.setMealkit_count(rs.getInt(4));
				product.setMealkit_price(rs.getInt(5));
				product.setMealkit_content(rs.getString(6));
				product.setMealkit_sell_period(rs.getString(7));
				product.setMain_ingredient(rs.getString(8));
				product.setAddition_ingredient(rs.getString(9));
				product.setView_count(rs.getInt(10));
				product.setMealkit_sort(rs.getString(11));
				return product;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<ProductDTO> getAllProduct() {
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		conn=getConnection();
		
		String SQL="SELECT * FROM mealkit";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO product=new ProductDTO();
				product.setMealkit_num(rs.getString("mealkit_num"));
				product.setPost_code(rs.getString("post_code"));
				product.setMealkit_title(rs.getString("mealkit_title"));
				
				product.setMealkit_count(rs.getInt("mealkit_count"));
				product.setMealkit_price(rs.getInt("mealkit_price"));
				product.setMealkit_content(rs.getString("mealkit_content"));
			
				product.setMealkit_sell_period(rs.getString("mealkit_sell_period"));
				product.setMain_ingredient(rs.getString("main_ingredient"));
				
				product.setAddition_ingredient(rs.getString("addition_ingredient"));
				product.setView_count(rs.getInt("view_count"));
				product.setMealkit_sort(rs.getString("mealkit_sort"));
				
				list.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ProductDTO> getAllProducts() {
		return listOfProducts;
	}
}

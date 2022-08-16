package moamoa.search;

import java.sql.*;
import java.util.*;

import moamoa.post.PostDTO;
import moamoa.product.ProductDTO;

public class SearchDAO {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	String code ="";
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	public SearchDAO() {
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
//	
//	public ArrayList<PostDTO> getBoardSearch(int pageNum, int pageList, String keyWord, String searchWord) {
//		ArrayList<PostDTO> postList = new ArrayList<PostDTO>();
//		PostDTO post = null;
//		String sql = "select * from MILKITO_POST where "+keyWord+" like ?";
//		sql += " order by `group` desc, step asc limit ?,?";
//		//System.out.println(keyWord +"/"+ searchWord);
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, "%"+searchWord+"%");
//			pstmt.setInt(2, pageList*(pageNum -1));
//			pstmt.setInt(3, pageList);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				String code = rs.getString("post_code");
//				String title = rs.getString("post_title");
//				String id = rs.getString("id");
//				String ingredient = rs.getString("post_ingredient");
//				String content = rs.getString("post_content");
//				String category = rs.getString("small_code");
//				String date = rs.getString("post_write_date");
//				
//				post = new PostDTO(code, title, id, ingredient, content, category, date);
//				postList.add(post);
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return postList;
//	}
//	
	//--------------
	private List<PostDTO> makePostList(ResultSet rs) throws SQLException{ // 검색했던 게시글 리스트 가져오기
		List<PostDTO> postList = new ArrayList<>();
		while(rs.next()) {
			String code = rs.getString("post_code");
			String title = rs.getString("post_title");
			String id = rs.getString("id");
			String ingredient = rs.getString("post_ingredient");
			String content = rs.getString("post_content");
			String category = rs.getString("small_code");
			String date = rs.getString("post_write_date");
			
			PostDTO post = new PostDTO(code, title, id, ingredient, content, category, date);
			postList.add(post);
		}//while----
		return postList;
	}
	
	private List<ProductDTO> makeMealkitList(ResultSet rs) throws SQLException{ // 검색했던 밀키트 리스트 가져오기
		List<ProductDTO> mealkitList = new ArrayList<>();
		while(rs.next()) {
			String num = rs.getString("mealkit_num");
			String code = rs.getString("post_code");
			String title = rs.getString("mealkit_title");
			int count = rs.getInt("mealkit_count");
			int price = rs.getInt("mealkit_price");
			String content = rs.getString("mealkit_content");
			String sell_period = rs.getString("mealkit_sell_period");
			String main_ingredient = rs.getString("main_ingredient");
			String addition_ingredient = rs.getString("addition_ingredient");
			int view_count = rs.getInt("view_count");
			String sort = rs.getString("mealkit_sort");
			
			ProductDTO mealkit = new ProductDTO(num, code, title, count ,price, content, sell_period, main_ingredient, addition_ingredient, view_count, sort);
			mealkitList.add(mealkit);
		}//while----
		return mealkitList;
	}
	
	public List<PostDTO> findPost(String keyword) // 검색한 게시글 찾기
	throws SQLException{
		try {
			String colTitle="post_title";
			String colTable = "MILKITO_POST";
			
			
			conn = getConnection();
			//SQL 문 작성
			String sql="select * from "+colTable+" where "+colTitle+" like ?";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rs=pstmt.executeQuery();
			
			return makePostList(rs);
			
			
		}finally {
			conn.close();
		}
	}
	
	
	public List<PostDTO> findPostCategory(String keyword) // 카테고리에 해당하는 게시글 찾기
	throws SQLException{
		try {
			String colCategory="small_code";
			String colTable = "MILKITO_POST";
			
			
			conn = getConnection();
			//SQL 문 작성
			String sql="select * from "+colTable+" where "+colCategory+" like ?";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			rs=pstmt.executeQuery();
			
			return makePostList(rs);
			
			
		}finally {
			conn.close();
		}
	}
	
	/*---------------------------------------------------*/
	public List<ProductDTO> findMealkit(String keyword) // 검색한 밀키트 찾기
			throws SQLException{
				try {
					String colTitle="mealkit_title";
					String colTable = "MEALKIT";
					
					
					conn = getConnection();
					//SQL 문 작성
					String sql="select * from "+colTable+" where "+colTitle+" like ?";
					//System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					rs=pstmt.executeQuery();
					
					return makeMealkitList(rs);
				}finally {
					conn.close();
				}
			}
	
	
	public List<ProductDTO> findMealkitCategory(String keyword) // 카테고리에 해당하는 밀키트 찾기
			throws SQLException{
				try {
					String colTitle="mealkit_sort";
					String colTable = "MEALKIT";
					
					
					conn = getConnection();
					//SQL 문 작성
					String sql="select * from "+colTable+" where "+colTitle+" like ?";
					//System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					rs=pstmt.executeQuery();
					
					return makeMealkitList(rs);
				}finally {
					conn.close();
				}
			}
	//------------------
//	
//	public String getid(String keyWord, String searchWord) {
//		String sql = "select post_code from MILKITO_POST where " + keyWord + "like ?";
//	
//		conn=getConnection();
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, "%" + searchWord + "%");
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				code = rs.getString("post_code");
//			}
//			
//			pstmt.close();
//			conn.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return code;
//	}
}

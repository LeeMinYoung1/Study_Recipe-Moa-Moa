package board;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class BoardDBCP {
	
	// 데이터베이스 연결관련 변수 선언
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private DataSource ds = null;

		// JDBC 드라이버 로드 메소드
		public BoardDBCP() {
			try {
				InitialContext xtx = new InitialContext();
				ds = (DataSource) xtx.lookup("java:comp/env/jdbc/OracleDB");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 데이터베이스 연결 메소드
		public void connect() {
			try {
				con = ds.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 데이터베이스 연결 헤제 메소드
		public void disconnect() {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		// 게시판의 모든 레코드를 반환 메서드
		public ArrayList<BoardVO> getBoardList(BoardVO searchVO) {
			connect();
			ArrayList<BoardVO> list = new ArrayList<BoardVO>();
			String searchCondition = searchVO.getSearchCondition();
			String searchKeyword = searchVO.getSearchKeyword();

			String SQL = "";
			
			SQL = "SELECT SEQ, NAME, SUBJECT, EMAIL, COMM, HIT, TO_CHAR(REG_DT,'YYYY-MM-DD') AS REGDT FROM TB_BOARD ORDER BY SEQ DESC";
			
			if(searchKeyword != null) {
			       SQL = "SELECT SEQ, NAME, SUBJECT, EMAIL, COMM, HIT, TO_CHAR(REG_DT,'YYYY-MM-DD') AS REGDT ";
				   SQL+= "FROM TB_BOARD ";
				   SQL+= "WHERE 1=1 ";
				if(searchCondition.equals("1")) {
				   SQL+= "AND NAME LIKE '%" + searchKeyword + "%' ";
				}else if(searchCondition.equals("2")) {
				   SQL+= "AND SUBJECT LIKE '%" + searchKeyword + "%' ";
				}
				   SQL+= "ORDER BY SEQ DESC";
				   
			  }
			
			try {
				pstmt = con.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardVO VO = new BoardVO();
					VO.setSeq(rs.getInt("SEQ"));
					VO.setName(rs.getString("NAME"));
					VO.setSubject(rs.getString("SUBJECT"));
					VO.setEmail(rs.getString("EMAIL"));
					VO.setComm(rs.getString("COMM"));
					VO.setHit(rs.getInt("HIT"));
					VO.setRegDt(rs.getString("REGDT"));					
					// 리스트에 추가
					list.add(VO);
				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}
		
		public void updateHit(BoardVO VO) {
			connect();
			String SQL = "UPDATE TB_BOARD SET HIT = HIT + 1 WHERE 1=1 AND SEQ = ?";
			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, VO.getSeq());
				pstmt.executeUpdate();							
			} catch (SQLException e) {
				e.printStackTrace();				
			} finally {
				disconnect();
			}			
			
		}
		
		// 주 키 id의 레코드를 반환하는 메서드
		public BoardVO getBoard(BoardVO VO) {
			updateHit(VO);
			connect();
			String SQL = "SELECT SEQ, NAME, SUBJECT, EMAIL, COMM, HIT, TO_CHAR(REG_DT,'YYYY-MM-DD') AS REGDT FROM TB_BOARD WHERE 1=1 AND SEQ = ? ORDER BY SEQ DESC";
			//BoardVO VO = new BoardVO();

			try {
				pstmt = con.prepareStatement(SQL);
				pstmt.setInt(1, VO.getSeq());
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				VO.setSeq(rs.getInt("SEQ"));
				VO.setName(rs.getString("NAME"));
				VO.setSubject(rs.getString("SUBJECT"));
				VO.setEmail(rs.getString("EMAIL"));
				VO.setComm(rs.getString("COMM"));
				VO.setHit(rs.getInt("HIT"));
				VO.setRegDt(rs.getString("REGDT"));	
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return VO;
		}
		
		// 게시물 등록 메서드
		public boolean insertDB(BoardVO VO) {
			boolean success = false;
			connect();
			try {
			String SQL = "INSERT INTO TB_BOARD VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, 0, SYSDATE)";
			pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, VO.getName());
				pstmt.setString(2, VO.getSubject());
				pstmt.setString(3, VO.getEmail());
				pstmt.setString(4, VO.getComm());				
				pstmt.executeUpdate();
				success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			} finally {
				disconnect();
			}
			return success;
		}

		// 데이터 갱신을 위한 메서드
		public boolean updateDB(BoardVO VO) {
			boolean success = false;
			connect();
			String sql = "UPDATE TB_BOARD SET SUBJECT = ?, EMAIL = ?, COMM = ? WHERE SEQ = ?";
			try {
				pstmt = con.prepareStatement(sql);
				// 인자로 받은 GuestBook 객체를 이용해 사용자가 수정한 값을 가져와 SQL문 완성
				pstmt.setString(1, VO.getSubject());
				pstmt.setString(2, VO.getEmail());
				pstmt.setString(3, VO.getComm());	
				pstmt.setInt(4, VO.getSeq());
				int rowUdt = pstmt.executeUpdate();
				// System.out.println(rowUdt);
				if (rowUdt == 1)
					success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			} finally {
				disconnect();
			}
			return success;
		}
		
		// 게시물 삭제를 위한 메서드
		public boolean deleteDB(int seq) {
			boolean success = false;
			connect();
			String sql = "DELETE FROM TB_BOARD WHERE 1=1 AND SEQ = ?";
			try {
				pstmt = con.prepareStatement(sql);
				// 인자로 받은 주 키인 id 값을 이용해 삭제
				pstmt.setInt(1, seq);
				pstmt.executeUpdate();
				success = true;
			} catch (SQLException e) {
				e.printStackTrace();
				return success;
			} finally {
				disconnect();
			}
			return success;
		}
}


package com.dh.hobbyist.lesson.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.dh.hobbyist.common.model.vo.PageInfo;
import com.dh.hobbyist.suggest.model.vo.Category;

import static com.dh.hobbyist.common.JDBCTemplate.*;

public class LessonDao {
	private Properties prop = new Properties();
	
	public LessonDao() {
		String fileName = LessonDao.class.getResource("/sql/lesson/lesson-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//관심 수업 리스트 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectInterest(Connection con, int memberCode) {
		ArrayList<HashMap<String, Object>> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectInterest");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, memberCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
				hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
				hmap.put("totalOrders", rset.getInt("TOTAL_ORDERS"));
				hmap.put("costPerOrder", rset.getInt("COST_PER_ORDER"));
				hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
				hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
				hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
				hmap.put("petitionCode", rset.getInt("PETITION_PK"));
				hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("parentCode", rset.getInt("PARENT_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageMain", rset.getInt("IMAGE_MAIN"));
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	//리스트 카운트 메소드(유승)
	public int getListCount(Connection con, int parentCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, parentCode);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}
	
	//음악 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryMusic(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectMusicListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			/*ResultSetMetaData rsmd = rset.getMetaData();
			int index = rsmd.getColumnCount();
			
			if(rset.next()) {
				for(int i = 1; i <= index; i++) {
					System.out.println("열 이름 : " + rsmd.getColumnName(i));
				}
			}
		*/
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				/*hmap.put("parentCode", rset.getInt("PARENT_PK"));*/
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	
	//댄스 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryDance(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectDanceListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	
	//영상/사진 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryVideo(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectVideoListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	
	//라이스스타일 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryLife(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectLifeListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}
	
	//뷰티 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryBeauty(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectBeautyListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	//디자인 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryDesign(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectDesignListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	//스포츠 카테고리 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategorySports(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectSportsListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	//메인 페이지 인기수업 페이징 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectMainPopular(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query =  prop.getProperty("selectPopularListWithPaging");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("status", rset.getInt("STATUS"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageCode2", rset.getInt("img2_pk"));
				hmap.put("imageRoute2", rset.getString("img2_route"));
				hmap.put("imageName2", rset.getString("img2_name"));
				hmap.put("imageType2", rset.getString("img2_type"));
				hmap.put("region", rset.getString("REGION"));
				
				list.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
	}
	
	//
	public ArrayList<HashMap<String, Object>> selectMainInterest(Connection con, PageInfo pi, int memberCode) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<HashMap<String, Object>> list = null;
			HashMap<String, Object> hmap = null;
			
			String query =  prop.getProperty("selectInterestListWithPaging");
			
			try {
				pstmt = con.prepareStatement(query);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
				int endRow = startRow + pi.getLimit() - 1;
				
				pstmt.setInt(1, memberCode);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<HashMap<String, Object>>();
				
				
				while(rset.next()) {
					hmap = new HashMap<String, Object>();
					
					hmap.put("lessonCode", rset.getInt("LESSON_PK"));
					hmap.put("lessonName", rset.getString("LESSON_NAME"));
					hmap.put("status", rset.getInt("STATUS"));
					hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
					hmap.put("artistNick", rset.getString("ARTIST_NICK"));
					hmap.put("memberName", rset.getString("MEMBER_NAME"));
					hmap.put("imageCode", rset.getInt("IMAGE_PK"));
					hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
					hmap.put("imageName", rset.getString("IMAGE_NAME"));
					hmap.put("imageType", rset.getString("IMAGE_TYPE"));
					hmap.put("imageCode2", rset.getInt("img2_pk"));
					hmap.put("imageRoute2", rset.getString("img2_route"));
					hmap.put("imageName2", rset.getString("img2_name"));
					hmap.put("imageType2", rset.getString("img2_type"));
					hmap.put("region", rset.getString("REGION"));
					
					list.add(hmap);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
		
			return list;
	}
	
	
	//메인페이지 리스트 카운트 메소드(유승)
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int listCount = 0;
		
		String query = prop.getProperty("mainListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

}

package com.dh.hobbyist.lesson.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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
	//음악 카테고리  페이지 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryMusic(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMusic");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
				hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
				hmap.put("totalLessons", rset.getInt("TOTAL_LESSONS"));
				hmap.put("costPerLesson", rset.getInt("COST_PER_LESSON"));
				hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
				hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
				hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
				hmap.put("petitionCode", rset.getInt("PETITION_PK"));
				hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("parentCode", rset.getInt("PARENT_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				/*hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageMain", rset.getInt("IMAGE_MAIN"));*/
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}
	
	//댄스 카테고리  페이지 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryDance(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectDance");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
				hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
				hmap.put("totalLessons", rset.getInt("TOTAL_LESSONS"));
				hmap.put("costPerLesson", rset.getInt("COST_PER_LESSON"));
				hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
				hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
				hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
				hmap.put("petitionCode", rset.getInt("PETITION_PK"));
				hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("parentCode", rset.getInt("PARENT_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				/*hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageMain", rset.getInt("IMAGE_MAIN"));*/
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> selectCategoryVideo(Connection con) {
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectVideo");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
				hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
				hmap.put("totalLessons", rset.getInt("TOTAL_LESSONS"));
				hmap.put("costPerLesson", rset.getInt("COST_PER_LESSON"));
				hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
				hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
				hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
				hmap.put("petitionCode", rset.getInt("PETITION_PK"));
				hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
				hmap.put("parentCode", rset.getInt("PARENT_PK"));
				hmap.put("artistNick", rset.getString("ARTIST_NICK"));
				hmap.put("memberName", rset.getString("MEMBER_NAME"));
				/*hmap.put("imageCode", rset.getInt("IMAGE_PK"));
				hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
				hmap.put("imageName", rset.getString("IMAGE_NAME"));
				hmap.put("imageType", rset.getString("IMAGE_TYPE"));
				hmap.put("imageMain", rset.getInt("IMAGE_MAIN"));*/
				
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
	
		return list;
	}
	
		//뷰티 카테고리  페이지 메소드(유승)
		public ArrayList<HashMap<String, Object>> selectCategoryBeauty(Connection con) {
			Statement stmt = null;
			ArrayList<HashMap<String, Object>> list = null;
			HashMap<String, Object> hmap = null;
			ResultSet rset = null;
			
			String query = prop.getProperty("selectBeauty");
			
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					hmap = new HashMap<String, Object>();
					hmap.put("lessonCode", rset.getInt("LESSON_PK"));
					hmap.put("lessonName", rset.getString("LESSON_NAME"));
					hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
					hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
					hmap.put("totalLessons", rset.getInt("TOTAL_LESSONS"));
					hmap.put("costPerLesson", rset.getInt("COST_PER_LESSON"));
					hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
					hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
					hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
					hmap.put("petitionCode", rset.getInt("PETITION_PK"));
					hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
					hmap.put("status", rset.getString("STATUS"));
					hmap.put("categoryCode", rset.getInt("CATEGORY_PK"));
					hmap.put("parentCode", rset.getInt("PARENT_PK"));
					hmap.put("artistNick", rset.getString("ARTIST_NICK"));
					hmap.put("memberName", rset.getString("MEMBER_NAME"));
					/*hmap.put("imageCode", rset.getInt("IMAGE_PK"));
					hmap.put("imageRoute", rset.getString("IMAGE_ROUTE"));
					hmap.put("imageName", rset.getString("IMAGE_NAME"));
					hmap.put("imageType", rset.getString("IMAGE_TYPE"));
					hmap.put("imageMain", rset.getInt("IMAGE_MAIN"));*/
					
					list.add(hmap);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
		
			return list;
		}
	
	
	
	
	//카테고리별 페이지 리스트 메소드(유승)
	public ArrayList<HashMap<String, Object>> selectCategoryLessonList(Connection con, int parentCode) {
		ArrayList<HashMap<String, Object>> list = null;
		PreparedStatement pstmt = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, parentCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("lessonCode", rset.getInt("LESSON_PK"));
				hmap.put("lessonName", rset.getString("LESSON_NAME"));
				hmap.put("minStudents", rset.getInt("MIN_STUDENTS"));
				hmap.put("maxStudents", rset.getInt("MAX_STUDENTS"));
				hmap.put("totalLessons", rset.getInt("TOTAL_LESSONS"));
				hmap.put("costPerLesson", rset.getInt("COST_PER_LESSON"));
				hmap.put("totalCosts", rset.getInt("TOTAL_COSTS"));
				hmap.put("artistIntro", rset.getString("ARTIST_INTRO"));
				hmap.put("lessonIntro", rset.getString("LESSON_INTRO"));
				hmap.put("petitionCode", rset.getInt("PETITION_PK"));
				hmap.put("registeredDate", rset.getDate("REGISTERED_DATE"));
				hmap.put("status", rset.getString("STATUS"));
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

}

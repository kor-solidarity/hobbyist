package com.dh.hobbyist.suggest.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.dh.hobbyist.suggest.model.vo.Petition;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class SuggestDao {
	private Properties prop = new Properties();
	
	public SuggestDao() {
		String fileName = SuggestDao.class.getResource("/sql/suggest/suggest-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//건의 게시판 등록용 메소드
	public int insertSuggest(Connection con, Petition petition) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSuggest");
		//INSERT INTO LESSON_PETITION VALUES (LESSON_PETITION_SEQ.NEXTVAL, ?, ?, ?, ?, 
		//?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, ?, ?)
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, petition.getNumOfStudents());
			pstmt.setInt(2, petition.getCost());
			pstmt.setInt(3, petition.getNumOfLessons());
			pstmt.setString(4, petition.getLocation());
			pstmt.setDate(5, petition.getRequestedDate());
			pstmt.setString(6, petition.getRequestedDays());
			pstmt.setString(7, petition.getRequestTime());
			pstmt.setString(8, petition.getTitle());
			pstmt.setString(9, petition.getContents());
			pstmt.setInt(10, petition.getPetitionedMember());
			pstmt.setInt(11, petition.getCategoryCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}

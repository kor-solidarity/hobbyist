package com.dh.hobbyist.artist.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class ArtistDao {

	private Properties prop = new Properties();
	
	public ArtistDao() {
		String fileName = ArtistDao.class.getResource("/sql/artist/artist-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int nickCheck(Connection con, String nick) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nick);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return result;
	}
	
	//아티스트 전문 카테고리 삽입 메소드 
	public int insertCategory(Connection con, String memberPk, String[] details) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCategory");
		
		try {
			
			for(int i = 0; i < details.length; i++) {
				
				if(!details[i].equals("")) {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, Integer.parseInt(memberPk));
					pstmt.setString(2, details[i]);
					result = pstmt.executeUpdate();
				}
				
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	

}

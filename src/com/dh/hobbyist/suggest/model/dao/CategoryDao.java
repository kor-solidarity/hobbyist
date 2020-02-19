package com.dh.hobbyist.suggest.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.dh.hobbyist.common.JDBCTemplate.*;

public class CategoryDao {
	private Properties prop = new Properties();
	
	public CategoryDao() {
		String fileName = CategoryDao.class.getResource("/sql/suggest/suggest-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	//대분류 카테고리를 통해 소분류 카테고리들을 뽑아오는 메소드
	public ArrayList<String> selectDetailCategory(Connection con, int categoryCode) {
		PreparedStatement pstmt = null;
		ArrayList<String> list = null;
		ResultSet rset = null;
		int i = 0;
		String query = prop.getProperty("selectDetailCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, categoryCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			
			while(rset.next()) {
				String category = rset.getString("NODE_NAME");
				
				list.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

}

package com.dh.hobbyist.suggest.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.dh.hobbyist.suggest.model.vo.Category;

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
	public List<Category> selectDetailCategory(Connection con, int categoryCode) {
		PreparedStatement pstmt = null;
		List<Category> list = null;
		ResultSet rset = null;
		int i = 0;
		String query = prop.getProperty("selectDetailCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, categoryCode);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Category>();
			
			while(rset.next()) {
				Category c = new Category();
				c.setCategoryCode(rset.getInt("CATEGORY_PK"));
				c.setNodeDepth(rset.getInt("NODE_DEPTH"));
				c.setNodePath(rset.getString("NODE_PATH"));
				c.setNodeName(rset.getString("NODE_NAME"));
				c.setParentCode(rset.getInt("PARENT_PK"));
				c.setChildExist(rset.getInt("CHILD_EXIST"));
				
				list.add(c);
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
